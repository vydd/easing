;;;; easing.asd

(asdf:defsystem #:easing
  :description "Easing functions."
  :author "Danilo Vidovic (vydd)"
  :license "MIT"
  :depends-on (#:alexandria)
  :pathname "src"
  :serial t
  :components ((:file "package")
               (:file "easing")
	       (:file "easing-single-float")))
