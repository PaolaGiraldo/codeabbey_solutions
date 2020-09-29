(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
       :while line
       :collect (read-from-string (concatenate 'string "(" line ")" )))))

(defun divide (num pows)
  (let ((rest) (quotient) (remainder))
    (if (= num 0)
      (progn
        (setq pows (+ pows 1))
        (print pows))
      (progn
        (setq quotient (floor num 3))
        (setq remainder (mod num 3))
        (if (/= remainder 2)
          (progn
            (setq pows (+ pows 1))))
            (if (= remainder 0)
              (progn
                (setq rest (1- quotient))
                (divide rest pows))
              (progn
                (divide quotient pows)))))))

(defun find-pows (data)
  (let ((rest) (pows))
    (dolist (num data)
      (setq rest (- num 1))
      (setq pows 0)
      (divide rest pows))))

(defvar data)
(setq data (first (cdr (read-data))))
(find-pows data)

