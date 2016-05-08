;;;; easing-demo.asd

(asdf:defsystem #:easing-demo
  :description "Easing functions demo."
  :author "Danilo Vidovic (vydd)"
  :license "MIT"
  :depends-on (#:easing #:sketch)
  :pathname "demo"
  :serial t
  :components ((:file "package-demo")
               (:file "easing-demo")))
