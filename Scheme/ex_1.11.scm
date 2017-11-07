

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
    
(fib 8)

; f(n) = n, n < 3
; f(n) = f(n-1) + f(n-2) + f(n-3)

; вычисление при помощи рекурсивного процесса
(define (recursive n)
  (if (< n 3)
      n
      (+ (recursive (- n 1)) (recursive (- n 2)) (recursive (- n 3)))))
      
(recursive 15) ; eval problem

; вычисление при помощи итеративного процесса
(define (iterative n)
  (define (iter a b c count) 
  (if (= count 3)
      (+ a b c)
      (iter (+ a b c) a b (- count 1))))
  (if (< n 3)
      n
      (iter 2 1 0 n)))

(iterative 30)