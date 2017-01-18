;;; init.el -- Emacs base configuration file

;;; Commentary:

;;; Code:

;; Load all other settings

(add-to-list 'load-path "~/.emacs.d/cfg/")
(defun config-library (library)
  "If LIBRARY is found, load it."
  (when (locate-library library)
      (load-library library)))

;; Load packages first
(config-library "my-packages")

;; Load everything else in no particular order
(config-library "my-appearance")
(config-library "my-bindings")
(config-library "my-editing")
(config-library "my-filetypes")
(config-library "my-hooks")
(config-library "my-misc")
(config-library "my-org-mode")

;; Check for platform-specific settings
(config-library "my-platform")

;; Built-in options
(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(safe-local-variable-values
   (quote
    (insert-tabs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init)
;;; init.el ends here
