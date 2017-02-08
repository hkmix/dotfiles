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
    (use-package company-flx
      :init
      (company-flx-mode +1))
    (use-package jedi-core
      :init
      (use-package company-jedi
        :init
        (add-to-list 'company-backends 'company-jedi)))
    (use-package company-math
      :init
      (add-to-list 'company-backends 'company-math-symbols-latex)
      :config
      (progn
        (setq company-tooltip-align-annotations t)))
    (use-package company-tern
      :init
      (progn
        (setq company-tern-property-marker nil)
        (add-to-list 'company-backends 'company-tern)))
    (use-package company-ycmd
      :defer t)
    (use-package company-web
      :defer t))
  :config
  (progn
    (setq company-idle-delay 0.3)
    (setq company-tooltip-limit 10)))

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
  :defer t
  :diminish
  editorconfig-mode
  :init
  (editorconfig-mode 1))

(use-package eldoc
  :defer t
  :diminish
  eldoc-mode
  :init
  (global-eldoc-mode 1))

(use-package emmet-mode
  :defer t)

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
          "a"   'align-regexp
          "b"   'switch-to-buffer
          "C"   'compile
          "c"   'recompile
          "f"   'find-file

          ;; Git-Gutter
          "g s" 'git-gutter:stage-hunk
          "g r" 'git-gutter:revert-hunk
          "g n" 'git-gutter:next-hunk
          "g p" 'git-gutter:previous-hunk

          "h"   'recentf-open-files
          "k b" 'kill-buffer
          "m"   'magit-status
          "o A" 'my/open-planner

          ;; Projectile
          "p g" 'projectile-grep
          "p h" 'projectile-recentf
          "p b" 'projectile-switch-to-buffer
          "p p" 'my/projectile-find-file-or-switch-project
          "p s" 'projectile-run-shell

          "R"   'ruler-mode
          "q q" 'fill-paragraph
          "w w" 'window-configuration-to-register
          "w r" 'jump-to-register)
        (evil-leader/set-key-for-mode 'c++-mode
          "."   'ggtags-find-definition
          ","   'ggtags-prev-mark
          "A"   'ff-find-alternate-file)
        (evil-leader/set-key-for-mode 'latex-mode
          "]"   'latex-close-block
          "L"   'latex-preview-pane-mode
          "l"   'my/update-latex-preview)
        (evil-leader/set-key-for-mode 'org-mode
          "o TAB" 'outline-show-all
          "o <backtab>" 'org-shifttab
          "o '" 'org-edit-special
          "o a" 'org-agenda
          "o c" 'org-ctrl-c-ctrl-c
          "o d" 'org-deadline
          "o e" 'org-export-dispatch
          "o l" 'my/update-latex-preview-org
          "o N" 'org-babel-next-src-block
          "o n" 'org-next-block
          "o o" 'my/open-at-point
          "o P" 'org-babel-previous-src-block
          "o p" 'org-previous-block
          "o r" 'org-reveal)
        (evil-leader/set-key-for-mode 'rust-mode
          "F"   'rust-enable-format-on-save
          "f"   'rust-format-buffer)))
    (use-package evil-commentary
      :diminish
      evil-commentary-mode
      :init
      (evil-commentary-mode 1))
    (use-package evil-magit)
    (use-package evil-matchit
      :init
      (global-evil-matchit-mode 1))
    (use-package evil-surround
      :init
      (global-evil-surround-mode 1))))

(use-package exec-path-from-shell
  :init
  (progn
    (defvar exec-path-from-shell-check-startup-files)
    (setq exec-path-from-shell-check-startup-files nil)
    (exec-path-from-shell-initialize)))

(use-package flycheck
  :defer t
  :init
  (global-flycheck-mode)
  :config
  (progn
    (use-package flycheck-haskell
      :defer t)))

(use-package ggtags
  :defer t)

(use-package git-gutter
  :defer t
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

(use-package haskell-mode
  :defer t)

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

(use-package isend-mode
    :defer t)

(use-package latex-preview-pane
  :defer t
  :diminish
  latex-preview-pane-mode)

(use-package magit
  :defer t
  :bind
  ("C-c m" . magit-status))

(use-package markdown-mode
  :defer t
  :config
  (use-package markdown-preview-eww))

;; (use-package pdf-tools
;;   :defer t
;;   :init
;;   (progn
;;     (pdf-tools-install)
;;     (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")))

(use-package projectile
  :diminish
  (projectile-mode "Prj"))

(use-package recentf
  :init
  (recentf-mode 1))

(use-package rust-mode
  :init
  (progn
    (use-package cargo)
    (use-package flycheck-rust
      :init
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
    (use-package racer
      :bind
      (:map rust-mode-map
            ("TAB" . company-indent-or-complete-common))
      :init
      (progn
        (add-hook 'rust-mode-hook #'racer-mode)
        (add-hook 'racer-mode-hook #'eldoc-mode)
        (add-hook 'racer-mode-hook #'company-mode)))
    (use-package toml-mode)))

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
  :defer t
  :init
  (progn
    (setq ycmd-server-command '("python" "/opt/ycmd/ycmd"))
    (setq ycmd-global-config "~/.emacs.d/cfg/ycm_extra_conf.py")
    (setq ycmd-extra-conf-handler 'load)
    (setq ycmd-force-semantic-completion t)
    (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))
  :config
  (progn
    (use-package flycheck-ycmd
      :defer t
      :init
      (flycheck-ycmd-setup))))

(provide 'my-packages)
;;; my-packages.el ends here
