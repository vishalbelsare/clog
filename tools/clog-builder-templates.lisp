(in-package :clog-tools)

(defun fill-button-clicked (panel)
  "Template fill botton clicked"
  (let* ((app (connection-data-item panel "builder-app-data"))
         (tmpl-rec  (find-if (lambda (x)
                               (equal (getf x :code)
                                      (value (template-box panel))))
                             *supported-templates*))
         (start-dir (format nil "~A~A"
                            (asdf:system-source-directory :clog)
                            (getf tmpl-rec :loc)))
         (www-dir   (format nil "~A~A"
                            (asdf:system-source-directory :clog)
                            (getf tmpl-rec :www))))
    (setf (hiddenp panel) t)
    (input-dialog
     (win panel) "Enter new system name:"
     (lambda (sys-name)
       (cond (sys-name
              (let ((fname  (if (uiop:directory-exists-p #P"~/common-lisp/")
                                #P"~/common-lisp/"
                                (car ql:*local-project-directories*))))
                (server-file-dialog
                 (win panel) "Output Directory" fname
                 (lambda (filename)
                   (cond (filename
                          (cond ((uiop:directory-exists-p (format nil "~A~A" filename sys-name))
                                 (clog-gui:alert-toast (win panel) "Cancel" "Canceled - Project directory exists")
                                 (window-close (win panel)))
                                (t
                                 (template-copy sys-name start-dir filename :panel (window-content (win panel)))
                                 (when (getf tmpl-rec :www)
                                   (template-copy sys-name www-dir filename :panel (window-content (win panel))))
                                 (asdf:clear-source-registry)
                                 (when (project-win app)
                                   (clog-gui:window-close (project-win app)))
                                 (on-show-project panel :project sys-name)
                                 (create-div (window-content (win panel)) :content "<hr><b>done.</b>"))))
                         (t
                          (window-close (win panel))))))))
             (t
              (window-close (win panel))))))))
