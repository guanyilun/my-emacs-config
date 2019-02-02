;; This config file stores my org-babel related configuration
;; Authur: Y. Guan
;; Date: 12/18/18

;; set the path of babel environment to anaconda
(setenv "PATH" (concat "/home/aaron/anaconda3/bin:" (getenv "PATH")))

;; org babel
(org-babel-do-load-languages 'org-babel-load-languages
    '(
         (shell . t)
         (python . t)
         (ipython . t)
         (latex . t)
         (hy . t)))

;; don't prompt me to confirm everytime I want to evaluate a block
(setq org-confirm-babel-evaluate nil) 

;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;; export with code highlight
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
