;; cards.cl
;; pragmatic playing cards library

; Initialise Pack

(defparameter *ranks* '(A K Q J 10 9 8 7 6 5 4 3 2))
(defparameter *suits* '(S H D C))
(defparameter *pack* (apply #'append (loop
                       for s in *suits*
                       do collect (mapcar (lambda (x) (cons x (cons s nil))) *ranks*))))

;; Initialise symbolic lookup for gin hand
(defparameter *gin-values* (make-hash-table))

(defun deal-hand (n pack &optional hand &key hands-dealt)
  "Returns hand of unique cards in range length of `n`"
  ; TODO hands-dealt
  (if (> n 0) 
    (deal-hand (1- n) (push (random-element (set-difference pack hand)) hand))
    hand))

(defun random-element (list)
  "Returns random selection from any list-type data structure"
  (nth (random (length list)) list))

