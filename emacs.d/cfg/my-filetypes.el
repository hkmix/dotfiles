;;; my-filetypes.el -- File types

;;; Commentary:

;;; Code:

;; C++ headers
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.editorconfig\\'" . editorconfig-conf-mode))

(provide 'my-filetypes)
;;; my-filetypes.el ends here
