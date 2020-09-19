(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "("
      (write-to-string line) ")" )))))

(defun list-to-string (lst)
  (format nil "~{~A~}" lst))

(defun number-to-list (n)
  (loop for c across (write-to-string n) collect (digit-char-p c)))

(defun make-index (pos length)
  (loop :for n :from pos :below length :by (* (1+ pos) 2)
    :collect n))

(defun add-parity-bits (numList)
  (let ((new ()) (i 1))
    (loop while numList do
      (if (integerp (log i 2))
        (setq new (append new '(_)))
        (progn
          (setq new (append new (list (first numList))))
          (setq numList (cdr numList))))
      (setq i (1+ i)))
    (block nil
      (return new))))

(defun calc-bit (lst)
  (let ((parity) (list) (index) (end))
    (setq parity (copy-list lst))
    (dotimes (pos (length parity))
      (if (integerp (log (1+ pos) 2))
        (progn
          (setq index (make-index pos (length parity)))
            (setq list ())
            (dolist (ind index)
              (setq end (+ ind (1+ pos)))
              (if (< end (length parity))
                (setq list (append list (subseq parity ind end )))
                (setq list (append list (subseq parity ind )))))
            (if (evenp (count 1 list))
              (setf (nth pos parity) 0)
              (setf (nth pos parity) 1)))))
    (block nil
      (return parity))))

(defun encode (lst)
  (let ((parity) (numList) (data))
  (dolist (num lst)
    (setq numList (delete nil (number-to-list (first num))))
    (setq parity (add-parity-bits numList))
    (setq data (calc-bit parity))
    (format T "~%~{~a~}" data))))

(defun get-bits (numList)
  (let ((parityBits) (output) (dataBits))
    (setq dataBits (copy-list numList))
    (dotimes (i (length numList))
      (if (integerp (log (1+ i) 2))
        (progn
          (setq parityBits  (append parityBits (list (nth i numList))))
          (setf (nth i dataBits) '_))))
    (push parityBits output)
    (push dataBits (cdr output))
    (block nil
      (return output))))

(defun decode (lst)
  (let ((numList) (dataBits) (parityBits) (data) (checkParity) (xor)
    (parity) (index))
    (dolist (num lst)
      (setq numList (delete nil (number-to-list (first num))))
      (setq parityBits (car (get-bits numList)))
      (setq dataBits  (cadr (get-bits numList)))
      (setq data (delete '_ (copy-list dataBits)))
      (setq parity (calc-bit dataBits))
      (setq checkParity (car (get-bits parity)))
      (setq xor ())
      (dotimes (bit (length parityBits))
    (if (= (nth bit parityBits) (nth bit checkParity))
      (setq xor (append xor (list '0)))
      (setq xor (append xor (list '1)))))
      (if (find '1 xor)
      (progn
        (setq index (1- (parse-integer (list-to-string (reverse xor))
          :radix 2)))
        (if (= (nth index numList) 1)
        (setf (nth index numList) 0)
        (setf (nth index numList) 1))))
      (setq dataBits  (cadr (get-bits numList)))
      (setq data (delete '_ (copy-list dataBits)))
      (format T "~%~{~a~}" data))))

(defun hamming-code (data)
  (let ((numEncode) (toEncode) (toDecode))
    (setq numEncode (parse-integer (caar data)))
    (setq toEncode (subseq (cdr data) 0 numEncode))
    (setq toDecode (subseq data (+ numEncode 2)))
    (encode toEncode)
    (decode toDecode)))

(defvar data)
(setq data (read-data))
(hamming-code data)

