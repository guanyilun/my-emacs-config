
(defun run-in-eshell ()
  (interactive)
  (let ((buf (buffer-file-name)))
    (switch-to-buffer-other-window "*eshell*")
    (eshell)
    (insert (concat "python " buf))
    (eshell-send-input)))
(global-set-key (kbd "<f6>") 'run-in-eshell)


(defun run-in-subprocess ()
  (interactive)
  (start-process-shell-command "my-process" "*pyoutput*"
                               "python" (buffer-file-name))
  (switch-to-buffer-other-window "*pyoutput*")
  (global-set-key (kbd "<f5>") 'run-in-subprocess))

(provide 'my-python)
