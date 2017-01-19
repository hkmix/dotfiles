;;; my-packages.el -- Set up packages

;;; Commentary:

;;; Code:
;; Enable package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Automatic package installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Always download packages if needed
(setq use-package-always-ensure t)

;; Package list
(use-package company
  :diminish
  (company-mode "Cmp")
  :init
  (progn
    (global-company-mode)
    (use-package company-ycmd
      :init
      (company-ycmd-setup))))

(use-package delight
  :init
  (delight '((auto-revert-mode nil autorevert)
             (emacs-lisp-mode "Elisp" :major)

             (lisp-interaction-mode "Elisp-I" :major)
             (undo-tree-mode nil undo-tree)
             (abbrev-mode nil abbrev))))

(use-package dtrt-indent)

(use-package editorconfig
  :diminish
  editorconfig-mode
  :init
  (editorconfig-mode 1))

(use-package eldoc
  :diminish
  eldoc-mode
  :init
  (global-eldoc-mode 1))

(use-package evil
  :init
  (evil-mode t)
  :config
  (progn
    (defalias #'forward-evil-word #'forward-evil-symbol)
    (use-package evil-leader
      :init
      (global-evil-leader-mode)
      :config
      (progn
        (evil-leader/set-leader "<SPC>")
        (evil-leader/set-key
          "SPC" 'helm-M-x
          "."   'ggtags-find-definition
          ","   'ggtags-prev-mark
          "]"   'latex-close-block
          "a"   'align-regexp
          "b"   'switch-to-buffer
          "f"   'find-file
          "g s" 'git-gutter:stage-hunk
          "g r" 'git-gutter:revert-hunk
          "g n" 'git-gutter:next-hunk
          "g p" 'git-gutter:previous-hunk
          "h"   'helm-mini
          "k b" 'kill-buffer
          "m"   'magit-status
          "o"   'ff-find-alternate-file
          "p"   'helm-projectile
          "w w" 'window-configuration-to-register
          "w r" 'jump-to-register)))
    (use-package evil-commentary
      :diminish
      evil-commentary-mode
      :init
      (evil-commentary-mode))
    (use-package evil-surround
      :init
      (global-evil-surround-mode 1))
    (use-package evil-magit)
    (setq evil-normal-state-modes
          (append evil-motion-state-modes evil-normal-state-modes))
    (setq evil-motion-state-modes nil)
    (evil-define-key 'normal dired-mode-map
      "h" 'dired-up-directory
      "j" 'dired-next-line
      "k" 'dired-previous-line
      "l" 'dired-find-alternate-file)
    (delete 'term-mode evil-insert-state-modes)
    (evil-set-initial-state 'info-mode 'emacs)
    (add-to-list 'evil-emacs-state-modes 'term-mode)))

(use-package exec-path-from-shell
  :init
  (progn
    (defvar exec-path-from-shell-check-startup-files)
    (setq exec-path-from-shell-check-startup-files nil)
    (exec-path-from-shell-initialize)))

(use-package fill-column-indicator)

(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (progn
    ;; (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
    (use-package flycheck-haskell)))

(use-package ggtags)

(use-package git-gutter
  :bind
  (("C-c g s" . git-gutter:stage-hunk)
   ("C-c g r" . git-gutter:revert-hunk)
   ("C-c g n" . git-gutter:next-hunk)
   ("C-c g p" . git-gutter:previous-hunk))
  :init
  (progn
    (global-git-gutter-mode t)
    (git-gutter:linum-setup))
  :diminish
  git-gutter-mode)

(use-package haskell-mode)

(use-package helm
  :bind
  (("M-x" . helm-M-x)
   ("C-c h" . helm-mini))
  :init
  (use-package helm-projectile
    :init
    (projectile-mode)))

(use-package isend-mode)

(use-package magit
  :bind
  ("C-c m" . magit-status))

(use-package markdown-mode
  :config
  (use-package markdown-preview-eww))

(use-package projectile
  :diminish
  (projectile-mode "Prj"))

(use-package solarized-theme
  :init
  (progn
    (defvar solarized-use-variable-pitch)
    (defvar solarized-scale-org-headlines)
    (setq solarized-use-variable-pitch nil
          solarized-scale-org-headlines nil)
    (load-theme 'solarized-dark t)))

(use-package ycmd
  :init
  (progn
    (setq ycmd-server-command '("python" "/opt/ycmd/ycmd"))
    (setq ycmd-extra-conf-handler 'load)
    (setq ycmd-force-semantic-completion t)
    (global-ycmd-mode)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))
  :config
  (progn
    (use-package flycheck-ycmd
      :init
      (flycheck-ycmd-setup))))

;; Global package settings
(setq fci-rule-column 80)
(fci-mode)

(provide 'my-packages)
;;; my-packages.el ends here
