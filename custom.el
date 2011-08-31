;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Set miscellaneous emacs prefs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(align-open-comment-modes (quote (vhdl-mode emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode c++-mode c-mode java-mode perl-mode cperl-mode python-mode makefile-mode ruby-mode)))
 '(align-perl-modes (quote (perl-mode cperl-mode ruby-mode)))
 '(auto-save-list-file-prefix "~/.emacs.cruft/auto-saves/.saves-")
 '(backup-directory-alist (list (cons "." (expand-file-name "~/.emacs.cruft/backups/"))))
 '(c-basic-offset 2)
 '(case-fold-search t)
 '(comment-empty-lines (quote (quote eol)))
 '(comment-multi-line nil)
 '(comment-style (quote indent))
 '(compile-command "cd . ; make -j4 -k")
 '(completion-ignore-case t t)
 '(cperl-break-one-line-blocks-when-indent nil)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-comment-at-column-0 t)
 '(cperl-indent-left-aligned-comments t)
 '(cperl-indent-level 2)
 '(cperl-indent-parens-as-block t)
 '(cperl-invalid-face nil)
 '(cperl-tab-always-indent nil)
 '(css-indent-offset 2)
 '(current-language-environment "UTF-8")
 '(custom-buffer-style (quote brackets))
 '(custom-magic-show-button t)
 '(default-major-mode (quote text-mode) t)
 '(default-truncate-lines t t)
 '(develock-max-column-plist (quote (emacs-lisp-mode nil lisp-interaction-mode nil change-log-mode nil texinfo-mode nil c-mode nil c++-mode nil java-mode nil jde-mode nil html-mode nil html-helper-mode nil cperl-mode nil perl-mode nil mail-mode nil message-mode nil cmail-mail-mode nil tcl-mode nil ruby-mode nil)))
 '(even-window-heights nil)
 '(fill-column 80)
 '(flymake-gui-warnings-enabled nil)
 '(frame-title-format "[%b] in %F, %f" t)
 '(hl-line-mode nil t)
 '(ibuffer-expert t)
 '(icon-title-format "%b" t)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-default-buffer-method (quote selected-window))
 '(ido-default-file-method (quote selected-window))
 '(ido-enable-flex-matching t)
 '(ido-enable-regexp nil)
 '(ido-ignore-directories (quote ("\\`CVS/" "\\`\\.\\./" "\\`\\./" "\\`\\.svn")))
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`\\.DS_Store" "\\`\\.Icon" "\\`LICENSE\\'")))
 '(ido-use-filename-at-point nil)
 '(indent-region-mode nil t)
 '(inhibit-startup-screen t)
 '(javascript-indent-level 2)
 '(js-auto-indent-flag nil)
 '(js2-dynamic-idle-timer-adjust 2)
 '(js2-idle-timer-delay 1)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(mark-even-if-inactive t)
 '(ns-alternate-modifier (quote super))
 '(paren-sexp-mode t)
 '(predictive-mode t)
 '(read-file-name-completion-ignore-case t)
 '(recentf-exclude (quote ("/[^/]+@[^/]+:.*")))
 '(recentf-save-file "~/.recentf")
 '(remote-shell-program "/usr/bin/ssh")
 '(require-final-newline t)
 '(ruby-deep-indent-paren nil)
 '(safe-local-variable-values (quote ((encoding . utf-8) (encoding . binary) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby") (whitespace-line-column . 80) (lexical-binding . t))))
 '(scroll-bar-mode (quote right))
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(standard-indent 2)
 '(tab-always-indent nil)
 '(tool-bar-mode nil)
 '(tramp-auto-save-directory "~/.emacs.cruft/auto-saves/")
 '(tramp-backup-directory-alist (quote ((".*" . "~/.emacs.cruft/backups/"))))
 '(tramp-completion-reread-directory-timeout 300)
 '(tramp-default-method "ssh")
 '(transient-mark-mode t)
 '(visible-bell t)
 '(x-select-enable-clipboard t t)
 '(yaml-indent-offset 2))
 

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(markdown-bold-face ((t (:weight bold))))
 '(markdown-header-face ((t (:weight bold :family "Trebuchet MS"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :underline t :height 2.0))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.5))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :slant italic :height 1.325))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :height 1.25))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :height 1.125))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :height 1.125))))
 '(markdown-inline-code-face ((t (:inherit font-lock-constant-face))))
 '(markdown-pre-face ((t (:inherit markdown-inline-code-face)))))
