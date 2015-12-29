;; cards.cl
;; pragmatic playing cards library

; Initialise Pack

(defparameter *ranks* '(A K Q J 10 9 8 7 6 5 4 3 2))
(defparameter *suits* '(S H D C))
(defparameter *pack* (apply #'append (loop
                       for s in *suits*
                       do collect (mapcar (lambda (x) (cons x (cons s nil))) *ranks*))))

; Initialise symbolic lookup for gin hand
(defparameter *gin-values* (make-hash-table))
; fill table with values
; TODO procedurally fill hash table
(setf (gethash 'A *gin-values*) 1)
(setf (gethash 'K *gin-values*) 10)
(setf (gethash 'Q *gin-values*) 10)
(setf (gethash 'J *gin-values*) 10)
(setf (gethash '10 *gin-values*) 10)
(setf (gethash '9 *gin-values*) 9)
(setf (gethash '8 *gin-values*) 8)
(setf (gethash '7 *gin-values*) 7)
(setf (gethash '6 *gin-values*) 6)
(setf (gethash '5 *gin-values*) 5)
(setf (gethash '4 *gin-values*) 4)
(setf (gethash '3 *gin-values*) 3)
(setf (gethash '2 *gin-values*) 2)

(defun deal-hand (n pack &optional already-dealt hand)
  "Returns hand of unique cards in range length of `n`"
  ; TODO hands-dealt
  (if (> n 0) 
    (deal-hand (1- n) pack already-dealt (push (random-element (set-difference pack (append hand already-dealt))) hand))
    hand))

(defun random-element (list)
  "Returns random selection from any list-type data structure"
  (nth (random (length list)) list))

(defun count-hand (hand pack lookup &optional (total 0))
  (if (not hand)
    total
    (count-hand (cdr hand) pack lookup (+ total (gethash (caar hand) lookup)))))
