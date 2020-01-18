;;; init.el --- Where all the magic begins

;;
;; Dotfiles readiness
;;
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(setq emacs24up (>= emacs-major-version 24))
(setq emacs23up (>= emacs-major-version 23))
(setq emacs22up (>= emacs-major-version 22))
(setq emacs21up (>= emacs-major-version 21))
(setq emacs20up (>= emacs-major-version 20))
(setq emacs19up (>= emacs-major-version 19))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; Load up ELPA, the package manager
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
;; ;; Load up ELPA, the package manager
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "Your version of Emacs does not support SSL connections"))
  (add-to-list 'package-archives
               (cons "melpa"           (concat proto "://melpa.org/packages/"))        t)
               ;; (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives
		 (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;
;; Custom paths
;;
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;;
;; Requires
;;
(require 'recentf)
(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'mrflip-modes)
(require 'mrflip-dot-emacs)
(require 'mrflip-defuns)
(require 'mrflip-bindings)

(add-to-list 'load-path              (concat dotfiles-dir "/color_themes"))
(add-to-list 'load-path              (concat dotfiles-dir "/color_themes/color-theme-mrflip-solarized"))
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/color_themes"))
(add-to-list 'custom-theme-load-path (concat dotfiles-dir "/color_themes/color-theme-mrflip-solarized"))

(require 'color-theme-mrflip-solarized)
(when window-system
  ;; (require 'color-theme-solarized)
  (load-theme 'mrflip-solarized-light t)
  (setq initial-frame-alist '( (width . 120)  (height . 80) ))
  )

;;; STFU about dotfiles dir
(delete dotfiles-dir load-path)
