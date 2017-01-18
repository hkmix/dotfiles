;;; my-editing.el -- Editing settings

;;; Commentary:

;;; Code:

;; Editing options
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq vc-follow-symlinks t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(electric-pair-mode)

;; Prevent killing to clipboard
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

(provide 'my-editing)
;;; my-editing.el ends here
