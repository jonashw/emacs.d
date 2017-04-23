(set-default-font "Consolas Bold-10")

(require 'hydra)
(defhydra hydra-default-font (:color blue)
  "Default Font"
  ("c" (set-default-font "Consolas-11") "Consolas")
  ("C" (set-default-font "Consolas Bold-11") "Consolas Bold")
  ("d" (set-default-font "DejaVu Sans Mono-11") "DejaVu Sans Mono")
  ("D" (set-default-font "DejaVu Sans Mono Bold-11") "DejaVu Sans Mono Bold")
  ("i" (set-default-font "Iconsolata-11") "Iconsolata")
  ("i" (set-default-font "Iconsolata Bold-11") "Iconsolata Bold")
  ("m" (set-default-font "Monaco") "Monaco")
  ("p" (set-default-font "ProggyCleanTT") "ProggyClean")
  ("P" (set-default-font "ProggySquareTT") "ProggySquare")
  ("q" nil "cancel"))

;;Zoom Shortcuts
(global-set-key (kbd "<C-wheel-up>")   'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;;(experimental)
(defhydra hydra-zoom ()
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(provide 'init-fonts)
