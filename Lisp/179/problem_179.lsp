(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "("
      (write-to-string line) ")" )))))

(defun list-to-binary (lst)
  (format nil "~{~B~}" lst))

(defun number-to-list (n)
  (loop for c across (write-to-string n) collect (digit-char-p c)))

(defun count-bits (num times)
  (let ((numList) (count) (countList) (binList))
     (if (string= num "10")
       (print times)
       (progn
         (setq numList (delete nil (number-to-list num)))
         (setq count 1)
         (loop for pos from 1 to  (length numList) do
          (if (and (< pos (length numList)) (= (nth pos numList)
            (nth (1- pos) numList)))
            (setq count (1+ count))
            (progn
              (setq countList (append countList (list count)))
              (setq count 1))))
              (setq binList (list-to-binary countList))
              (setq times (1+ times))
              (count-bits binList times)))
     (if (= times 1)
       (print (expt 2 (1-  (count 1 numList)))))))

(defun look-n-say (num)
    (count-bits num 0))

(defvar data)
(setq data (caar (read-data)))
(look-n-say data)

