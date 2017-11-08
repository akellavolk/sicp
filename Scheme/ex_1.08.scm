(define (cbrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess)
      guess
      (cbrt-iter guess (improve guess x)
                        x)))
; Приближение
(define (improve guess x)
  (/ (+
       (/ x 
          (* guess guess))
       (* 2 guess))
     3))

; Предикат, определяющий достигло ли очередное приближение желаемой точности - разницы между кубом найденного корня и исходным числом
(define (good-enough? prev-guess guess)
  (< (abs (- prev-guess guess)) (* guess 0.001)))

(define (cbrt x)
  ((if (< x 0) - +)(cbrt-iter 1.0 (improve 1.0 x) (abs x))))

(cbrt 27)


