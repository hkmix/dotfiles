;;; my-editing.el -- Editing settings

;;; Commentary:

;;; Code:

;; Editing options
(setq initial-scratch-message nil)
(setq vc-follow-symlinks t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(electric-pair-mode)
(global-visual-line-mode)

;; Move backups to temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Prevent killing to clipboard
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

(provide 'my-editing)
;;; my-editing.el ends here
