;; lisp indentation rule
;; ref: https://www.gnu.org/software/emacs/manual/html_node/emacs/Lisp-Indent.html
(setq lisp-indent-offset nil)

;; paredit mode
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'hy-mode-hook               #'enable-paredit-mode)

;; taken from riktor
;; https://qiita.com/riktor/items/3389a790f9bd604d211c
(require 'smartparens)
(require 'paredit)
(define-key paredit-mode-map "\C-t" 'transpose-sexps)
(define-key paredit-mode-map "\M-t" 'reverse-transpose-sexps)
(define-key paredit-mode-map "\C-k" 'kill-my-sexp)
(define-key paredit-mode-map "\M-k" 'paredit-kill)
(define-key paredit-mode-map "\M-n" 'sp-next-sexp)
(define-key paredit-mode-map "\M-p" 'sp-backward-sexp)
(define-key paredit-mode-map (kbd "\C-w") 'kill-region)
(define-key paredit-mode-map (kbd "C-,") 'sp-clone-sexp)
(define-key paredit-mode-map "\M-h" 'paredit-forward-up)
(define-key paredit-mode-map "\C-h" 'paredit-forward-down)
(define-key paredit-mode-map "\M-c" 'paredit-convolute-sexp)
(define-key paredit-mode-map "\C-o" 'avy-goto-sexp-begin)
(define-key paredit-mode-map (kbd "C-S-o") 'avy-goto-sexp-end)

(defun reverse-transpose-sexps (arg)
  (interactive "*p")
  (transpose-sexps (- arg))
  (backward-sexp  arg)
  (forward-sexp 1))

(defun kill-my-sexp ()
  (interactive "*")
  (if (zerop (length (buffer-substring (point-at-bol) (point-at-eol))))
      (kill-line)
      (kill-sexp)))

(require 'avy)
(setf avy-background nil)

(defun avy-goto-sexp-begin ()
  (interactive "*")
  (let ((avy-all-windows nil))
    (avy-with avy-goto-char
      (avy--process
       (avy--regex-candidates
        (regexp-quote "("))
       (avy--style-fn avy-style)))))

(defun avy-goto-sexp-end ()
  (interactive "*")
  (let ((avy-all-windows nil))
    (avy-with avy-goto-char
      (avy--process
       (avy--regex-candidates
        (regexp-quote ")"))
       (avy--style-fn avy-style)))
    (forward-char)))
