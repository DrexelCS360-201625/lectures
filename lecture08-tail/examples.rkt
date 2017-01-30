#lang racket
(define-syntax time-exp
  (syntax-rules ()
    ((_ e ...)
     (begin (collect-garbage)
            (time (begin e ...))
            #t))))

;;
;; Tail recursion
;;

;
; Count the number of numbers from 0 to n
;
; Try (count-exp 1000000)
;
(define (count-to n)
  (if (= n 0)
      1
      (+ 1 (count-to (- n 1)))))

(define (count-to-tail n)
  (define (count-to-aux n acc)
    (if (= n 0)
        acc
        (count-to-aux (- n 1) (+ 1 acc))))
  (count-to-aux n 0))

;
; Compute factorial of n
; 
(define (fact n)
  #f)

(define (fact-tail n)
  #f)

; Compute the nth Fibonacci number
; F_0 = 0
; F_1 = 1
; F_2 = 1
; ...
; F_n = F_{n-1} + F_{n-2}
;
; The first few numbers are:
;    0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610
;
; Example:
;   (map fib '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)) => (0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610)

(define (fib n)
  #f)

(define (fib-tail n)
  #f)


;;
;; Search problem: find pairs whose sum is prime
;;

;;
;; Implementation of prime?
;;

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (square x) (* x x))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;;
;; List version
;;

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (make-pairs n))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (make-pairs n)
  (concatmap (lambda (i)
               (map (lambda (j) (list i j))
                    (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(define (enumerate-interval lo hi)
  (if (> lo hi)
      '()
      (cons lo (enumerate-interval (+ lo 1) hi))))

(define (concatmap f l)
  (concat (map f l)))

(define (concat l)
  (foldr append '() l))

(define (foldr f z xs)
  (if (null? xs)
      z
      (f (car xs) (foldr f z (cdr xs)))))

;;
;; Stream version
;;

; Return an infinite stream consisting of the integers n, n+1, n+2, ...
(define (stream-integers-from n)
  (stream-cons n (stream-integers-from (+ n 1))))

; Return a stream consisting of the first n elements of the stream s
(define (stream-take n s)
  (if (= n 0)
      empty-stream
      (stream-cons (stream-first s) (stream-take (- n 1) (stream-rest s)))))

(define (interleave s1 s2)
  (if (stream-empty? s1)
      s2
      (stream-cons (stream-first s1)
                   (interleave s2 (stream-rest s1)))))

(define (stream-make-pairs s t)
  (stream-cons
   (list (stream-first s) (stream-first t))
   (interleave
    (stream-map (lambda (x) (list (stream-first s) x))
                (stream-rest t))
    (stream-make-pairs (stream-rest s) (stream-rest t)))))

(define (alt-stream-make-pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-first s) x))
               t)
   (alt-stream-make-pairs (stream-rest s) (stream-rest t))))

(define int-pairs (stream-make-pairs (stream-integers-from 1) (stream-integers-from 1)))

(define stream-prime-sum-pairs
  (stream-map make-pair-sum
       (stream-filter prime-sum? int-pairs)))

(define (stream-append s1 s2)
  (if (stream-empty? s1)
      s2
      (stream-cons (stream-first s1)
                   (stream-append (stream-rest s1) s2))))
