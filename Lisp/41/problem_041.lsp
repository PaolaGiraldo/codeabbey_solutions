(defun read-data (&optional (read-line))
    (let (*read-eval*)
      (loop :for line = (read-line nil nil)
            :while line
            :collect (read-from-string (concatenate 'string "(" line ")")))))


(setq data (cdr (read-data)))
(dolist (item data)
  (print (second (sort item #'<))))

