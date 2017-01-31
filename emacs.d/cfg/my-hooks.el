;;; my-hooks.el -- Mode hooks

;;; Commentary:

;;; Code:

;; Check my-org-mode.el for Org-mode settings

;; All coding modes
(add-hook 'prog-mode-hook
          (lambda()
            (column-marker-1 80)
            (column-marker-2 100)
            (linum-mode 1)
            (company-mode 1)))

;; All text-editing modes
(add-hook 'text-mode-hook
          (lambda()
            (column-marker-1 80)
            (flyspell-mode 1)))

;; C/C++
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c o") 'ff-find-other-file)
            (company-mode 1)
            (company-ycmd-setup)
            (dtrt-indent-mode 1)
            (eldoc-mode 1)
            (ggtags-mode 1)
            (ycmd-mode 1)))

;; DocView
;; Resolution
(require 'doc-view)
(setq doc-view-resolution 200)

;; LaTeX
;; Prevent pairing for $
(add-hook 'latex-mode-hook
          (lambda ()
            (linum-mode 1)
            (setq-default electric-pair-inhibit-predicate
                          (lambda (c)
                            (if (eq "$" c)
                              (electric-pair-default-inhibit c)
                              t)))))
;; Allow revert of PDF files without confirmation
(setq revert-without-query (quote (".*\.pdf")))

;; Web
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'js-mode-hook 'tern-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

(provide 'my-hooks)
;;; my-hooks.el ends here
