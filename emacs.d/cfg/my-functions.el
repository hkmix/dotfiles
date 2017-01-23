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
        (message (concat "File \"my-" config ".el\" not found."))
      (find-file library-path))))

;; Refresh LaTeX preview pane
(defun my/update-latex-preview ()
  "Update LaTeX preview pane."
  (interactive)
  (other-window 1)
  (revert-buffer)
  (other-window -1))

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

(provide 'my-functions)
;;; my-functions ends here
