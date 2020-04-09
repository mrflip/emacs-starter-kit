(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
;;(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$"  . web-mode)) ;; auto-enable for .ts/.tsx files
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode)) ;; auto-enable for .json files

(require 'web-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq typescript-indent-level 2)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))
(setq company-tooltip-align-annotations t) ;; aligns annotation to the right hand side
;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
;;

(setq web-mode-content-types-alist
      '(
        ("json" . "\\.json\\'")
        ("jsx" . "\\.js[x]?\\'")
        ;; ("jsx" . "\\.ts[x]?\\'")
        ))
(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-attr-indent-offset   2)
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
)
(add-hook 'web-mode-hook  'web-mode-init-hook)

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(require 'flycheck)
;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(javascript-jshint json-jsonlist)))
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint   'web-mode)
(flycheck-add-mode 'typescript-tslint   'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook              #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook           'add-node-modules-path)
(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'typescript-mode))
(add-hook 'js2-mode-hook                #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker              'javascript-eslint 'javascript-tide 'append)
;; (flycheck-add-next-checker              'javascript-eslint 'jsx-tide        'append)

(setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (before-save . tide-format-before-save)))

(require 'flycheck-pos-tip)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(define-key flycheck-mode-map flycheck-keymap-prefix nil)
(setq flycheck-keymap-prefix (kbd "C-c f"))
(define-key flycheck-mode-map flycheck-keymap-prefix
  flycheck-command-map)


(setq
 tide-format-options
 '())
   ;; :insertSpaceBeforeAndAfterBinaryOperators
   ;; t
   ;; :insertSpaceAfterConstructor
   ;; t
   ;; :placeOpenBraceOnNewLineForFunctions
   ;; nil
   ;; :baseIndentSize
   ;; 2
   ;; :indentSize
   ;; 2
   ;; :tabSize
   ;; 2
   ;; :convertTabsToSpaces
   ;; t
   ;; ))

;; insertSpaceAfterCommaDelimiter?: boolean;
;; insertSpaceAfterSemicolonInForStatements?: boolean;
;; insertSpaceBeforeAndAfterBinaryOperators?: boolean;
;; insertSpaceAfterConstructor?: boolean;
;; insertSpaceAfterKeywordsInControlFlowStatements?: boolean;
;; insertSpaceAfterFunctionKeywordForAnonymousFunctions?: boolean;
;; insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis?: boolean;
;; insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets?: boolean;
;; insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces?: boolean;
;; insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces?: boolean;
;; insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces?: boolean;
;; insertSpaceAfterTypeAssertion?: boolean;
;; insertSpaceBeforeFunctionParenthesis?: boolean;
;; placeOpenBraceOnNewLineForFunctions?: boolean;
;; placeOpenBraceOnNewLineForControlBlocks?: boolean;
;; insertSpaceBeforeTypeAnnotation?: boolean;
   ;; export const enum IndentStyle {
   ;;      None = "None",
   ;;      Block = "Block",
   ;;      Smart = "Smart",
   ;;  }

(require 'helm-config)

(require 'helm-descbinds)
(helm-descbinds-mode)

;; (eyebrowse-mode t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)


(provide 'mrflip-modes)
