(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "(" line ")" )))))

(defun count-str (a L)
  (cond
    ((null L) 0)
    ((eq a (car L)) (+ 1 (count-str a (cdr L))))
    (t (count-str a (cdr L)))))

(defun list-to-string (lst)
  (format nil "~{~A ~}" lst))

(defun entropy-calc (data)
  (let ((str) (strList) (len) (count) (freq) (value) (entropy))
  (dolist (phrase data)
    (setq str (list-to-string phrase))
    (setq strList (coerce str 'list))
    (setq strList (reverse (cdr (reverse strList))))
    (setq len (length strList))
    (setq entropy 0)
    (dolist (letter strList)
      (declare (ignore letter))
      (if strList
      (progn
        (setq count (count-str (first strList) strList))
        (setq freq (coerce (/ count len) 'double-float))
        (setq strList (delete (first strList) strList))
        (setq value (* freq (* -1 (log freq 2))))
        (setq entropy (+ entropy value)))))

    (format T "~%~F" entropy))))

(defvar data)
(setq data (cdr (read-data)))
(entropy-calc data)

