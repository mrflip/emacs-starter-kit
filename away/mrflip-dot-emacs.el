;;
;; convenience
;; (normal-erase-is-backspace-mode)
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value) 
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;   Set Window Font, Size and Position
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;

(setq myfont "-apple-menlo-medium-r-normal--*-125-*-*-m-*-*-*")
;;(set-default-font "fixed")
;;(setq myfont "Bitstream Vera Sans Mono-9")
;; To choose a font try C-x C-e on (menu-set-font) (Or hit C-M-s-t)
(if emacs22up 
    (progn (set-default-font myfont)
           (add-to-list 'default-frame-alist (cons 'font myfont)) )
  ;;else
  (set-default-font "fixed") ) 

;; Several mysterious but important customizations.
(set-input-mode t nil t)
(put 'eval-expression	 'disabled nil)
(put 'narrow-to-region	 'disabled nil)
(put 'upcase-region	 'disabled nil)
(put 'downcase-region	 'disabled nil)
(prefer-coding-system    'utf-8)
(column-number-mode t)		;; Display column number on mode line	

(setq ns-pop-up-frames nil)

;; yasnippet
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")

;; ;; UNTESTED
;;
;; (defun tags-complete-tag (string predicate what)
;;   (save-excursion
;;   ;; If we need to ask for the tag table, allow that.
;;   (if (eq what t)
;;      (all-completions string (tags-completion-table) predicate)
;;    (try-completion string (tags-completion-table) predicate))))

;; reorder hippie expand

(setq hippie-expand-try-functions-list (delete 'try-complete-lisp-symbol-partially hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-lisp-symbol           hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially   hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name             hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (append hippie-expand-try-functions-list '(try-complete-file-name-partially)))

;; disable vc-mode
(setq vc-handled-backends nil)
(setq vc-ignore-dir-regexp (format "\\(%s\\)\\|\\(%s\\)" vc-ignore-dir-regexp tramp-file-name-regexp))

(require 'uniquify)
(setq 
  uniquify-buffer-name-style 'forward
  uniquify-separator "/")

(provide 'mrflip-dot-emacs)
