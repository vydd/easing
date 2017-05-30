;;;; easing-demo.lisp

(in-package #:easing-demo)

(ease:defeasing custom (x)
  (if (<= x 0.5)
      (/ (1+ (truncate (* x 10))) 10)
      (/ (1+ (truncate (* x 4))) 4)))

(defparameter *easings*
  '(in-custom ease:linear
    ease:in-sine ease:out-sine ease:in-out-sine
    ease:in-cubic ease:out-cubic ease:in-out-cubic
    ease:in-quad ease:out-quad ease:in-out-quad
    ease:in-quart ease:out-quart ease:in-out-quart
    ease:in-quint ease:out-quint ease:in-out-quint
    ease:in-exp ease:out-exp ease:in-out-exp
    ease:in-circ ease:out-circ ease:in-out-circ
    ease:in-elastic ease:out-elastic ease:in-out-elastic
    ease:in-back ease:out-back ease:in-out-back
    ease:in-bounce ease:out-bounce ease:in-out-bounce))

(defsketch demo
    ((title "Easing demo")
     (width 1200)
     (height 600)
     (y-axis :up)
     (rows 4)
     (cols 8)
     (frames 0))
  (background (gray 0.8))
  (setf frames (mod (1+ frames) 100))
  (with-pen (make-pen :stroke (gray 0))
    (loop for fn in *easings*
       for x = 0 then (mod (1+ x) cols)
       for y = 0 then (+ y (if (zerop x) 1 0))
       do (progn
	    (with-identity-matrix
	      (translate (* x (/ width cols)) (* y (/ height rows)))
	      (with-font (make-font :size 12)
		(text (symbol-name fn) 14 10))
	      (scale (/ width cols) (/ height rows))
	      (translate 0.1 0.2)
	      (scale 0.8 0.6)
	      (draw-easing fn frames))))))

(defun draw-easing (fn frames)
  (with-pen (make-pen :fill (gray 1 0.8) :stroke (gray 0 0.2) :weight 0.01)
    (rect 0 0 1 1))
  (with-pen (make-pen :stroke +black+ :weight 0.01)
    (apply #'polyline (loop for i upto 0.99 by 0.01 append (list i (funcall fn i)))))
  (with-pen (make-pen :fill +red+)
    (circle 1.0 (funcall fn (/ frames 100)) 0.04)))

(defun demo ()
  (make-instance 'demo))
