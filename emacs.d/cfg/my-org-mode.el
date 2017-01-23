;;; my-org-mode.el -- Org-mode settings

;;; Commentary:

;;; Code:

(require 'ox-latex)
(require 'org-agenda)
(require 'org-clock)

;; Appearance
(setq org-src-fontify-natively t)

;; Set languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (haskell . t)
   (latex . t)
   (python . t)))

;; Hooks
(add-hook 'org-mode-hook
          (lambda ()
            (linum-mode 1)))


;; Agenda settings
;; Start on Sunday
(setq org-agenda-start-on-weekday 0)

;; States
(setq org-todo-keywords
      '((sequence "TODO" "NEXT" "IN-PROGRESS" "|" "DONE")))

;; Enable persistent clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Export settings
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-minted-options
      '(("linenos")
        ("breaklines")
        ("xleftmargin" "2em")))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide 'my-org-mode)
;;; my-org-mode.el ends here
