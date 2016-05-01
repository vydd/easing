;;;; easing-test.lisp

(in-package #:easing-test)

(defeasing custom (x)
  (if (<= x 0.5)
      (/ (1+ (truncate (* x 10))) 10)
      (/ (1+ (truncate (* x 4))) 4)))

(defparameter *easings*
  '(linear
    in-sine out-sine in-out-sine
    in-cubic out-cubic in-out-cubic
    in-quad out-quad in-out-quad
    in-quart out-quart in-out-quart
    in-quint out-quint in-out-quint
    in-exp out-exp in-out-exp
    in-circ out-circ in-out-circ
    in-elastic out-elastic in-out-elastic
    in-back out-back in-out-back
    in-bounce out-bounce in-out-bounce
    in-custom))

(defsketch test (:title "Easing" :width 1200 :height 600 :debug :scancode-f1 :y-axis :up)
    ((rows 4)
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

(defun test ()
  (make-instance 'test))
