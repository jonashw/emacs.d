(require 'hydra)
;; Experimental menu system for accent letters (because they are hard to type!)

(defhydra hydra-accent-letters (:color blue)
  "Accent letters"
  ("a" hydra-accent-letters-a/body "a")
  ("A" hydra-accent-letters-a-capital/body "A")
  ("e" hydra-accent-letters-e/body "e")
  ("E" hydra-accent-letters-e-capital/body "E")
  ("i" hydra-accent-letters-i/body "i")
  ("I" hydra-accent-letters-i-capital/body "I")
  ("o" hydra-accent-letters-o/body "o")
  ("O" hydra-accent-letters-o-capital/body "O")
  ("u" hydra-accent-letters-u/body "u")
  ("U" hydra-accent-letters-u-capital/body "U")
  ("N" (insert "Ñ") "Ñ")
  ("n" (insert "ñ") "ñ")
  ("q" nil "cancel"))

(defhydra hydra-accent-letters-a-capital (:color blue)
   "A"
   ("`" (insert "À") "À")
   ("'" (insert "Á") "Á")
   ("^" (insert "Â") "Â")
   ("~" (insert "Ã") "Ã")
   (":" (insert "Ä") "Ä")
   ("o" (insert "Å") "Å")
   ("E" (insert "Æ") "Æ")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-a (:color blue)
   "a"
   ("`" (insert "à") "à")
   ("'" (insert "á") "á")
   ("^" (insert "â") "â")
   ("~" (insert "ã") "ã")
   (":" (insert "ä") "ä")
   ("o" (insert "å") "å")
   ("e" (insert "æ") "æ")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-e-capital (:color blue)
   "E"
   ("`" (insert "È") "È")
   ("'" (insert "É") "É")
   ("^" (insert "Ê") "Ê")
   (":" (insert "Ë") "Ë")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-u (:color blue)
   "U"
   ("`" (insert "ù") "ù")
   ("'" (insert "ú") "ú")
   ("^" (insert "û") "û")
   (":" (insert "ü") "ü")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-u-capital (:color blue)
   "U"
   ("`" (insert "Ù") "Ù")
   ("'" (insert "Ú") "Ú")
   ("^" (insert "Û") "Û")
   (":" (insert "Ü") "Ü")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-i-capital (:color blue)
   "I"
   ("`" (insert "Ì") "Ì")
   ("'" (insert "Í") "Í")
   ("^" (insert "Î") "Î")
   (":" (insert "Ï") "Ï")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-i (:color blue)
   "i"
   ("`" (insert "ì") "ì")
   ("'" (insert "í") "í")
   ("^" (insert "î") "î")
   (":" (insert "ï") "ï")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-e (:color blue)
   "e"
   ("`" (insert "è") "è")
   ("'" (insert "é") "é")
   ("^" (insert "ê") "ê")
   (":" (insert "ë") "ë")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-o (:color blue)
   "o"
   ("`" (insert "ò") "ò")
   ("'" (insert "ó") "ó")
   ("^" (insert "ô") "ô")
   ("~" (insert "õ") "õ")
   (":" (insert "ö") "ö")
   ("/" (insert "ø") "ø")
   ("q" nil "cancel"))

(defhydra hydra-accent-letters-o-capital (:color blue)
   "O"
   ("`" (insert "Ò") "Ò")
   ("'" (insert "Ó") "Ó")
   ("^" (insert "Ô") "Ô")
   ("~" (insert "Õ") "Õ")
   (":" (insert "Ö") "Ö")
   ("/" (insert "Ø") "Ø")
   ;;(hydra-char-insert ":" "Ö")
   ;;(hydra-char-insert "/" "Ø"))
   ("q" nil "cancel"))

(defmacro hydra-char-insert (key char) `(,key (insert ,char) ,char))
(macroexpand '(hydra-char-insert "/" "Ø")) ;; => ("/" (insert "Ø") "Ø")

(defmacro say-three (str) `(message(concat ,str ,str ,str)))
;;(say-three "hi") ;; => "hihihi"
;;(macroexpand '(say-three "hi")) ;; => (message (concat "hi" "hi" "hi"))

(provide 'init-hydra-accent-letters)
