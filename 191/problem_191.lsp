(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
       :while line
       :collect (read-from-string (concatenate 'string
       (write-to-string line :base 16) )))))

(defun find-max (numList)
(let ((reversed) (max) (maxIndex))
  (setq reversed (reverse numList))
  (setq max (apply 'max numList))
  (setq maxIndex (position max reversed))
  (if (= max (first numList))
    (progn
      (setf (nth maxIndex reversed) (first (cdr numList)))
      (setf (nth (- (length reversed) 2) reversed) max))
    (progn
      (setf (nth maxIndex reversed) (first numList))
      (setf (nth (1- (length reversed)) reversed) max)))

  (block nil
    (return (reverse reversed)))))

(defun find-min (numList)
  (let ((noZeros) (reversed) (min) (minIndex) (firstNoZero) (posRep))
  (setq noZeros (delete 0 (copy-list numList)))
  (setq reversed (reverse numList))
  (setq min (apply 'min noZeros))
  (if (= min (first numList))
    (progn
      (setq min (apply 'min (cdr numList)))
      (setq minIndex (position min reversed))
      (setq firstNoZero (first (cdr noZeros)))
      (setq posRep (- (length numList) (1+ (position firstnoZero numList))))
      (setf (nth posRep reversed) min)
      (setf (nth minIndex reversed) firstNoZero))
    (progn
      (setq minIndex (position min reversed))
      (setf (nth minIndex reversed) (first numList))
      (setf (nth (1- (length reversed)) reversed) min)))

  (block nil
    (return (reverse reversed)))))

(defun calc-weigths (data)
  (let ((numList))
  (setf *print-base* 16)
  (dolist (num data)
    (setq numList (map 'list (lambda (c)(or (digit-char-p c 16) nil))
      (prin1-to-string num)))
    (setq numList (subseq numList 1 (- (length numList) 1)))
    (format T "~%~{~a~} ~{~a~}" (find-min numList) (find-max numList)))))

(defvar data)
(setq data (cdr (read-data)))
(calc-weigths data)

