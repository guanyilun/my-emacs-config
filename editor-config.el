;; This config file stores my editing related configuration
;; Authur: Y. Guan
;; Date: 12/18/18

;; evil mode
(require 'evil)
(evil-mode 1)
(setq evil-default-state 'emacs)

;; theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'dracula t)
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; doom modeline
(require 'doom-modeline)

;; modeline configuration
;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 3)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are expereicing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; Whether display icons in mode-line or not.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display color icons for `major-mode'. It respects
;; `doom-modeline-icon' and `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display buffer modification icon. It respects `doom-modeline-icon'
;; and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether display minor modes in mode-line or not.
(setq doom-modeline-minor-modes (featurep 'minions))

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Whether display buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display indentation information.
(setq doom-modeline-indent-info nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display perspective name or not. Non-nil to display in mode-line.
(setq doom-modeline-persp-name t)

;; Whether display icon for persp name. Nil to display a # sign. It respects `doom-modeline-icon'
(setq doom-modeline-persp-name-icon nil)

;; Whether display `lsp' state or not. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)

;; Whether display GitHub notifications or not. Requires `ghub` package.
(setq doom-modeline-github nil)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
(setq doom-modeline-mu4e t)

;; Whether display irc notifications or not. Requires `circe' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display environment version or not
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; What to dispaly as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

(doom-modeline-mode 1)


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

; autofill
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

;;(require 'powerline)
;;(powerline-default-theme)

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

;; type with a selected region removes it
(delete-selection-mode t)

;; highlight current line
(global-hl-line-mode t)

;; show line number
;; (global-linum-mode t)

