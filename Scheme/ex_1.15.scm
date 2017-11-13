(define (cube x)
  (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle count)
  (cond ((not (> (abs angle) 0.1))
              (display count)
              angle)
        (else (p (sine (/ angle 3.0) (+ 1 count))))))
      
(sine 12.15 0)

; При вычислении синуса 12.15 радиан, процедура p вызывается 5 раз