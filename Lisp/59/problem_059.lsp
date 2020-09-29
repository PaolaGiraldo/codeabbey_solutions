(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
       :collect (read-from-string (concatenate 'string "("
                        (write-to-string line) ")")))))

(defun split-by-one-space (string)
  (loop for i = 0 then (1+ j)
    as j = (position #\Space string :start i)
    collect (subseq string i j)
    while j))


(defun bulls-n-cows (data)
(let ((value) (guesses) (pos 0) (digits 0) )
(setq value (first (first data)))
(setq guesses (split-by-one-space (first (first (cdr data)))))

(loop for guess in guesses do
  (setq pos 0)
  (setq digits 0)
  (loop for num from 0 to 3 do
    (let ((charValue  (char value num))(charGuess  (char guess num)))
    (if (find charValue (write-to-string guess))
      (setq digits (+ digits 1)))
    (if (string= charValue charGuess)
      (progn
      (setq pos (+ pos 1))
      (setq digits (- digits 1))))))
  (FORMAT T "~%~D-~D" pos digits))))

(defvar data)
(setq data (read-data))
(bulls-n-cows data)

