(defpackage #:clog-user
  (:use #:cl #:clog)
  (:export start-tutorial))

(in-package :clog-user)

(defun start-tutorial ()
  "Start tutorial."
  (format t "Tutorial 13 is a how to on building your own clog appliction.~%~
             Copy the directory - ~A~%~
             to your ~~/common-lisp directory or other asdf / quicklisp~%~
             directory. Then follow the directions in the 13-tutorial ~%~
            directory."
	  (merge-pathnames "./tutorial/13-tutorial"
			   (asdf:system-source-directory :clog))))