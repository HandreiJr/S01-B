(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                                   lista))
         (textos (mapcar (lambda (d)
                           (format nil "~a - ~,0f mora"
                                   (dominio-nome d)
                                   (recompensa-final d)))
                         filtrados)))
    textos))

(defun main ()
  (let ((dominios (list (make-dominio :nome "Ruinas da Capital" :elemento :electro :dificuldade 2 :mora 1800)
                        (make-dominio :nome "Palacio Escondido" :elemento :hydro :dificuldade 3 :mora 2200)
                        (make-dominio :nome "Canion Ardente" :elemento :pyro :dificuldade 1 :mora 1500)
                        (make-dominio :nome "Pico Congelado" :elemento :cryo :dificuldade 4 :mora 2500)
                        (make-dominio :nome "Santuario dos Ventos" :elemento :anemo :dificuldade 5 :mora 3000))))
    (dolist (item (rota dominios 3))
      (format t "~a~%" item))
    (format t "Total de mora: ~,0f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))
    (let* ((original (first dominios))
           (copia (copy-dominio original)))
      (setf (dominio-mora copia) 9999)
      (format t "Mora da copia: ~d | Mora do original: ~d~%"
              (dominio-mora copia)
              (dominio-mora original)))))

(main)