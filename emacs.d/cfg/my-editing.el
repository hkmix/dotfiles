;;; my-editing.el -- Editing settings

;;; Commentary:

;;; Code:

;; Editing options
(setq initial-scratch-message nil)
(setq vc-follow-symlinks t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(electric-pair-mode)
(global-visual-line-mode)

;; Prevent killing to clipboard
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

(provide 'my-editing)
;;; my-editing.el ends here
