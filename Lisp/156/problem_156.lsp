
(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string line )))))

(defun my-concat( list )
  (format T "~%~{~a~}" list))

(defun find-digit (indexMissed sum)
  (let ((odddigit) (add))
  (loop for i in '(0 1 2 3 4 5 6 7 8 9) do
    (if (/= (mod indexMissed 2) 0)
      (progn
        (setq add i)
        (setq sum (+ sum add)))
      (progn
        (setq oddDigit (* i 2))
      (if (> oddDigit 9)
        (progn
          (setq add (- oddDigit 9))
          (setq sum (+ sum add)))
        (progn
          (setq add oddDigit)
          (setq sum (+ sum add))))))
    (if (= (mod sum 10) 0)
      (return i)
      (setq sum (- sum add))))))

(defun complete-digit (num indexMissed)
  (let ((sum 0) (digit) (oddDigit) (numberMiss) (carNum))
    (dotimes (i (length num))
      (setq digit (nth i num))
      (if (numberp digit)
        (progn
          (if (= (mod i 2) 0)
            (progn
              (setq sum (+ sum digit)))
            (progn
              (setq oddDigit (* digit 2))
          (if (> oddDigit 9)
            (setq sum (+ sum (- oddDigit 9)))
            (setq sum (+ sum oddDigit))))))))

    (setq numberMiss (find-digit indexMissed sum))
    (setq carNum (reverse num))
    (setf (nth indexMissed carNum) numberMiss)
    (block nil
    (return (my-concat carNum)))))

(defun swap-digit (num)
  (let ((aux) (aux1) (sum 0) (digit) (oddDigit))
    (dotimes (i (- (length num) 1))
      (setq aux (copy-list num))
      (setf (nth i aux) (nth (+ i 1) num))
      (setf (nth (+ i 1) aux) (nth i num))
      (setq aux1 (reverse aux))
      (setq sum 0)
      (dotimes (j (length aux1))
        (setq digit (nth j aux1))
      (if (= (mod j 2) 0)
        (progn
          (setq sum (+ sum digit)))
        (progn
          (setq oddDigit (* digit 2))
          (if (> oddDigit 9)
            (setq sum (+ sum (- oddDigit 9)))
            (setq sum (+ sum oddDigit))))))

       (if (= (mod sum 10) 0)
         (return (my-concat (reverse aux1)))))))

(defun check-error (data)
  (dolist (num data)
    (let ((numList) (indexMissed))
      (setq numList (map 'list (lambda (c)(or (digit-char-p c) '?))
        (prin1-to-string num)))
      (setq indexMissed (search "?" (write-to-string num)))
    (if indexMissed
      (complete-digit (reverse numList) indexMissed)
      (swap-digit numList)))))

(defvar data)
(setq data (cdr (read-data)))
(check-error data)

