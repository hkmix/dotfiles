;;; my-platform.el -- Platform-specific settings

;;; Commentary:

;;; Code:

;; GUI settings
(when (window-system)
  (set-face-attribute 'default nil :font "Iosevka Slab-14"))

;; Revert Emacs-Mac-Port changes
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'super)
(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)
(setq frame-title-format '("%b"))

;; Clipboard
(defun pasteboard-copy()
  "Copy region to OS X system pasteboard."
  (interactive)
  (shell-command-on-region
    (region-beginning) (region-end) "pbcopy"))

(defun pasteboard-paste()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (shell-command-on-region
    (point) (if mark-active (mark) (point)) "pbpaste" nil t))

(defun pasteboard-cut()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end)))

(if window-system
  (progn
    ;; bind CMD+C to pasteboard-copy
    (global-set-key (kbd "s-c") 'pasteboard-copy)
    ;; bind CMD+V to pasteboard-paste
    (global-set-key (kbd "s-v") 'pasteboard-paste)
    ;; bind CMD+X to pasteboard-cut
    (global-set-key (kbd "s-x") 'pasteboard-cut)
    (global-set-key (kbd "s-q") 'save-buffers-kill-emacs)))

(provide 'my-platform)
;;; my-platform.el ends here
