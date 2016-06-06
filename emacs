;; Packages
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(require 'package)
(package-initialize)

(defvar my-packages
  '(evil
    evil-args
    evil-commentary
    evil-escape
    evil-leader
    evil-magit
    evil-numbers
    evil-org
    evil-space
    evil-surround
    git-commit
    git-gutter
    git-gutter+
    helm
    helm-core
    helm-git
    helm-ls-git
    helm-ls-hg
    helm-ls-svn
    helm-themes
    helm-unicode
    highlight-indent-guides
    magit
    magit-find-file
    magit-popup
    popup
    undo-tree
    with-editor))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Window settings
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 120))
(setq scroll-step 1)
(setq scroll-margin 6)
(setq inhibit-startup-message t)

;; Appearance
(add-to-list 'default-frame-alist '(font . "PragmataPro-14" ))
(set-face-attribute 'default t :font "PragmataPro-14" )
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

(global-linum-mode 1)
(global-hl-line-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

;; Other settings
(fset 'yes-or-no-p 'y-or-no-p)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Plugins
(evil-mode 1)

;; Key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x a r") 'align-regexp)

;; Custom variables
(custom-set-variables
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces)
