;;;; easing-test.lisp

(in-package #:easing-test)

(defsketch ease-test (:title "Easing" :width 1200 :height 600)
    ((rows 4)
     (cols 8))
  (background (gray 0.8))
  (with-pen (make-pen :stroke (gray 0))
    (let ((funcs 	   
	   '(linear
	     ease-in-sine ease-out-sine ease-in-out-sine
	     ease-in-cubic ease-out-cubic ease-in-out-cubic
	     ease-in-quad ease-out-quad ease-in-out-quad
	     ease-in-quart ease-out-quart ease-in-out-quart
	     ease-in-quint ease-out-quint ease-in-out-quint
	     ease-in-exp ease-out-exp ease-in-out-exp
	     ease-in-circ ease-out-circ ease-in-out-circ
	     ease-in-elastic ease-out-elastic ease-in-out-elastic
	     ease-in-back ease-out-back ease-in-out-back
	     ease-in-bounce ease-out-bounce ease-in-out-bounce)))
      (dotimes (y rows)
	(dotimes (x cols)
	  (with-identity-matrix
	    (translate (* x (/ width cols)) (* y (/ height rows)))
	    (scale (/ width cols) (/ height rows))
	    (with-pen (make-pen :fill (gray 1))
	      (rect 0.1 0.1 0.9 0.9))
	    (translate 0.1 0.9)
	    (scale 0.8 -0.8)
	    (when (consp funcs)
	      (draw-easing (car funcs))
	      (setf funcs (cdr funcs)))))))))

(defun draw-easing (fn)
  (loop for i from 0 upto 0.99 by 0.01 do
       (line i (funcall fn i) (+ i 0.01) (funcall fn (+ i 0.01)))))

(defun test ()
  (make-instance 'ease-test))
