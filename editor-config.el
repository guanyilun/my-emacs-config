;; This config file stores my editing related configuration
;; Authur: Y. Guan
;; Date: 12/18/18

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; indentation no tab
(setq-default indent-tabs-mode nil)

;; show column number
(setq column-number-mode t)

;; Remove menu bar and toolbar
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

;; ido mode -> replaced with helm mode
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-create-new-buffer 'always)
;; (ido-mode 1)

;; global autocomplete
;; (global-auto-complete-mode t)

;; some specific mode editing config

;; indent for javascript mode
(setq js-indent-level 2)


;; autofill
;; (setq-default auto-fill-function 'do-auto-fill)

;; fill column indicator
;; ref: https://www.emacswiki.org/emacs/FillColumnIndicator
(require 'fill-column-indicator)
(setq fci-rule-column 70)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

;; make it global mode
;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(global-fci-mode 1)

(require 'powerline)
(powerline-default-theme)

;; language tool -> grammer checking
;;(setq langtool-language-tool-jar "~/bin/LanguageTool-4.4-stable/languagetool-commandline.jar")
;;(require 'langtool)

;; flyspell mode turn on authmatically in text-mode
;; (dolist (hook '(text-mode-hook))
;;     (add-hook hook (lambda () (flyspell-mode 1))))

;; pdf-tools for viewing pdf
(pdf-tools-install)

;; automatic bookmark saving 
(setq bookmark-save-flag 1)


;; use y-n instead of yes-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; enable which-key by default
(which-key-mode)

;; open shell by default
(eshell)

;; multicursor
(require 'multiple-cursors)
(multiple-cursors-mode)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; tex text scale
(set-default 'preview-scale-function 1.2)


