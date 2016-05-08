;;;; easing-test.asd

(asdf:defsystem #:easing-test
  :description "Easing functions test."
  :author "Danilo Vidovic (vydd)"
  :license "MIT"
  :depends-on (#:easing #:fiveam)
  :pathname "t"
  :serial t
  :components ((:file "package-test")
               (:file "easing-test")))
