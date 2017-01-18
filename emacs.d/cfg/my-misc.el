;;; my-misc.el -- Miscellaneous settings

;;; Commentary:

;;; Code:

;; Silence some warnings
(setq ad-redefinition-action 'accept)

;; Use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'my-misc)
;;; my-misc.el ends here
