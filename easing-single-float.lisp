;;;; easing.lisp

(in-package #:easing-single-float)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant pi-sf 3.141592653589793s0))

(defmacro defeasing-f (name args &body body)
  (let ((x (or (car args) 'x))
	(arg-names (remove-if (lambda (x) (char= (aref (symbol-name x) 0) #\&))
			      (mapcar (lambda (x) (if (listp x) (first x) x))
				      args)))
	(declaim-args (mapcar (lambda (x)
				(if (and (symbolp x)
					 (char= (aref (symbol-name x) 0) #\&))
				    x
				    'single-float))
			      args))
	(ease-in (alexandria:symbolicate 'ease-in- name :-f))
	(ease-out (alexandria:symbolicate 'ease-out- name :-f))
	(ease-in-out (alexandria:symbolicate 'ease-in-out- name :-f)))
    `(progn
       ;; in
       (declaim (inline ,ease-in)
		(ftype (function ,declaim-args single-float) ,ease-in))
       (defun ,ease-in ,args
	 (declare (optimize (speed 3) (safety 0) (debug 0))
		  (single-float ,@arg-names)
		  (inline + - / *))
	 (cond ((>= 0s0 ,x) 0s0)
	       ((<= 1s0 ,x) 1s0)
	       (t ,@body)))
       ;; out
       (declaim (inline ,ease-out)
		(ftype (function ,declaim-args single-float) ,ease-out))
       (defun ,ease-out ,args
	 (declare (optimize (speed 3) (safety 0) (debug 0))
		  (single-float ,@arg-names)
		  (inline + - / *))
	 (cond ((>= 0s0 ,x) 0s0)
	       ((<= 1s0 ,x) 1s0)
	       (t (let ((,x (- 1s0 ,x)))
		    (the single-float
			 (+ 1s0 (- ,@body)))))))
       ;; in-out
       (declaim (inline ,ease-in-out)
		(ftype (function ,declaim-args single-float) ,ease-in-out))
       (defun ,ease-in-out ,args
	 (declare (optimize (speed 3) (safety 0) (debug 0))
		  (single-float ,@arg-names)
		  (inline + - / *))
	 (cond ((>= 0s0 ,x) 0s0)
	       ((<= 1s0 ,x) 1s0)
	       (t (the single-float
		       (if (<= ,x 0.5s0)
			   (let ((,x (* 2s0 ,x)))
			     (/ ,@body 2s0))
			   (let ((,x (- 1s0 (* 2s0 (- ,x 0.5s0)))))
			     (+ 0.5s0 (/ (+ 1s0 (- ,@body))
					 2s0)))))))))))

;; The float versions

(declaim (inline linear-f)
         (ftype (function (single-float) single-float) linear-f))
(defun linear-f (x)
  (declare (optimize (speed 3) (safety 0) (debug 0))
	   (single-float x))
  x)

(defeasing-f sine (x)
  (- 1s0 (cos (* x (/ pi-sf 2s0)))))

(defeasing-f quad (x)
  (* x x))

(defeasing-f cubic (x)
  (* x x x))

(defeasing-f quart (x)
  (expt x 4s0))

(defeasing-f quint (x)
  (expt x 5s0))

(defeasing-f exp (x)
  (expt 2s0 (* 10s0 (- x 1s0))))

(defeasing-f circ (x)
  (- (- (the single-float (sqrt (- 1s0 (* x x)))) 1s0)))

(defeasing-f elastic (x &optional (p 0.3s0) (s 0s0 set-s))
  (let ((s (if set-s s (* (asin 1s0) (* p #.(/ 1s0 (* 2s0 pi-sf)))))))
    (- (* (expt 2 (* 10 (- x 1s0))) (sin (/ (* (- (- x 1s0) s) (* 2 pi-sf)) p))))))

(defeasing-f back (x &optional (s 1.70158s0))
  (* x x (- (* (+ 1s0 s) x) s)))

(defeasing-f bounce (x &optional (c1 7.5625))
  (let ((x (- 1s0 x)))
    (- 1s0 (cond ((< x (/ 1s0 2.75)) (* c1 x x))
		 ((< x (/ 2s0 2.75s0)) (let ((x (- x (/ 1.5s0 2.75s0))))
					 (+ 0.75s0 (* c1 x x))))
		 ((< x (/ 2.5s0 2.75s0)) (let ((x (- x (/ 2.25 2.75))))
					   (+ 0.9375s0 (* c1 x x))))
		 (t (let ((x (- x (/ 2.625s0 2.75s0))))
		      (+ 0.984375s0 (* c1 x x))))))))
