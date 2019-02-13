;; this file contains some of my own key bindings

;; magit 
(global-set-key (kbd "C-x g") 'magit-status)

;; avy mode
(global-set-key (kbd "C-;") 'avy-goto-char)


;; open unread email
(defun check-unread ()
  "Check unread emails"
  (interactive)
  (mu4e-alert-view-unread-mails)
  (mu4e-headers-rerun-search)
)     
(bind-key "C-c m" 'check-unread)


;; unfill-paragrah
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn
                 (barf-if-buffer-read-only)
                 (list t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))
(bind-key "M-Q" 'unfill-paragraph)


;; daily review
(defun daily-review ()
  "Add and focus on daily review entry"
  (interactive)
  (progn
    (org-capture nil "d")
    (delete-other-windows)
    (org-capture-finalize t)
    (org-speed-move-safe 'outline-up-heading)
    (org-narrow-to-subtree)
  )
)
;;(bind-key "C-c r" 'daily-review)


;; toggle from vertical split to horizontal split
(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((toggle (if (window-full-height-p)
                    'split-window-vertically
                    'split-window-horizontally)))
      (delete-other-windows)
      (funcall toggle)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))
(bind-key "C-x t" 'window-split-toggle)


;; move subtree up / down
(bind-key "C-x <down>" 'org-move-subtree-down)
(bind-key "C-x <up>" 'org-move-subtree-up)


;; interleave mode 
(bind-key "C-c i" 'interleave-mode)


;; comment box
(bind-key "C-c #" 'comment-box)


;; paredit mode
(defun my-paredit-convolute-sexp ()
    (interactive "*")
    (paredit-convolute-sexp)
    (paredit-forward)    
    (backward-char 2)
    (delete-char 1)
    (backward-char -1))
;; add key mapping
(bind-key "C-." 'my-paredit-convolute-sexp)

;; interleave facility function
;; a function that move a file to the default
;; directory and open an interleave entry
;; for the file
;; TODO: define variables to store the default path
(defun send-to-read (filepath)
  (interactive "f")
  (let ((filename (car (last (split-string filepath "/"))))
        (new-path (concat "/home/aaron/Documents/Reading/" (car (last (split-string filepath "/")))))
        (old-path filepath))
    ;; transfer file to default directory
    (copy-file old-path new-path)
    ;; create a new heading in default reading file
    (find-file "/home/aaron/Dropbox/org/notes/reading.org")
    (end-of-buffer)
    (org-insert-heading nil nil 't)
    (insert filename)
    ;; set property
    (org-set-property "INTERLEAVE_PDF" new-path)
    ;; start interleave-mode
    (interleave-mode)))

(bind-key "C-c r" 'send-to-read)
