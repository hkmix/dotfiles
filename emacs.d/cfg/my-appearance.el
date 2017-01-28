;;; my-appearance.el -- Appearance settings

;;; Commentary:

;;; Code:

;; GUI settings
(when (window-system)
  (set-face-attribute 'default nil :font "Iosevka Slab-14")
  (add-to-list 'default-frame-alist '(height . 24))
  (add-to-list 'default-frame-alist '(width . 80))
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1))

;; Editing area settings
(column-number-mode t)
(show-paren-mode t)
(global-hl-line-mode t)
(setq scroll-margin 6)

(provide 'my-appearance)
;;; my-appearance.el ends here
