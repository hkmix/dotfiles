;;; Enable package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
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
(use-package company-irony :ensure t)
(use-package dtrt-indent :ensure t)
(use-package evil :ensure t)
(use-package evil-surround :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package helm
  :bind ("M-x" . helm-M-x)
  :ensure t)
(use-package isend-mode :ensure t)
(use-package magit :ensure t)
(use-package solarized-theme :ensure t)

;; Activate packages
(require 'dtrt-indent)
(require 'evil)
(require 'evil-surround)
(require 'exec-path-from-shell)

;;; Enable evil-mode and force it everywhere
(evil-mode)
(global-evil-surround-mode 1)

(evil-set-initial-state 'info-mode 'normal)
(setq evil-normal-state-modes
      (append evil-motion-state-modes evil-normal-state-modes))
(setq evil-motion-state-modes nil)
(evil-define-key 'normal dired-mode-map
  "h" 'dired-up-directory
  "j" 'dired-next-line
  "k" 'dired-previous-line
  "l" 'dired-find-alternate-file)

;; Fix evil-mode term
(delete 'term-mode evil-insert-state-modes)
(add-to-list 'evil-emacs-state-modes 'term-mode)

;;; Plugin settings
;; Fix $PATH for org mode
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
;; Filetype-specific
(add-hook 'c++-mode
	  (lambda ()
            (company-mode)
            (dtrt-indent-mode 1)
            ))
(add-hook 'C-mode
	  (lambda ()
            (company-mode)
            (dtrt-indent-mode 1)
            ))

;;; Auto-completion
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;;; Editing options
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;; UI set-up
(setq solarized-use-variable-pitch nil
      solarized-scale-org-headlines nil)
(load-theme 'solarized-dark t)
(when (window-system)
  (set-face-attribute 'default nil :font "Iosevka Slab-14")
  (add-to-list 'default-frame-alist '(height . 24))
  (add-to-list 'default-frame-alist '(width . 120)))

;; Fix clipboard
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

;; Appearance settings
(when (window-system)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1))

(column-number-mode t)
(global-linum-mode t)
(show-paren-mode t)
(global-hl-line-mode t)

(setq scroll-margin 8)

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
    (dtrt-indent evil-surround magit company-irony exec-path-from-shell isend-mode evil-mode use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
