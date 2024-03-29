;;; init.el -- Emacs base configuration file

;;; Commentary:

;;; Code:

;; Bootstrap straight.el.
(defvar bootstrap-version)
(let ((bootstrap-file
        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
    (bootstrap-version 5))
(unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
    (goto-char (point-max))
    (eval-print-last-sexp)))
(load bootstrap-file nil 'nomessage))

;; Always download packages if needed.
(setq straight-use-package-by-default t)

;; Configure use-package to reroute to straight.el.
(straight-use-package 'org)
(straight-use-package 'use-package)
(eval-when-compile (require 'use-package))
(require 'bind-key)

;; Load configuration
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
