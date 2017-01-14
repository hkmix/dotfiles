;;; Enable package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;; Automatic package installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;;; Key bindings
(global-set-key (kbd "<escape>") 'keyboard-quit)

;;; Package list
(use-package company
  :config (use-package company-irony
            :config (add-to-list 'company-backends 'company-irony)))
(use-package delight
  :init (delight '((auto-revert-mode nil autorevert)
                   (emacs-lisp-mode "Elisp" :major)
                   (undo-tree-mode nil undo-tree))))
(use-package dtrt-indent)
(use-package evil
  :init (progn
          (evil-mode t)
          (use-package evil-commentary
            :diminish evil-commentary-mode
            :config (evil-commentary-mode))
          (use-package evil-surround
            :config (global-evil-surround-mode 1))
          (use-package evil-magit)
          (evil-set-initial-state 'info-mode 'normal)
          (setq evil-normal-state-modes
                (append evil-motion-state-modes evil-normal-state-modes))
          (setq evil-motion-state-modes nil)
          (evil-define-key 'normal dired-mode-map
            "h" 'dired-up-directory
            "j" 'dired-next-line
            "k" 'dired-previous-line
            "l" 'dired-find-alternate-file)
          (delete 'term-mode evil-insert-state-modes)
          (add-to-list 'evil-emacs-state-modes 'term-mode)))
(use-package exec-path-from-shell
  :init (exec-path-from-shell-initialize))
(use-package flycheck
  :init (global-flycheck-mode)
  :config (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
(use-package git-gutter
  :bind (("C-c g s" . git-gutter:stage-hunk)
         ("C-c g r" . git-gutter:revert-hunk)
         ("C-c g n" . git-gutter:next-hunk)
         ("C-c g p" . git-gutter:previous-hunk))
  :init (progn
          (global-git-gutter-mode t)
          (git-gutter:linum-setup))
  :diminish git-gutter-mode)
(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-c h" . helm-mini))
  :init (use-package helm-projectile
          :bind ("C-c p" . helm-projectile)))
(use-package isend-mode)
(use-package magit
  :bind ("C-c m" . magit-status))
(use-package projectile)
(use-package solarized-theme
  :init (progn
          (defvar solarized-use-variable-pitch)
          (defvar solarized-scale-org-headlines)
          (setq solarized-use-variable-pitch nil
                solarized-scale-org-headlines nil)
          (load-theme 'solarized-dark t)))

;;; Org-mode languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (haskell . t)
   (latex . t)
   (python . t)))

;;; Mode hooks
(add-hook 'c-mode-common-hook
          (progn
            (company-mode)
            (dtrt-indent-mode 1)))

;;; Editing options
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;; UI set-up
;; Appearance
(when (window-system)
  (set-face-attribute 'default nil :font "Iosevka Slab-14")
  (add-to-list 'default-frame-alist '(height . 24))
  (add-to-list 'default-frame-alist '(width . 120))
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1))

(column-number-mode t)
(global-linum-mode t)
(show-paren-mode t)
(global-hl-line-mode t)

(setq scroll-margin 8)

;; Fix clipboard
(setq select-enable-clipboard nil)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

;;; Misc options
(setq ad-redefinition-action 'accept) ; Silence some warnings

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
    (git-gutter helm-projectile dtrt-indent evil-surround magit company-irony exec-path-from-shell isend-mode evil-mode use-package evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
