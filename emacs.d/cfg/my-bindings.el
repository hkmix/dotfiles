;;; my-bindings.el -- Key bindings

;;; Commentary:

;;; Code:

;; Key bindings
(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w h") 'windmove-left)
(global-set-key (kbd "C-w j") 'windmove-down)
(global-set-key (kbd "C-w k") 'windmove-up)
(global-set-key (kbd "C-w l") 'windmove-right)

(provide 'my-bindings)
;;; my-bindings.el ends here
