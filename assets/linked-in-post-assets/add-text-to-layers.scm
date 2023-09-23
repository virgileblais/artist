(define (add-text-to-all-layers image)
  (let* (
          (layers (cadr (gimp-image-get-layers image)))
          (text-layer -1)
        )
    (do ((i 0 (+ i 1)))
        ((= i (vector-length layers)))
      (let* ((layer (aref layers i)))
        (if (string=? (car (gimp-drawable-get-name layer)) "GLITCH ART")
          (set! text-layer layer)
        )
      )
    )
    (if (< text-layer 0)
      (gimp-message "Text layer not found.")
      (do ((i 0 (+ i 1)))
          ((= i (vector-length layers)))
        (let* ((layer (aref layers i)))
          (if (not (string=? (car (gimp-drawable-get-name layer)) "GLITCH ART"))
            (let* (
                    (new-layer (car (gimp-layer-copy text-layer TRUE)))
                  )
              (gimp-image-insert-layer image new-layer 0 i)
              (gimp-image-merge-down image new-layer CLIP-TO-IMAGE)
            )
          )
        )
      )
    )
  )
)