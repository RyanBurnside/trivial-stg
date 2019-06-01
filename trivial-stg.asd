;;;; trivial-stg.asd

(asdf:defsystem #:trivial-stg
  :description "A demonstration STG game in trivial-gamekit"
  :author "Ryan Burnside"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (trivial-gamekit trivial-gamekit-postproc)
  :components ((:file "package")
               (:file "trivial-stg")
	       ;; New files come below ... 
	       (:file "classes")))

