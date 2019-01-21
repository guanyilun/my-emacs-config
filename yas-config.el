;; yas global turn on
(require 'yasnippet)
(yas-global-mode 1)
;; disable yasnippet autoindent which is anoyying
(setq yas/indent-line nil)

;; yas auto indent off for python-mode
(add-hook 'python-mode-hook
   '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))


