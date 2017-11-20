(define (remainder a b)
    (- a (* (floor (/ a b)) b)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
    
(gcd 206 40)

; Задание требует сравнить нормальный и аппликативный порядок вычисления при итеративном процессе вычисления алгоритма Евклида и посчитать количество вычислений остатка от деления (remainder) в том и другом случае.
; Для нормального порядка получим:

; 1
(gcd 206 40)
  (= 40 0)
  (gcd 40 (remainder 206 40))
; 2
(gcd 40 (remainder 206 40))
  ( = (remainder 206 40) 0) ; 1 вычисление => #f
  (gcd (remainder 206 40)
       (remainder 40
                  (remainder 206 40)))
; 3
(gcd (remainder 206 40)
     (remainder 40
                (remainder 206 40)))
  (= (remainder 40
                (remainder 206 40))
      0) ; 1 + 2 = 3 вычисления => #f
  (gcd (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40)
                  (remainder 40 (remainder 206 40))))
; 4
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))
  (= (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
      0) ; 3 + 4 = 7 вычислений => #f
  (gcd (remainder (remainder 206 40)
                  (remainder 40
                             (remainder 206 40)))
       (remainder (remainder 40
                             (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40
                                        (remainder 206 40)))))
; 5
(gcd (remainder (remainder 206 40)
                  (remainder 40
                             (remainder 206 40)))
      (remainder (remainder 40
                            (remainder 206 40))
                 (remainder (remainder 206 40)
                            (remainder 40
                                       (remainder 206 40)))))
  (= (remainder (remainder 40
                           (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40
                                      (remainder 206 40))))
      0) ; 7 + 7 = 14 вычислений => #t
  (remainder (remainder 206 40)
             (remainder 40
                        (remainder 206 40))) ; 14 + 4 = 18 вычислений => 2

; Проверим то же для аппликативного порядка
; 1
(gcd 206 40)
  (= 40 0)
  (gcd 40 (remainder 206 40)) ; 1 вычисление
; 2
(gcd 40 6)
  (= 6 0)
  (gcd 6 (remainder 40 6)) ; 2 вычисления
; 3
(gcd 6 4)
  (= 4 0)
  (gcd 4 (remainder 6 4)) ; 3 вычисления
; 4
(gcd 4 2)
  (= 2 0)
  (gcd 2 (remainder 4 2)) ; 4 вычисления
; 5
(gcd 2 0)
  (= 0 0)
  2
  
; Итого, имеем 18 вычислений remainder против 4.










  