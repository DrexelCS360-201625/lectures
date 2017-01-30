#lang racket
(provide (all-defined-out))

;;
;; Higher-order function review
;;

; Perform a right fold over the elements of a list
;
; (foldr f z (cons x1 (cons x2 (... (cons xn '()))))) =>
;     (f x1 (f x2 (... (f xn z)))))

(define (foldr f z xs)
  'not-implemented)

; Perform a left fold over the elements of a list
;
; (foldl f z (cons x1 (cons x2 (... (cons xn '()))))) =>
;     (f (... (f (f z x1) x2)) xn)

(define (foldl f z xs)
  'not-implemented)

;;
;; How can we write reverse as a fold?
;;
(define (snoc xs x)
  (cons x xs))

(define (rev l)
  'not-implemented)

;;
;; How can we write concat as a fold?
;;
(define (concat l)
  'not-implemented)

;;
;; Homework 1 Problem 5
;;

; The function scan takes a binary function f, a value z, and a list l, and
; returns the list z, f(x, x_1), f(f(x_1, z), x_2), ..., f(f(x_{n-1}, ...), x_n)
; where x_1, x_2, ..., x_n are the elements of the list l.
;
; Example:
;   (scan + 0 '()) => (0)
;   (scan + 0 '(1 2 3 4 5 6)) => (0 1 3 6 10 15 21)
;   (scan * 1 '(1 2 3 4 5 6)) => (1 1 2 6 24 120 720)

(define (scan f z xs)
  'not-implemented)

;;
;; Homework 2 Problem 4
;;

; cycle-lists takes two lists, xs and ys, and return a stream. The lists may or
; may not be the same length, but they are both non-empty. The elements produced
; by the stream are pairs where the first part is from xs and the second part is
; from ys. The stream cycles forever through the lists.
;
; Example:
;    (stream-take-n 8 (cycle-lists '(1 2 3) '("a" "b"))) => ((1 . "a") (2 . "b") (3 . "a") (1 . "b") (2 . "a") (3 . "b") (1 . "a") (2 . "b"))


(define (cycle-lists xs ys)
  'not-implemented)


;;
;; Homework 2 Problem 5
;;

; seen takes a single argument x and return #t if it has been previously called
; with the same argument and #f otherwise.

(define (seen x)
  'not-implemented)
