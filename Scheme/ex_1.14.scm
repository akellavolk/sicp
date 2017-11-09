; Нарисуйте дерево, иллюстрирующее процесс, который порождается процедурой count-change при размене 11 центов. Каковы порядки роста памяти и числа шагов, используемых этим процессом при увеличении суммы, которую требуется разменять?

(define (count-change amount) 
   (cc amount 5))
 
(define (cc amount kinds-of-coins) 
 (cond ((= amount 0) 1) 
       ((or (< amount 0) (= kinds-of-coins 0)) 0) 
       (else (+ (cc amount 
                    (- kinds-of-coins 1)) 
                (cc (- amount 
                       (first-denomination kinds-of-coins)) 
                    kinds-of-coins)))))

(define (first-denomination kinds-of-coins) 
 (cond ((= kinds-of-coins 1) 1) 
       ((= kinds-of-coins 2) 5) 
       ((= kinds-of-coins 3) 10) 
       ((= kinds-of-coins 4) 25) 
       ((= kinds-of-coins 5) 50)))

(count-change 100)

(define (make-leaf value)
  (list value))

(define (make-node amount kinds-of-coins left right)
  (list amount kinds-of-coins left right))

(define (make-count-change-list amount )
  (cc-tree amount 5))

(define (cc-tree amount kinds-of-coins)
  (cond ((= amount 0) (make-leaf 1))
        ((or (< amount 0) (= kinds-of-coins 0)) (make-leaf 0)) 
        (else (make-node amount
                         kinds-of-coins
                         (cc-tree amount (- kinds-of-coins 1))
                         (cc-tree (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
              )
        )
  )
)

(define (first-denomination kinds-of-coins) 
 (cond ((= kinds-of-coins 1) 1) 
       ((= kinds-of-coins 2) 5) 
       ((= kinds-of-coins 3) 10) 
       ((= kinds-of-coins 4) 25) 
       ((= kinds-of-coins 5) 50)))

(define (display-element identation element)
  (display (make-string identation #\space))
  (display element)
  (newline))

(define (draw-branch l cur-ident)
  (cond ((null? l) (display-element cur-ident "_"))
        ((list? (car l)) (draw-branch (car l) (+ 2 cur-ident)))
        (else (display-element cur-ident (car l))))
  (if (not (null? l))
      (draw-branch (cdr l) cur-ident))
)

(draw-branch (make-count-change-list 11) 0)

; Память растет линейно, так как глубина дерева зависит от суммы, которую требуется разменять, а число шагов экспоненциально - `a ^ k`. Для каждого `k` мы производим `n` операций, причем при очень большом `a` количество `n` для условно соседних запусков процедур будет несильно отличаться, что и дает нам порядок `n^k`









