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

;; Force open file in Emacs
(defun my/open-at-point ()
  "Force open file at point in Emacs."
  (interactive)
  (org-open-at-point t))

;; Invoke projectile-find-file if we are in a project, or start the switcher
(defun my/projectile-find-file-or-switch-project ()
  "Invoke Projectile file finder if in a project, else start project switcher."
  (interactive)
  (if (projectile-project-p)
      (projectile-find-file)
    (projectile-switch-project)))

;; Refresh LaTeX preview pane
(defun my/update-latex-preview ()
  "Update LaTeX preview pane."
  (interactive)
  (evil-window-right 1)
  (revert-buffer)
  (evil-window-left 1))

;; Refresh Org-mode latex
(defun my/update-latex-preview-org ()
  "Update LaTeX preview pane in Org-mode."
  (interactive)
  (org-latex-export-to-pdf)
  ;; The function below is only needed if we are using PDF-tools
  ;; (my/update-latex-preview)
  )

(defun my/split-window-left ()
  "Split the window to the right and move to it."
  (interactive)
  (split-window-right)
  (evil-window-right 1))

(defun my/split-window-above ()
  "Split the window below and move to it."
  (interactive)
  (split-window-below)
  (evil-window-below 1))

;; Edit the init file
(defun my/open-planner ()
  "Edit the planner file."
  (interactive)
  (find-file "~/Drive/planner.org"))

(provide 'my-functions)
;;; my-functions ends here
