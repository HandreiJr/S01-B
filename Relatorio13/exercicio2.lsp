(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a (~a) - ~dm - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list (make-criatura :nome "Peixe-Bexiga" :bioma "Recifes Seguros" :profundidade 40 :perigo :inofensiva)
        (make-criatura :nome "Espreitador" :bioma "Floresta de Algas" :profundidade 120 :perigo :agressiva)
        (make-criatura :nome "Leviata Ceifador" :bioma "Dunas" :profundidade 350 :perigo :leviata)
        (make-criatura :nome "Caranguejo de Rocha" :bioma "Zona de Bulbo" :profundidade 210 :perigo :agressiva)))

(defun main ()
  (dolist (desc (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" desc))
  (format t "~%")
  (let* ((limite 150)
         (filtradas (abaixo-de limite *catalogo*)))
    (dolist (desc (mapcar #'descreve-criatura filtradas))
      (format t "~a~%" desc))
    (format t "~%Total abaixo de ~dm: ~d~%" limite (length filtradas))))

(main)