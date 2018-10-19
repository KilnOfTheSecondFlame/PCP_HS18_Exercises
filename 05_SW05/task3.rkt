;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname task3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Berechnet die Diagonale von einem Rechteck
; a = Laenge, b = Breite
(define (diagonal a b) (sqrt (+ (sqr a) (sqr b))))
(diagonal 10 4)
