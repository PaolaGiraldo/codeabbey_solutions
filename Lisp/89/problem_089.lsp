(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "(" line ")" )))))

(defun note-calculator (data)
  (let ((notes) (value) (note) (octave))
    (setq notes '(C C# D D# E F F# G G# A A# B))

   (dolist (freq data)
     (setq value (+ (* (+ (log (/ (* freq 1024) 440) 2) (/ 1 24)) 12) 9))
     (setq note (nth (floor (mod value 12)) notes))
     (setq octave (floor (- (/ value 12) 6)))
     (format T "~%~D~D" note octave))))

(defvar data)
(setq data (first (cdr (read-data))))
(note-calculator data)

