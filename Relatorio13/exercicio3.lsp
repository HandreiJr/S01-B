(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (let ((nova-escuridao (if (>= quantidade (garota-magica-escuridao g))
                            0
                            (- (garota-magica-escuridao g) quantidade))))
    (make-garota-magica :nome (garota-magica-nome g)
                         :escuridao nova-escuridao
                         :bruxas (garota-magica-bruxas g))))

(defun main ()
  (let* ((grupo (list (make-garota-magica :nome "Madoka" :escuridao 35 :bruxas 2)
                      (make-garota-magica :nome "Sayaka" :escuridao 78 :bruxas 4)
                      (make-garota-magica :nome "Mami" :escuridao 20 :bruxas 7)))
         (nova-garota (make-garota-magica :nome "Kyoko" :escuridao 45 :bruxas 6))
         (grupo-ampliado (cons nova-garota grupo)))
    (format t "Escuridao total: ~d~%" (escuridao-total grupo))
    (format t "Total de bruxas: ~d~%" (total-de-bruxas grupo))
    (format t "Escuridao grupo original: ~d | grupo ampliado: ~d~%"
            (escuridao-total grupo)
            (escuridao-total grupo-ampliado))
    (let* ((alvo (second grupo))
           (purificada (purifica alvo 40)))
      (format t "Original (~a): ~d | Purificada: ~d~%"
              (garota-magica-nome alvo)
              (garota-magica-escuridao alvo)
              (garota-magica-escuridao purificada)))))

(main)