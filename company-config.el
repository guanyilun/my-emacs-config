
;; auto-complete -> replaced with company-mode
;; (ac-config-default)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
