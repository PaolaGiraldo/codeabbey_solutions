(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "(" line ")" )))))

(defun partition (array left right)
  (FORMAT T "~%~D-~D" left right)
  (let ((lt) (rt) (dir) (pivot))
    (setq lt left)
    (setq rt right)
    (setq dir "left")
    (setq pivot (nth left array))
    (loop while (< lt rt) do
      (if (string= dir "left")
        (progn
          (if (> (nth rt array) pivot)
            (setq rt (- rt 1))
            (progn
              (setf (nth lt array) (nth rt array))
              (setq lt (+ lt 1))
              (setq dir "right"))))
      (progn
        (if (< (nth lt array) pivot)
          (setq lt (+ lt 1))
          (progn
            (setf (nth rt array) (nth lt array))
            (setq rt (- rt 1))
            (setq dir "left"))))))

    (setf (nth lt array) pivot)
    (block nil
    (return lt))))

(defun quick-sort (array left right)
  (let ((pivotPos))
    (setq pivotPos (partition array left right))
    (if (> (- pivotPos left) 1)
      (quick-sort array left (- pivotPos 1) ))

    (if (> (- right pivotPos) 1)
      (quick-sort array (+ pivotPos 1) right))))

(defvar data)
(setq data (first (cdr (read-data))))
(print data)
(quick-sort data 0 (- (length data) 1))

