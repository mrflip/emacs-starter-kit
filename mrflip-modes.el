(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode)) ;; auto-enable for .js/.jsx files
(add-to-list 'auto-mode-alist '("\\.json$" . web-mode)) ;; auto-enable for .js/.jsx files
(setq web-mode-content-types-alist
      '(
        ("json" . "\\.json\\'")
        ("jsx" . "\\.js[x]?\\'")
        ))
(defun web-mode-init-hook ()
  "Hooks for Web mode.  Adjust indent."
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook  'web-mode-init-hook)

(require 'flycheck)
;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(javascript-jshint json-jsonlist)))
;; Enable eslint checker for web-mode
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'add-node-modules-path)
;; (with-eval-after-load 'flycheck
;;   (flycheck-add-mode 'javascript-eslint 'typescript-mode))

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

(require 'helm-config)

(require 'helm-descbinds)
(helm-descbinds-mode)

;; (eyebrowse-mode t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)


(provide 'mrflip-modes)
