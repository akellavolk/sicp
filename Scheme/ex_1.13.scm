; Определим функцию, считающую число, приближенное к числу Фибоначчи f(n) = (phi^n) / sqrt(5)

(define phi
   (/ (+ 1 (sqrt 5)) 2))

(define (^ base exponent)
   (define (*^ exponent acc)
       (if (= exponent 0)
           acc
           (*^ (- exponent 1) (* acc base))))
   (*^ exponent 1))

(define (f letter n)
   (/ (^ letter n) (sqrt 5)))
 
; Проверим утверждение о близости значений к последовательности чисел Фибоначчи: 0, 1, 1, 2, 3, 5, 8, 13...

(f phi 0) ; => 0.4472135954999579
(f phi 3) ; => 1.8944271909999157
(f phi 5) ; => 4.959674775249769
(f phi 7) ; => 12.984597134749391

; Видим, что приближение есть, причем точность растем с увеличением аргумента, так же видим, что в примерах отклонение не превышает 0.5. В задании просят доказать, что "ближайшее целое число" к результату функции от n (т.е. при математическом округлении результата) является числом Фибоначчи для n. В учебнике предлагается проверить утверждение, что fib(n) = (phi^n - psi^n)/sqrt(5). В случае, если это утверждение в целом верно, и если (psi^n)/sqrt(5) всегда меньше 1/2, то  округление (phi^n) / sqrt(5) до ближайшего целого числа, действительно всегда будет давать число Фибоначчи.

(define psi
   (/ (- 1 (sqrt 5)) 2))
; и новую функцию целиком

(define (g n)
  (- (f phi n) (f psi n)))

(g 0) ; => 0
(g 3) ; => 2
(g 5) ; => 5
(g 7) ; => 13

; Предлагается проверить утверждение с помощью метода математической индукции. Метод заключается в проверке утверждения в частном случае Fib(1) = g(1) и в общем Fib(n+1) = g(n+1). Если обе проверки проходят, можно говорить, что утверждение верно для всех n. Будем считать, что предыдущие примеры подтверждают частные утверждения. Остается доказать, что Fib(n+1) = g(n+1). Для данного доказательства требуется предварительно показать, что phi^2 = 1 + phi и psi^2 = 1 + psi.
; Проверив Fib(n) + Fib(n+1) = (phi^n - psi^n)/sqrt(5) + (phi^n-1 - psi^n-1)/sqrt(5), увидим, что получается (phi^n+1 - psi^n+1)/sqrt(5), т.е. Fib(n+1). Ч.т.д.
; Вторая часть доказательства - (psi^n)/sqrt(5) < 1/2, (psi^n) < sqrt(5)/2

psi ; => -0.6180339887498949

; При целых n>= 0 (т.е для таких, на которых считается Fib(n)) psi^n <= 1 (равно при n = 0). В свою очередь 

(/ (sqrt 5) 2) ; 1.118033988749895

; Таким образом точно знаем, что psi^n <= 1 и 1 < sqrt(5)/2, следовательно (psi^n) < sqrt(5)/2, следовательно
; (psi^n)/sqrt(5) < 1/2

; Из обоих доказательств следует истинность первоначального утверждения - округление результата f(n) = (phi^n) / sqrt(5) дает Fib(n)
