;;; my-platform.el -- Platform-specific settings

;;; Commentary:

;;; Code:

;; GUI settings
(when (window-system)
  (set-face-attribute 'default nil :font "Iosevka Slab-14"))

(provide 'my-platform)
;;; my-platform.el ends here
