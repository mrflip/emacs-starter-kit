;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   Set miscellaneous emacs prefs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(case-fold-search t)
 '(coffee-tab-width 2)
 '(comment-empty-lines (quote (quote eol)))
 '(comment-multi-line nil)
 '(comment-style (quote indent))
 '(completion-ignore-case t t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(css-indent-offset 2)
 '(default-major-mode (quote text-mode) t)
 '(default-truncate-lines t t)
 '(eyebrowse-keymap-prefix "w")
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-keymap-prefix "f")
 '(flycheck-mode-hook
   (quote
    (flycheck-color-mode-line-mode add-node-modules-path flycheck-mode-set-explicitly)))
 '(flycheck-pos-tip-timeout 9)
 '(js-indent-first-init (quote dynamic))
 '(js-indent-level 2)
 '(mark-even-if-inactive t)
 '(package-selected-packages
   (quote
    (use-package company tide tss typescript-mode eyebrowse helm-css-scss helm-dired-recent-dirs helm-flycheck helm-git helm-git-grep helm-grepint helm-lib-babel helm-ls-git helm-rails helm-unicode helm-wordnet helm-descbinds ibuffer-projectile projectile projectile-direnv projectile-variable docker-tramp tramp tramp-auto-auth tramp-term tramp-theme powerline adaptive-wrap airline-themes diminish prog-fill spaceline flycheck-popup-tip flycheck-pos-tip exec-path-from-shell enh-ruby-mode flycheck-color-mode-line flycheck-jest flycheck-kotlin flycheck-swift3 flycheck-yamllint graphql-mode add-node-modules-path flycheck yaml-mode wc-mode vue-mode solarized-theme sass-mode rspec-mode rinari rhtml-mode project-local-variables pig-mode php-mode paredit nginx-mode markless markdown-preview-eww markdown-mode+ magit lua-mode lfe-mode js3-mode js2-mode jekyll-modes idle-highlight html-to-markdown gist find-file-in-project dockerfile-mode color-theme coffee-mode applescript-mode adoc-mode)))
 '(persp-mode nil)
 '(persp-sort (quote access))
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(standard-indent 2)
 '(tab-always-indent nil)
 '(tide-completion-detailed t)
 '(tide-completion-ignore-case t)
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(web-mode-block-padding 2)
 '(web-mode-comment-formats
   (quote
    (("jsx" . "//")
     ("java" . "/*")
     ("javascript" . "//")
     ("php" . "/*")
     ("css" . "/*"))))
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-current-element-highlight t)
 '(yaml-indent-offset 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "#002b36" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Menlo"))))
 '(flycheck-color-mode-line-error-face ((t (:background "#faeedc" :foreground "#dc322f"))))
 '(flycheck-color-mode-line-warning-face ((t (:background "#e3eea9" :foreground "#353525"))))
 '(mmm-default-submode-face ((t nil)))
 '(mode-line-inactive ((t (:inherit mode-line :background "#93a1a1" :foreground "#e7fde4" :box (:line-width 1 :color "#657b83") :weight normal))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "#839496"))))
 '(web-mode-current-element-highlight-face ((t (:background "#eee8d5" :foreground "#222222"))))
 '(web-mode-json-key-face ((t (:foreground "#268bd2")))))
