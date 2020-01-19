(column-number-mode t)		;; Display column number on mode line
;; (setq ns-pop-up-frames nil)

(require 'uniquify)
(setq 
  uniquify-buffer-name-style 'forward
  uniquify-separator "/")

;; GUI customizations
(when window-system
  ;; (color-theme-solarized-light)
  )

;; These are baffling and I don't want them in my life.
(put 'narrow-to-page 'disabled t)
(put 'narrow-to-defun 'disabled t)
(put 'narrow-to-region 'disabled t)

;;
;; Regulate how auto-save files are stored
;;
(defvar user-temporary-file-directory (concat "/foo/emacs-cruft/" user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying   t
      version-control     t
      kept-new-versions   6
      kept-old-versions   2
      delete-old-versions t )
(setq auto-save-list-file-prefix     (concat user-temporary-file-directory "auto-saves-"))
(setq auto-save-file-name-transforms `((".*"   ,user-temporary-file-directory t)))
(setq backup-directory-alist         `(("."  . ,user-temporary-file-directory)  (,tramp-file-name-regexp nil)))
(setq tramp-backup-directory-alist   `((".*" . ,user-temporary-file-directory)))
(setq tramp-auto-save-directory      (concat user-temporary-file-directory "tramp-saves"))
(setq create-lockfiles               nil) ; must be using patch https://raw.github.com/gist/2100737


(add-hook 'js-mode-hook (lambda () (setq syntax-ppss-table nil)))
(setq mmm-js-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
(setq mmm-typescript-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))

(provide 'mrflip-dot-emacs)
