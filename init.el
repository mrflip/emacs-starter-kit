;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Load path etc.

(setq       ns-option-modifier  'super )
(setq       ns-command-modifier 'meta )
(define-key global-map           [home] 'beginning-of-line)
(define-key global-map           [end]  'end-of-line)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(add-to-list 'load-path dotfiles-dir)

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))

;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/applescript-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/as3-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/cell-mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/clojure-mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/coffee-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme@"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/cucumber-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/docbook-xml-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/erlang_mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/haml-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/js2-mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/markdown-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/mmm-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/nginx-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/nxml-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/paredit"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/php-mode-el"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/pig-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/rhtml-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/rinari"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/sass-mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/scss-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/sinatra-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/wc-mode"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yaml-mode"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippets-js"))
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippets-ruby"))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/markup-faces"))
(add-to-list 'load-path (concat dotfiles-dir "/vendor/adoc-mode"))

(setq emacs22up (>= emacs-major-version 22))
(setq emacs21up (>= emacs-major-version 21))
(setq emacs20up (>= emacs-major-version 20))
(setq emacs19up (>= emacs-major-version 19))

;; ;; Load up ELPA, the package manager
;; (require 'package)
;; (dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
;;                   ("elpa" . "http://tromey.com/elpa/")))
;;   (add-to-list 'package-archives source t))
;; (package-initialize)
;; (require 'starter-kit-elpa)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

;; (require 'cl)
;; (require 'saveplace)
;; (require 'ffap)
;; (require 'uniquify)
;; (require 'ansi-color)
(require 'recentf)

;; backport some functionality to Emacs 22 if needed
(require 'dominating-file)

;; Load up starter kit customizations

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
(require 'mrflip-modes)
(require 'mrflip-dot-emacs)
(require 'mrflip-defuns)
(require 'mrflip-bindings)

;; (regen-autoloads)
(load custom-file 'noerror)

;; ;; You can keep system- or user-specific customizations here
;; (setq system-specific-config (concat dotfiles-dir system-name ".el")
;;       user-specific-config   (concat dotfiles-dir user-login-name ".el")
;;       user-specific-dir      (concat dotfiles-dir user-login-name))
;; (add-to-list 'load-path user-specific-dir)
;; 
;; (if (file-exists-p system-specific-config) (load system-specific-config))
;; (if (file-exists-p user-specific-config) (load user-specific-config))
;; (if (file-exists-p user-specific-dir)
;;     (mapc #'load (directory-files user-specific-dir nil ".*el$")))

(if window-system (color-theme-solarized-light))

;;; init.el ends here
