;;; init.el -- Emacs base configuration file

;;; Commentary:

;;; Code:

;; Load all other settings
(require 'org)
(org-babel-load-file
 (expand-file-name (concat user-emacs-directory "config.org")))

;; Built-in options
(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(org-agenda-files (quote ("~/Drive/planner.org")))
 '(package-selected-packages
   (quote
    (which-key cmake-ide color-theme-solarized emacs-color-theme-solarized irony company-irony eyebrowse markdown-preview-eww toml-mode emmet-mode highlight-chars ido-ubiquitous markdown-preview-mode markdown-mode: markdown-mode ggtags evil-leader use-package solarized-theme isend-mode helm-projectile god-mode git-gutter flycheck-haskell fill-column-indicator exec-path-from-shell evil-tabs evil-surround evil-magit evil-commentary editorconfig dtrt-indent delight column-marker)))
 '(safe-local-variable-values (quote (insert-tabs-mode)))
 '(shell-escape-mode "-shell-escape"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init)
;;; init.el ends here
