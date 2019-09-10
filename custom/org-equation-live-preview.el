
(defvar org-equation-live-preview--timer nil)
(defvar org-equation-live-preview--buffer-name "*Equation Live*")
(defvar org-equation-live-preview--org-buffer nil)
(defvar org-equation-live-preview--preview-buffer nil)

(defun org-equation-live-preview--preview ()
  (interactive)
  (let ((datum (org-element-context)))
    (and (memq (org-element-type datum) '(latex-environment latex-fragment))
	 (let ((beg (org-element-property :begin datum))
	       (end (org-element-property :end datum)))
           (copy-region-as-kill beg end)
           (with-current-buffer org-equation-live-preview--preview-buffer
             (let ((inhibit-read-only t))
               (erase-buffer) (yank)
               (org-preview-latex-fragment)))))))

(defun org-equation-live-preview--open-buffer ()
  (interactive)
  (setq org-equation-live-preview--org-buffer (current-buffer))
  (let ((buffer-name org-equation-live-preview--buffer-name))
    (setq org-equation-live-preview--preview-buffer
          (get-buffer-create buffer-name))
    (switch-to-buffer-other-window buffer-name)
    (special-mode)
    (other-window 1)))

(defun org-equation-live-preview--activate ()
  (interactive)
  (org-equation-live-preview--open-buffer)
  (message "Activating org-equation")
  (setq org-equation-live-preview--timer
        (run-with-idle-timer 0.5 t 'org-equation-live-preview--preview)))

(defun org-equation-live-preview--deactivate ()
  (interactive)
  (delete-other-windows)
  (message "Deactivating org-equation")
  (cancel-function-timers 'org-equation-live-preview--preview))


(provide 'org-equation-live-preview)
