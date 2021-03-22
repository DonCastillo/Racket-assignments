#lang racket

; Answer to (1)
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
(define (trimming2 n)
  (filter
   (lambda (x) (not (zero? x)))
   n)
)

(trimming2 '(0 0 1 3 0 5 0))  ; '(1 3 5)
(trimming2 '(1 0 2 0 3 0 40)) ; '(1 2 3 40)



; Answer to (3)
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