(define (sumOfSquare a b) (* (* a a) (* b b)))

(define (sumOfTwoGreater a b c)
  (cond ((and (>= a c) (>= b c)) (sumOfSquare a b))
        ((and (>= b a) (>= c a)) (sumOfSquare b c))
        ((and (>= a b) (>= c b)) (sumOfSquare a c))
  )
)

(sumOfTwoGreater 1 2 5)