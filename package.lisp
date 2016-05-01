;;;; package.lisp

(defpackage #:easing
  (:use #:cl)
  (:export :defeasing :linear
	   :in-sine :out-sine :in-out-sine
	   :in-cubic :out-cubic :in-out-cubic
	   :in-quad :out-quad :in-out-quad
	   :in-quart :out-quart :in-out-quart
	   :in-quint :out-quint :in-out-quint
	   :in-exp :out-exp :in-out-exp
	   :in-circ :out-circ :in-out-circ
	   :in-elastic :out-elastic :in-out-elastic
	   :in-back :out-back :in-out-back
	   :in-bounce :out-bounce :in-out-bounce))

(defpackage #:easing-f
  (:use #:cl)
  (:export :defeasing :linear
	   :in-sine :out-sine :in-out-sine
	   :in-cubic :out-cubic :in-out-cubic
	   :in-quad :out-quad :in-out-quad
	   :in-quart :out-quart :in-out-quart
	   :in-quint :out-quint :in-out-quint
	   :in-exp :out-exp :in-out-exp
	   :in-circ :out-circ :in-out-circ
	   :in-elastic :out-elastic :in-out-elastic
	   :in-back :out-back :in-out-back
	   :in-bounce :out-bounce :in-out-bounce))
