;;; my-appearance.el -- Appearance settings

;;; Commentary:

;;; Code:

;; GUI settings
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(if (window-system)
    (progn
      (set-face-attribute 'default nil :font "Iosevka Slab-14:light")
      (add-to-list 'default-frame-alist '(height . 24))
      (add-to-list 'default-frame-alist '(width . 80))
      (add-to-list 'default-frame-alist '(background-mode . dark))
      (add-to-list 'initial-frame-alist '(height . 24))
      (add-to-list 'initial-frame-alist '(width . 80))
      (add-to-list 'initial-frame-alist '(background-mode . dark)))
  (progn
    (xterm-mouse-mode)))

(load-theme 'solarized t)

;; Editing area settings
(column-number-mode t)
(show-paren-mode t)
(global-hl-line-mode t)
(setq scroll-margin 6)

(provide 'my-appearance)
;;; my-appearance.el ends here
