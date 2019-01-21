;; This config file stores my org-babel related configuration
;; Authur: Y. Guan
;; Date: 12/18/18

;; org babel
(org-babel-do-load-languages 'org-babel-load-languages
    '(
      (shell . t)
      (python . t)
      (ipython . t)
      (latex . t)
    )
)

(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block

;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
