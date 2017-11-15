(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (isEven a)
  (define (remainder a b)
    (- a (* (floor (/ a b)) b)))
  (= (remainder a 2) 0))

(define (fast* a b count)
  (cond ((or (= a 0) (= b 0)) 0)
        ((= b 1)
            (display count)
            (newline)
            a)
        ((isEven b) (double (fast* a (halve b) (+ count 1))))
        (else (+ a (double (fast* a (halve (- b 1)) (+ count 1)))))))

(display (fast* 35 0 0))

; Реализованный в прошлом упражнении алгоритм умножения через сложение имеет R(n) = O(n) порядок роста требований к памяти. Сделаем процесс итеративным, чтобы привести затраты памяти к R(n) = O(1)

(newline)

(define (better-fast* a b)
  (define (iter a b acc count)
    (cond ((or (= a 0) (= b 0)) 0)
          ((= b 1)
            (display count)
            (+ acc a))
          ((isEven b) (iter (double a) (halve b) acc (+ count 1)))
          (else (iter (double a) (halve (- b 1)) (+ acc a) (+ count 1)))))
  (iter a b 0 0))

(better-fast* 3 65)