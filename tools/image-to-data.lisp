(in-package "CLOG-TOOLS")
(defclass image-to-data (clog:clog-panel)
          ((submit-8 :reader submit-8) (file-2 :reader file-2)
           (form-7 :reader form-7)))
(defun create-image-to-data
       (clog-obj &key (hidden nil) (class nil) (html-id nil) (auto-place t))
  (let ((panel
         (change-class
          (clog:create-div clog-obj :content
                           "<form action=\"/image-to-data\" onsubmit=\"return false;\" enctype=\"multipart/form-data\" target=\"_blank\" style=\"box-sizing: content-box; position: static; width: 385px; height: 121px; left: 14px; top: 0px;\" method=\"post\" id=\"CLOGB3868051673\" data-clog-name=\"form-7\"><input type=\"FILE\" value=\"\" style=\"box-sizing: content-box; position: absolute; left: 38px; top: 29px;\" accept=\"image/*\" class=\"\" name=\"filename\" size=\"20\" id=\"CLOGB3868051674\" data-clog-name=\"file-2\"><input type=\"SUBMIT\" value=\"Convert Image to Data\" style=\"box-sizing: content-box; position: absolute; left: 38px; top: 67px; width: 188.922px; height: 22.5px;\" placeholder=\"\" id=\"CLOGB3868051675\" data-clog-name=\"submit-8\"></form>"
                           :hidden hidden :class class :html-id html-id
                           :auto-place auto-place)
          'image-to-data)))
    (setf (slot-value panel 'submit-8)
            (attach-as-child clog-obj "CLOGB3868051675" :clog-type
             'clog:clog-form-element :new-id t))
    (setf (slot-value panel 'file-2)
            (attach-as-child clog-obj "CLOGB3868051674" :clog-type
             'clog:clog-form-element :new-id t))
    (setf (slot-value panel 'form-7)
            (attach-as-child clog-obj "CLOGB3868051673" :clog-type
             'clog:clog-form :new-id t))
    (clog:set-on-click (submit-8 panel)
                       (lambda (target)
                         (declare (ignorable target))
                         (submit (form-7 panel))))
    panel))
