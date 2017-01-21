;;; my-org-mode.el -- Org-mode settings

;;; Commentary:

;;; Code:

;; Appearance
(defvar org-src-fontify-natively)
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
(defvar org-agenda-start-on-weekday)
(setq org-agenda-start-on-weekday 0)

;; Enable persistent clocking
(defvar org-clock-persist)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Export settings
(defvar org-latex-listings)
(setq org-latex-listings 'minted)

(provide 'my-org-mode)
;;; my-org-mode.el ends here
