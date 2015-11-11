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
