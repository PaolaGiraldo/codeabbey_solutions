(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "(" line ")" )))))

(defun freq-calculator (data)
  (let ((baseFreq) (freq) (notes) (noteStr) (noteList) (note) (octave))
    (setq notes '(("C". 0) ("C#". 1) ("D". 2) ("D#". 3) ("D#". 3) ("E". 4)
                  ("F". 5) ("F#". 6) ("G". 7) ("G#". 8) ("A". 9) ("A#". 10)
                  ("B". 11)))

    (do ((cont -9 (1+ cont)))
      ((= cont 3))
      (setq freq (* 440 (expt 2 (/ cont 12))))
      (setq baseFreq (append baseFreq (list freq ))))

   (dolist (item data)
     (setq noteStr (write-to-string item))
     (setq noteList (coerce noteStr 'list))
     (setq octave (digit-char-p (first (last noteList))))
     (setq note (coerce (subseq noteList 0 (- (length noteList) 1)) 'string))
     (print (round (* (nth (cdr (assoc note notes :test #'string=)) baseFreq)
                   (expt 2 (- octave 4)) ))))))

(defvar data)
(setq data (first (cdr (read-data))))
(freq-calculator data)

