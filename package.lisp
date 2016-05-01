;;;; package.lisp

(defpackage #:easing
  (:use #:cl)
  (:export :defeasing :linear
	   :ease-in-sine :ease-out-sine :ease-in-out-sine
	   :ease-in-cubic :ease-out-cubic :ease-in-out-cubic
	   :ease-in-quad :ease-out-quad :ease-in-out-quad
	   :ease-in-quart :ease-out-quart :ease-in-out-quart
	   :ease-in-quint :ease-out-quint :ease-in-out-quint
	   :ease-in-exp :ease-out-exp :ease-in-out-exp
	   :ease-in-circ :ease-out-circ :ease-in-out-circ
	   :ease-in-elastic :ease-out-elastic :ease-in-out-elastic
	   :ease-in-back :ease-out-back :ease-in-out-back
	   :ease-in-bounce :ease-out-bounce :ease-in-out-bounce))

(defpackage #:easing-single-float
  (:use #:cl)
  (:export :defeasing-f :linear-f
	   :ease-in-sine-f :ease-out-sine-f :ease-in-out-sine-f
	   :ease-in-cubic-f :ease-out-cubic-f :ease-in-out-cubic-f
	   :ease-in-quad-f :ease-out-quad-f :ease-in-out-quad-f
	   :ease-in-quart-f :ease-out-quart-f :ease-in-out-quart-f
	   :ease-in-quint-f :ease-out-quint-f :ease-in-out-quint-f
	   :ease-in-exp-f :ease-out-exp-f :ease-in-out-exp-f
	   :ease-in-circ-f :ease-out-circ-f :ease-in-out-circ-f
	   :ease-in-elastic-f :ease-out-elastic-f :ease-in-out-elastic-f
	   :ease-in-back-f :ease-out-back-f :ease-in-out-back-f
	   :ease-in-bounce-f :ease-out-bounce-f :ease-in-out-bounce-f))
