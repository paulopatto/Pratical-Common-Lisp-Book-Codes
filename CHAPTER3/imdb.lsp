; Exemplo do do capitulo 3 do livro 'Pratical Common Lisp' disponível em:
; http://www.gigamonkeys.com/book/practical-a-simple-database.html
;
; Vai Gravar uma coleção de Listas (salvos como Albuns) em uma variável global (*db*) e depois apresentar
; com uma saída formatada pela `defun show-db`
;

;; Definicao da variavel global DB
(defvar *db* nil)

;; Funcao de adicao de registros em nosso Banco de dados (var db).
(defun add-record (album) (push album *db* ))

;; Funcao que cria os registros (albuns) como listas
(defun make-album (title artist year tracks) (list :title title :artist artist :year year :tracks tracks))

;; Funçao de impressão de dados.
;; Não entendi o por que desta ciência de ~%10t...
;;
;; Ok agora entendi! tava mais abaixo
(defun show-db () (dolist (album *db*) (format t "~{~a:~10t~a~%~}~%" album)))


(add-record (make-album "Back in Black" "AC/DC" 1980 10))
(add-record (make-album "Black Ice" "AC/DC" 2008 15))
(add-record (make-album "Iron Man 2" "AC/DC" 2010 15))


(show-db)

;; Incrementando (V2) - Agora tem entrada de dados
;;

(defun prompt-read (prompt)
  (format *query-io* "~a:  " prompt)
  (force-output *query-io*)
  (read-line *query-io*)
)


(defun prompt-for-album ()
  (add-record
    (make-album
      (prompt-read "Title ")
      (prompt-read "Artist ")
      (parse-integer (prompt-read "Year ")       :junk-allowed t)
      (or (parse-integer (prompt-read "Tracks ") :junk-allowed t) 0)
    )
  )
)

(prompt-for-album)

(show-db)