;;; my-org-mode.el -- Org-mode settings

;;; Commentary:

;;; Code:

;; Set languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (haskell . t)
   (latex . t)
   (python . t)))

;; Enable persistent clocking
(defvar org-clock-persist)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(provide 'my-org-mode)
;;; my-org-mode.el ends here
