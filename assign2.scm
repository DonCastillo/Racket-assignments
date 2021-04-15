#lang racket

; Answer to (1)
; You are given a list whose elements are integer numbers. One example is (0
; 0 1 3 5). Write a function, called trimming, to delete all the leading zeros. For the
; example, the result is (1 3 5).

(define (trimming n)
  (if (zero? (car n))
      (trimming (cdr n))
      n
   )
)

(trimming '(1 3 5))       ; '(1 3 5)
(trimming '(0 1 3 5))     ; '(1 3 5)
(trimming '(0 0 1 3 5))   ; '(1 3 5)
(trimming '(0 0 0 1 3 5)) ; '(1 3 5)



; Answer to (2)
; You are given a list whose elements are integer numbers. One example is (0
; 0 1 3 0 5 0). Write a function, called trimming2, to delete all the zeros in the list. For the
; example, the result is (1 3 5).

(define (trimming2 n)
  (filter
   (lambda (x) (not (zero? x)))
   n)
)

(trimming2 '(0 0 1 3 0 5 0))  ; '(1 3 5)
(trimming2 '(1 0 2 0 3 0 40)) ; '(1 2 3 40)



; Answer to (3)
; You are given a list of elements, each of which could be a list. One example
; is ((a b) e (c d)). Create a function, called myreverse, to reverse the elements recursively.
; For the example, the result is ((d c) e (b a)). You are not allowed to use the built-in
; function reverse in Scheme.

(define (myreverse n)
  (if (null? n)
      '()
      (if (list? n)
          (append (myreverse (cdr n)) (list  (myreverse (car n))))
          n
      )
   )  
)

(myreverse '(a b c d e))              ; '(e d c b a)
(myreverse '(1 (1 2) 3))              ; '(3 (2 1) 1)
(myreverse '((a b) e (c d)))          ; '((d c) e (b a))
(myreverse '((a b) (c (d e))))        ; '(((e d) c) (b a))
(myreverse '((a b)(c d)(e f)(g h)))   ; '((h g) (f e) (d c) (b a))



; Answer to (4)
; You are given a list of elements, each of which could be a list. One example
; is ((a b) e (c d)). Create a function, called recslen, to count the elements recursively and
; report the total number of the elements in the list. For the example, the result is 5. You
; are not allowed to use the built-in function length.

(define (recslen n)
  (if (null? n)
      0
      (if (pair? n)
          (+ (recslen (car n)) (recslen (cdr n)))
          1
      )
  )
)

(recslen '())                                                       ; 0
(recslen '(1))                                                      ; 1
(recslen '(1 2))                                                    ; 2
(recslen '((1 2) 3))                                                ; 3
(recslen '((a b) e (c d)))                                          ; 5
(recslen (list (list "a" "b") "e" (list "c" "d") "f" (list)))       ; 6