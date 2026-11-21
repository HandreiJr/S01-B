(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (let ((tox (erva-toxicidade erva)))
    (cond
      ((>= tox 7) "veneno")
      ((>= tox 4) "use com cuidado")
      (t "segura"))))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a | ~,2f por grama | ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Aviso: Maomao vai testar esta erva em si mesma antes."
      "Liberada para o paciente."))

(defun main ()
  (let ((ervas (list (make-erva :nome "Flor da Lua" :preco-por-grama 12.5 :toxicidade 9)
                     (make-erva :nome "Raiz de Salgueiro" :preco-por-grama 4.0 :toxicidade 5)
                     (make-erva :nome "Folha de Hortela" :preco-por-grama 1.8 :toxicidade 0))))
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%~%" (aviso e)))
    (let ((escolhida (second ervas))
          (gramas 15))
      (format t "Dose de ~ag de ~a: ~,2f~%"
              gramas
              (erva-nome escolhida)
              (preco-da-dose escolhida gramas)))))

(main)