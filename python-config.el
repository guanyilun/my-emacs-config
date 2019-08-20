;; enable elpy -> turn on manually
;; (elpy-enable) 

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; ob-ipython
(require 'ob-ipython)
(setq ob-ipython-command "/home/aaron/anaconda3/bin/jupyter")


;; set python path to anaconda3
(setq exec-path (append '("/home/aaron/anaconda3/bin") exec-path))
(setq python-shell-virtualenv-path "/home/aaron/anaconda3/bin/python")


(add-hook 'python-mode-hook (lambda ()
                              (require 'sphinx-doc)
                              (sphinx-doc-mode t)))

(show-paren-mode 1)
