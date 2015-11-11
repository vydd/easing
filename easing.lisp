;;;; easing.lisp

(in-package #:easing)

(defmacro make-easing (name &body body)
  `(progn
     (defun ,(alexandria:symbolicate 'ease-in- name) (x)
       (cond ((>= 0 x) 0)
	     ((<= 1 x) 1)
	     (t ,@body)))
     (defun ,(alexandria:symbolicate 'ease-out- name) (x)
       (cond ((>= 0 x) 0)
	     ((<= 1 x) 1)
	     (t (let ((x (- 1 x)))
		  (1+ (- ,@body))))))
     (defun ,(alexandria:symbolicate 'ease-in-out- name) (x)
       (cond ((>= 0 x) 0)
	     ((<= 1 x) 1)
	     (t (if (<= x 0.5)
		    (let ((x (* 2 x)))
		      (/ ,@body 2))
		    (let ((x (- 1 (* 2 (- x 0.5)))))
		      (+ 0.5 (/ (+ 1 (- ,@body)) 2)))))))))

(defun linear (x) x)

(make-easing sine (- 1 (cos (* x (/ PI 2)))))

(make-easing cubic (* x x))

(make-easing quad (* x x x))

(make-easing quart (expt x 4))

(make-easing quint (expt x 5))

(make-easing exp (expt 2 (* 10 (- x 1))))

(make-easing circ (- (- (sqrt (- 1 (* x x))) 1)))

(make-easing elastic
  (let* ((p 0.3) (s (* (asin 1) (/ p (* 2 PI)))))
    (- (* (expt 2 (* 10 (- x 1))) (sin (/ (* (- (- x 1) s) (* 2 PI)) p))))))

(make-easing back
  (let ((s 1.70158))
    (* x x (- (* (+ 1 s) x) s))))

(make-easing bounce
  (let ((c1 7.5625) (x (- 1 x)))
    (- 1 (cond ((< x (/ 1 2.75)) (* c1 x x))
	       ((< x (/ 2 2.75)) (let ((x (- x (/ 1.5 2.75))))
				   (+ 0.75 (* c1 x x))))
	       ((< x (/ 2.5 2.75)) (let ((x (- x (/ 2.25 2.75))))
				     (+ 0.9375 (* c1 x x))))
	       (t (let ((x (- x (/ 2.625 2.75))))
		    (+ 0.984375 (* c1 x x))))))))




