;;;; easing.lisp

(in-package #:easing)

(defmacro defeasing (name args &body body)
  (let ((x (or (car args) 'x)))
    `(progn
       (defun ,(alexandria:symbolicate 'ease-in- name) ,args
	 (cond ((>= 0 ,x) 0)
	       ((<= 1 ,x) 1)
	       (t ,@body)))
       (defun ,(alexandria:symbolicate 'ease-out- name) ,args
	 (cond ((>= 0 ,x) 0)
	       ((<= 1 ,x) 1)
	       (t (let ((,x (- 1 ,x)))
		    (1+ (- ,@body))))))
       (defun ,(alexandria:symbolicate 'ease-in-out- name) ,args
	 (cond ((>= 0 ,x) 0)
	       ((<= 1 ,x) 1)
	       (t (if (<= ,x 0.5)
		      (let ((,x (* 2 ,x)))
			(/ ,@body 2))
		      (let ((,x (- 1 (* 2 (- ,x 0.5)))))
			(+ 0.5 (/ (+ 1 (- ,@body)) 2))))))))))

;; Default easings are Robert Penner's easing functions

(defun linear (x) x)

(defeasing sine (x)
  (- 1 (cos (* x (/ PI 2)))))

(defeasing quad (x)
  (* x x))

(defeasing cubic (x)
  (* x x x))

(defeasing quart (x)
  (expt x 4))

(defeasing quint (x)
  (expt x 5))

(defeasing exp (x)
  (expt 2 (* 10 (- x 1))))

(defeasing circ (x)
  (- (- (sqrt (- 1 (* x x))) 1)))

(defeasing elastic (x &optional (p 0.3) (s nil))
  (let ((s (or s (* (asin 1) (/ p (* 2 PI))))))
    (- (* (expt 2 (* 10 (- x 1))) (sin (/ (* (- (- x 1) s) (* 2 PI)) p))))))

(defeasing back (x &optional (s 1.70158))
  (* x x (- (* (+ 1 s) x) s)))

(defeasing bounce (x &optional (c1 7.5625))
  (let ((x (- 1 x)))
    (- 1 (cond ((< x (/ 1 2.75)) (* c1 x x))
	       ((< x (/ 2 2.75)) (let ((x (- x (/ 1.5 2.75))))
				   (+ 0.75 (* c1 x x))))
	       ((< x (/ 2.5 2.75)) (let ((x (- x (/ 2.25 2.75))))
				     (+ 0.9375 (* c1 x x))))
	       (t (let ((x (- x (/ 2.625 2.75))))
		    (+ 0.984375 (* c1 x x))))))))
