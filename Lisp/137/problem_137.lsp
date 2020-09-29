
(defun read-data (&optional (read-line))
  (declare (ignore read-line))
  (let (*read-eval*)
    (loop :for line = (read-line nil nil)
    :while line
    :collect (read-from-string (concatenate 'string "("
      (write-to-string line ) ")" )))))

(defun count-str (a L)
  (cond
    ((null L) 0)
    ((eq a (car L)) (+ 1 (count-str a (cdr L))))
    (t (count-str a (cdr L)))))

(defun list-to-string (lst)
  (format nil "~{~A~}" lst))

(defun sum-elements (list)
  (let (sum)
    (setq sum 0)
    (dotimes (cont (length list) sum)
    (setq sum (+ sum (cdr (nth cont list)))))))

(defun partition (letters)
  (let ((lt) (rt) (best) (inf) (rigth) (left) (diff))
    (setq lt 0)
    (setq rt 0)
    (setq best 0)
    (setq inf 1e+30)
    (loop for cont from 1 to (1- (length letters)) do
      (setq left (subseq letters 0 cont))
      (setq rigth (subseq letters cont (length letters)))
      (setq lt (sum-elements left))
      (setq rt (sum-elements rigth))
      (setq diff (- lt rt))
        (if (< (abs diff) inf)
        (progn
          (setq inf (abs diff))
          (setq best cont))))
  (block nil
    (return best))))
(defun shannon-fano ( alist base)
  (let ((pos))
  (if (= (length alist) 1)
    (format T "~%~a ~a" (char-code (caar alist)) base)
    (progn
      (setq pos (partition alist))
      (shannon-fano (subseq alist 0 pos) (concatenate 'string base "O"))
      (shannon-fano (subseq alist pos) (concatenate 'string base "I"))))))

(defun split-str (data)
  (let ((alist) (str) (strList) (count))
    (setq alist '())
  (setq str (list-to-string data))
  (setq strList (coerce str 'list))
  (dolist (letter strList)
    (declare (ignore letter))
    (if strList
      (progn
        (setq count (count-str (first strList) strList))
        (setq alist (acons (first strList) count alist))
        (setq strList (delete (first strList) strList)))))

   (setq alist (sort (copy-list alist)  #'char-lessp :key #'car))
   (setq alist (stable-sort (copy-list alist)  #'> :key #'cdr))
   (shannon-fano alist "")))

(defvar data)
(setq data (first (read-data)))
(split-str data)

