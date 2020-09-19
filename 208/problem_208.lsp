(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "("
      (write-to-string line) ")" )))))

(defun list-to-string (lst)
  (format nil "~{~A~}" lst))

(defun neighborhood (data)
  (let ((alphabet) (word) (wordList) (final) (aux) (aux1))
    (setq alphabet (delete #\space (coerce (caar data) 'list)))
    (setq word (list-to-string (second data)))
    (setq wordList (coerce word 'list))
    (dotimes (i (length wordList))
      (setq aux (copy-list wordList))
      (dolist (letter alphabet)
        (setf (nth i aux) letter )
        (loop for j from (1+ i) to (1- (length wordList)) do
          (setq aux1 (copy-list aux))
          (dolist (letter alphabet)
            (setf (nth j aux1) letter)
            (setq final (append final (list (list-to-string aux1))))))))
    (setq final (sort (copy-list final) #'string-lessp))
    (setq final (remove-duplicates final :test #'equal))
    (format T "~{~A ~}" final)))

(defvar data)
(setq data (read-data))
(neighborhood data)


