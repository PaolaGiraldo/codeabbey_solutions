(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
      :while line
      :collect (read-from-string (concatenate 'string "(" line ")")))))

(defun prime-generator (n)
  (defvar primes (list 2))
  (defvar i 3)
  (defvar remainder 0)
  (defvar isPrime t)
  (loop  while (< (length primes) (+ n 1)) do
    (block continue
     (setq isPrime t)
     (loop for p in primes do
      (if (> (* p p) i) 'return)
      (setq remainder (mod i p))
      (if (= remainder 0)
      (progn
    (setq isPrime nil)
    'return)))
 (if (not isPrime)
     (progn
       (setq i (+ i 2))
       (return-from continue))
     (setq primes (append primes (list i))))))
  (block nil
    (return primes)))


(defvar data)
(defvar primes)
(defvar copyData)
(setq data (first (cdr (read-data))))
(setq copyData (copy-list data))
(setq primes (prime-generator  (first (sort data #'>))))
(dolist (index copyData)
  (print (nth (- index 1) primes)))

