;;; my-org-mode.el -- Org-mode settings

;;; Commentary:

;;; Code:

;; Appearance
(defvar org-src-fontify-natively)
(setq org-src-fontify-natively t)

;; Set languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (haskell . t)
   (latex . t)
   (python . t)
   (sh . t)))

;; Hooks
(add-hook 'org-mode-hook
          (lambda ()
            (linum-mode 1)))

;; Agenda settings
;; Start on Sunday
(defvar org-agenda-start-on-weekday)
(setq org-agenda-start-on-weekday 0)

;; States
(defvar org-todo-keywords)
(setq org-todo-keywords
      '((sequence "TODO" "NEXT" "IN-PROGRESS" "|" "DONE")))

;; Export settings
(defvar org-latex-listings)
(setq org-latex-listings 'minted)
(defvar org-latex-packages-alist)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(defvar org-latex-minted-options)
(setq org-latex-minted-options
      '(("linenos")
        ("breaklines")
        ("xleftmargin" "2em")))
(defvar org-latex-pdf-process)
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Set link opening defaults
(setq browse-url-browser-function 'eww-browse-url)

(provide 'my-org-mode)
;;; my-org-mode.el ends here
