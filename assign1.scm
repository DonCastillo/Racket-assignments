#lang racket

; Answer to (1)
(define (ackermann m n)
  (if (and (number? m) (number? n))
      (if (and (integer? m) (integer? n))
          (if (and (>= m 0) (>= n 0))
              (cond
                [(and (> m 0) (> n 0)) (ackermann (- m 1) (ackermann m (- n 1)))]
                [(and (> m 0) (= n 0)) (ackermann (- m 1) 1)]
                [(= m 0) (+ n 1)]
               )
              (error "At least one of the values is negative.")
          )
          (error "At least one of the values is not an integer.")
      )
      (error "At least one of the values is not a number.")
  )
)

(ackermann 1 2) ;4
(ackermann 2 1) ;5
(ackermann 2 2) ;7


; Answer to (2)
; The function x counts the total number of nodes in the tree.
; First it checks if the node is a pair. If it is, it checks if it has children.
; Then it adds the occurences of each child. If the node has no children, it returns 1 (count of the root node)
; which is then added to the total.

; Answer to (3)
(define (preorder tree)
  (if (pair? tree)
      (cons
       (car tree)
       (if (null? (cdr tree))
          '()
          (append
            (preorder (car (cdr tree)))
            (preorder (car (cdr (cdr tree))))
          )
       )
      )
      '()
  ) 
)

(preorder '(a (b (d) (e))(c (f) (g)))) ; '(a b d e c f g)
(preorder (list "a" (list "b" (list "d") (list "e")) (list "c" (list "f") (list "g")))) ; '("a" "b" "d" "e" "c" "f" "g")
(preorder (list "b" (list "d") (list "e"))) ; '("b" "d" "e")
(preorder (list "b")) ; '("b")