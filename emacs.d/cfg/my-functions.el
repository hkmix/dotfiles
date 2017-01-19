;;; my-functions -- Custom functions

;;; Commentary:

;;; Code:

;; Edit the init file
(defun my/edit-init ()
  "Edit the Emacs configuration file."
  (interactive)
  (find-file user-init-file))

;; Edit a given configuration file
(defun my/edit-config (config)
  "If CONFIG is found, open that file."
  (interactive "sEnter the config name: ")
  (let ((library-path (locate-library (concat "my-" config))))
    (if (null library-path)
        (message (concat "File \"" config ".el\" not found."))
      (find-file library-path))))

(defun split-window-left ()
  "Split the window to the right and move to it."
  (interactive)
  (split-window-right)
  (evil-window-right 1))

(defun split-window-above ()
  "Split the window below and move to it."
  (interactive)
  (split-window-below)
  (evil-window-below 1))

;; DocView
;; Not quite a hook, but acts sort of like one
(defadvice doc-view-display (after fit-width activate)
  "Automatically fit the DocView document to the window."
  (doc-view-fit-width-to-window))

(provide 'my-functions)
;;; my-functions ends here
