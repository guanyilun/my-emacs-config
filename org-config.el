;; This config file stores my org-mode related configuration
;; Authur: Y. Guan
;; Date: 12/18/18

;; The following lines are needed for org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; list of files to be loaded into agenda
(setq org-agenda-files (list "~/Dropbox/org/inbox.org"
                             "~/Dropbox/org/organizer.org"
                             "~/Dropbox/org/tickler.org"
                             "~/Dropbox/org/gcals/pitt.org"
                             "~/Dropbox/org/gcals/reminder.org"
                             "~/Dropbox/org/gcals/particle.org"))

;; capture template
(setq org-capture-templates
      '(("t" "Todo [inbox]" entry
         (file+headline "~/Dropbox/org/inbox.org" "Tasks") 
         "* TODO %i%?")
        ("T" "Tickler" entry
         (file+headline "~/Dropbox/org/tickler.org" "Tickler")
         "* %i%?")
        ("n" "Note [journal]" entry
         (file+olp+datetree "~/Dropbox/org/journal.org")
         "* Note %U\n%?")
        ("l" "Todo with link [inbox]" entry
         (file+headline "~/Dropbox/org/inbox.org" "Tasks")
         "* TODO %i%?\n%a")
        ("r" "Reading with link [inbox]" entry
         (file+headline "~/Dropbox/org/inbox.org" "Readings")
         "* Reading %?\n%a")
        ("d" "Daily [journal]" entry
         (file+olp+datetree "~/Dropbox/org/journal.org")
         (file "~/.emacs.d/templates/daily.org"))))

;; refile targets
(setq org-refile-targets '(("~/Dropbox/org/organizer.org" :maxlevel . 3)
                           ("~/Dropbox/org/someday.org" :level . 1)
                           ("~/Dropbox/org/tickler.org" :maxlevel . 2)
                           ("~/Dropbox/org/inbox.org" :maxlevel . 2)
                           ("~/Dropbox/org/journal.org" :level . 1)))

;; org mode cdlatex hook
;;(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;;(setq org2blog/wp-use-wp-latex nil)
;; this will use emacs syntax higlighting in your #+BEGIN_SRC
;; <language> <your-code> #+END_SRC code blocks.
(setq org-src-fontify-natively t)

;; default app openner
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.x?html?\\'" . "firefox %s")
        ("\\.pdf\\'" . "evince \"%s\"")
        ("\\.pdf::\\([0-9]+\\)\\'" . "evince \"%s\" -p %1")
        ("\\.pdf.xoj" . "xournal %s")))

(setq org-startup-with-inline-images t)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; THIRD PARTY PACKAGES ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ox-rst: reStructuredText Back-End for Org Export
(require 'ox-rst)

;; screenshot
(require 'org-attach-screenshot)

;; to get the citation right
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -f %f"
        "bibtex %b"
        "pdflatex -shell-escape -interaction nonstopmode -f %f"
        "pdflatex -shell-escape -interaction nonstopmode -f %f"))

;; export with code highlight
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted")))

;; org-ref
(require 'org-ref)
(setq reftex-default-bibliography '("~/Dropbox/bib/references.bib"))
(setq org-ref-bibliography-notes "~/Dropbox/bib/notes.org"
      org-ref-default-bibliography '("~/Dropbox/bib/references.bib")
      org-ref-pdf-directory "~/Dropbox/bib/bibtex-pdfs/")

;; add revtex4-1 to latex export document class
(add-to-list 'org-latex-classes
             '("revtex4-1"
               "\\documentclass{revtex4-1}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; do not use time grid by default
(setq org-agenda-use-time-grid nil)

;; default bibliography
(setq bibtex-completion-bibliography
      '("~/Dropbox/bib/references.bib"))

;; enable download mode
;; (org-download-enable)
;; (setq-default org-download-image-dir "~/Pictures/org")


;;;;;;;;;;;;;;;;;;;;
;; chinese
;;;;;;;;;;;;;;;;;;;;
;; (setq org-latex-compiler "xelatex")

;; (setq org-latex-classes (cons
;; '("ctexart" "\\documentclass{ctexart}" ("\\section{%s}"
;; . "\\section*{%s}") ("\\subsection{%s}"
;; . "\\subsection*{%s}") ("\\subsubsection{%s}"
;; . "\\subsubsection*{%s}")) org-latex-classes))

;; org-cdlatex configurations
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

(setq org-latex-prefer-user-labels t)
