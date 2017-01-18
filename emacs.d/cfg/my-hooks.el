;;; my-hooks.el -- Mode hooks

;;; Commentary:

;;; Code:

;; C/C++
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c o") 'ff-find-other-file)
            (company-mode)
            (dtrt-indent-mode 1)
            (eldoc-mode)
            (ggtags-mode)))

(provide 'my-hooks)
;;; my-hooks.el ends here
