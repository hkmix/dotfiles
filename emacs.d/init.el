;;; init.el -- Emacs base configuration file

;;; Commentary:

;;; Code:

;; Load all other settings
(add-to-list 'load-path "~/.emacs.d/cfg/")

(defun load-config-library (library)
  "If LIBRARY is found, load it."
  (when (locate-library library)
    (load-library library)))

(defun my/edit-config ()
  "Edit the Emacs configuration file."
  (find-file user-init-file))

(defun my/edit-library (library)
  "If LIBRARY is found, open that file."
  (interactive "sEnter the library name: ")
  (let ((library-path (locate-library library)))
    (unless (null library-path)
      (find-file library-path))))

;; Load packages first
(load-config-library "my-packages")

;; Load everything else in no particular order
(load-config-library "my-appearance")
(load-config-library "my-bindings")
(load-config-library "my-editing")
(load-config-library "my-filetypes")
(load-config-library "my-hooks")
(load-config-library "my-misc")
(load-config-library "my-org-mode")

;; Check for platform-specific settings
(load-config-library "my-platform")

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
