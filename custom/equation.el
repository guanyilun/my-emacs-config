
(defvar my/org-equation-timer nil)

;;
(defun my/org-equation-preview ()
  (interactive)
  (let ((datum (org-element-context)))
    (and (memq (org-element-type datum) '(latex-environment latex-fragment))
	 (let ((beg (org-element-property :begin datum))
	       (end (org-element-property :end datum)))
           (copy-region-as-kill beg end)
           (with-current-buffer "*equation*" (erase-buffer) (yank) (org-preview-latex-fragment))))))

(defun my/org-equation-open-buffer ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (switch-to-buffer-other-window "*equation*")
  (other-window 1))

(defun my/org-equation-activate ()
  (interactive)
  (my/org-equation-open-buffer)
  (message "Activating org-equation")
  (setq my/org-equation-timer (run-with-idle-timer 1 t 'my/org-equation-preview)))

(defun my/org-equation-deactivate ()
  (interactive)
  (delete-other-windows)
  (message "Deactivating org-equation")
  (cancel-timer my/org-equation-timer))

