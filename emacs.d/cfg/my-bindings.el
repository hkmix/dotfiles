;;; my-bindings.el -- Key bindings

;;; Commentary:

;;; Code:

;; General key bindings
(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w h") 'windmove-left)
(global-set-key (kbd "C-w j") 'windmove-down)
(global-set-key (kbd "C-w k") 'windmove-up)
(global-set-key (kbd "C-w l") 'windmove-right)

;; Org-mode key bindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'my-bindings)
;;; my-bindings.el ends here
