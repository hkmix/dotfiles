;;; Enable package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;; Automatic package installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

;;; Package list
(use-package evil :ensure t)
(use-package helm
  :bind ("M-x" . helm-M-x)
  :ensure t)
(use-package magit :ensure t)
(use-package projectile :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package isend-mode :ensure t)

;;; Enable evil-mode
(require 'evil)
(evil-mode t)

;;; Plugin settings
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;; Org-mode languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (haskell . t)
   (latex . t)
   (python . t)
   ))

;;; Mode hooks
;; Python
(add-hook 'python-mode-hook 'linum-mode)

;; elisp
(add-hook 'emacs-lisp-mode-hook 'linum-mode)

;;; UI set-up
(load-theme 'solarized-dark t)
(set-face-attribute 'default nil :font "Iosevka Slab-14")
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;; Built-in options
(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(package-selected-packages
   (quote
    (exec-path-from-shell isend-mode evil-mode use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
