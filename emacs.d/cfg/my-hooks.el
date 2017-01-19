;;; my-hooks.el -- Mode hooks

;;; Commentary:

;;; Code:

;; All coding modes
(add-hook 'prog-mode-hook
          (lambda()
            (linum-mode 1)
            (company-mode 1)))

;; All text-editing modes
(add-hook 'text-mode-hook
          (lambda()
            (flyspell-mode 1)))

;; C/C++
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c o") 'ff-find-other-file)
            (company-mode 1)
            (dtrt-indent-mode 1)
            (eldoc-mode 1)
            (ggtags-mode 1)))

;; DocView
;; Not quite a hook, but acts sort of like one
(defadvice doc-view-display (after fit-width activate)
  "Automatically fit the DocView document to the window."
  (doc-view-fit-width-to-window))

(provide 'my-hooks)
;;; my-hooks.el ends here
