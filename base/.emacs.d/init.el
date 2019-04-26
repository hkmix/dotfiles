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
 '(package-selected-packages
   (quote
    (clang-format graphviz-dot-mode nasm-mode ccls org-ref yaml-mode try tuareg column-enforce-mode column-marker evil-tabs ws-butler which-key solarized-theme toml-mode racer flycheck-rust markdown-preview-eww cargo rust-mode projectile markdown-mode latex-preview-pane isend-mode smex ido-vertical-mode ido-completing-read+ flx-ido git-gutter ggtags flycheck-irony flycheck-ghcmod flycheck exec-path-from-shell eyebrowse evil-surround evil-matchit evil-magit evil-commentary evil-leader evil emmet-mode editorconfig dtrt-indent diminish delight company-jedi jedi-core company-web company-tern company-math company-irony company-ghc company-flx company cmake-ide use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
