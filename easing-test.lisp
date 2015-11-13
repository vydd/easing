;;;; easing-test.lisp

(in-package #:easing-test)

(defeasing custom (x)
  (if (<= x 0.5)
      (/ (1+ (truncate (* x 10))) 10)
      (/ (1+ (truncate (* x 4))) 4)))

(defsketch ease-test (:title "Easing" :width 1200 :height 600)
    ((rows 4)
     (cols 8)
     (frames 0))
  (background (gray 0.8))
  (setf frames (mod (1+ frames) 100))
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
	     ease-in-bounce ease-out-bounce ease-in-out-bounce
	     ease-in-custom)))
      (dotimes (y rows)
	(dotimes (x cols)
	  (with-identity-matrix
	    (ntranslate (* x (/ width cols)) (* y (/ height rows)))
	    (nscale (/ width cols) (/ height rows))
	    (with-pen (make-pen :fill (gray 1))
	      (rect 0.1 0.2 0.9 0.8))
	    (ntranslate 0.1 0.8)
	    (nscale 0.8 -0.6)
	    (when (consp funcs)
	      (draw-easing (car funcs) frames)
	      (setf funcs (cdr funcs)))))))))

(defun draw-easing (fn frames)
  (loop for i from 0 upto 0.99 by 0.01 do
       (line i (funcall fn i) (+ i 0.01) (funcall fn (+ i 0.01))))
  (with-pen (make-pen :fill (rgb 1 0 0))
    (ellipse 1.0 (funcall fn (/ frames 100)) 0.04 0.04)))

(defun test ()
  (make-instance 'ease-test))
