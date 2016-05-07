;;;; easing-test.asd

(asdf:defsystem #:easing-test
  :description "Easing functions test."
  :author "Danilo Vidovic (vydd)"
  :license "MIT"
  :depends-on (#:alexandria #:easing #:sketch #:fiveam)
  :serial t
  :components ((:file "package-test")
               (:file "easing-test")))
