(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "(" line ")")))))

(defun select-sort (data)
  (let ((maxi) (pos) (latest (first (last data))) (sorted) (dataAux))
  (setq sorted (copy-list data))
  (setq maxi (first (sort sorted #'>)))
  (setq pos (position maxi data))
  (setq dataAux (copy-list data))
  (setf (nth (- (length data) 1) dataAux) maxi)
  (setf (nth pos dataAux) latest)
  (print pos)
  (if (> (length data) 2)
    (select-sort (subseq dataAux 0 (- (length data) 1))))
  ))

(defvar data)
(setq data (first (cdr (read-data))))
(select-sort data)

