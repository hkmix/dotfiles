;;; my-org-mode.el -- Org-mode settings

;;; Commentary:

;;; Code:

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

;; Enable persistent clocking
(defvar org-clock-persist)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Export settings
(defvar org-latex-listings)
(setq org-latex-listings 'minted)

(provide 'my-org-mode)
;;; my-org-mode.el ends here
