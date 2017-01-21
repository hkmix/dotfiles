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
(use-package column-marker)

(use-package company
  :diminish
  (company-mode "Cmp")
  :init
  (progn
    (global-company-mode)
    (use-package company-ycmd)
    (use-package company-jedi
      :config
      (add-to-list 'company-backends 'company-jedi))))

(use-package delight
  :init
  (delight '((emacs-lisp-mode "Elisp" :major)
             (lisp-interaction-mode "Elisp-I" :major)
             ;; Minor modes
             (abbrev-mode nil abbrev)
             (auto-revert-mode nil autorevert)
             (flyspell-mode " FlyS" flyspell)
             (undo-tree-mode nil undo-tree)
             (visual-line-mode nil simple))))

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
  (progn
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (evil-mode t))
  :config
  (progn
    (defalias #'forward-evil-word #'forward-evil-symbol)
    (define-key evil-normal-state-map "j" 'evil-next-visual-line)
    (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
    (evil-define-key 'normal dired-mode-map
      "h" 'dired-up-directory
      "j" 'dired-next-line
      "k" 'dired-previous-line
      "l" 'dired-find-alternate-file)
    (use-package evil-leader
      :init
      (global-evil-leader-mode)
      :config
      (progn
        (evil-leader/set-leader "<SPC>")
        (evil-leader/set-key
          "SPC" 'smex
          "."   'ggtags-find-definition
          ","   'ggtags-prev-mark
          "]"   'latex-close-block
          "A"   'ff-find-alternate-file
          "a"   'align-regexp
          "b"   'switch-to-buffer
          "f"   'find-file

          ;; Git-Gutter
          "g s" 'git-gutter:stage-hunk
          "g r" 'git-gutter:revert-hunk
          "g n" 'git-gutter:next-hunk
          "g p" 'git-gutter:previous-hunk

          "h"   'recentf-open-files
          "k b" 'kill-buffer
          "m"   'magit-status

          ;; Org-mode
          "o TAB" 'outline-show-all
          "o <backtab>" 'org-shifttab
          "o '" 'org-edit-special
          "o a" 'org-agenda
          "o c" 'org-ctrl-c-ctrl-c
          "o e" 'org-export-dispatch
          "o n" 'org-next-block
          "o o" 'org-open-at-point
          "o p" 'org-previous-block
          "o P" 'org-latex-export-to-pdf
          "o r" 'org-reveal

          "p"   'projectile-find-file
          "w w" 'window-configuration-to-register
          "w r" 'jump-to-register)))
    (use-package evil-commentary
      :diminish
      evil-commentary-mode
      :init
      (evil-commentary-mode 1))
    (use-package evil-surround
      :init
      (global-evil-surround-mode 1))
    (use-package evil-magit)))

(use-package exec-path-from-shell
  :init
  (progn
    (defvar exec-path-from-shell-check-startup-files)
    (setq exec-path-from-shell-check-startup-files nil)
    (exec-path-from-shell-initialize)))

(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (progn
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

(use-package ido
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  :config
  (progn
    (use-package flx-ido
      :init
      (flx-ido-mode 1)
      :config
      (progn
        (setq ido-enable-flex-matching t)
        (setq ido-use-faces nil)))
    (use-package ido-ubiquitous
      :init
      (ido-ubiquitous-mode 1))
    (use-package ido-vertical-mode
      :init
      (ido-vertical-mode 1)
      :config
      (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))
    (use-package smex
      :bind
      (("M-x" . smex)
       ("M-X" . smex-major-mode-commands)
       ("C-c M-x" . execute-extended-command))
      :init
      (smex-initialize))))

(use-package isend-mode)

(use-package latex-preview-pane
  :diminish
  latex-preview-pane-mode
  :init
  (latex-preview-pane-enable))

(use-package magit
  :bind
  ("C-c m" . magit-status))

(use-package markdown-mode
  :config
  (use-package markdown-preview-eww))

(use-package projectile
  :diminish
  (projectile-mode "Prj"))

(use-package recentf
  :init
  (recentf-mode 1))

(use-package solarized-theme
  :init
  (progn
    (defvar solarized-use-variable-pitch)
    (setq solarized-use-variable-pitch nil)
    (load-theme 'solarized-dark t)))

(use-package ws-butler
  :diminish
  ws-butler-mode
  :init
  (progn
    (define-globalized-minor-mode global-ws-butler-mode ws-butler-mode
      (lambda ()
        (ws-butler-mode t)))
    (global-ws-butler-mode t)))

(use-package ycmd
  :init
  (progn
    (setq ycmd-server-command '("python" "/opt/ycmd/ycmd"))
    (setq ycmd-extra-conf-handler 'load)
    (setq ycmd-force-semantic-completion t)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))
  :config
  (progn
    (use-package flycheck-ycmd
      :init
      (flycheck-ycmd-setup))))

(provide 'my-packages)
;;; my-packages.el ends here
