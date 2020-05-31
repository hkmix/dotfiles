;;; init.el -- Emacs base configuration file

;;; Commentary:

;;; Code:

;; Load configuration
(require 'org)
(setq vc-follow-symlinks t)
(org-babel-load-file
 (expand-file-name (concat user-emacs-directory "config.org")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Drive/planner.org")))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
