(define (get_pascal_triangle_element row column) 
  (cond ((= row 0) 1)
        ((or (= column 0) (= column row)) 1)
        (else (+ (get_pascal_triangle_element (- row 1) (- column 1))
                 (get_pascal_triangle_element (- row 1) column)))))

;(get_pascal_triangle_element 10 6)

(define (display_pascal_triangle_row n)
  (define (iter r c count)
    (display (get_pascal_triangle_element r c))
    (display " ")
    (if (> count 0)
        (iter r (+ c 1) (- count 1))))
  (iter n 0 n))

;(display_pascal_triangle_row 7)

(define (display_pascal_triangle depth) 
  (define (iter count)
    (display_pascal_triangle_row count)
    (newline)
    (if (< count depth)
        (iter (+ count 1))))
  (iter 0))

(display_pascal_triangle 10)
