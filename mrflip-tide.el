
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

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
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
