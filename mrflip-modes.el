;;
;;; This alist applies to files whose first line starts with `#!'
;;
(setq interpreter-mode-alist
      (append
       '(("python"  . python-mode))
       '(("python2" . python-mode))
       '(("ruby"    . ruby-mode))
       '(("perl"    . cperl-mode))
       interpreter-mode-alist))

(add-to-list 'load-path "~/.emacs.d/color_themes")
(autoload    'color-theme-solarized-light      "color-theme-solarized"            "Color Theme based on http://ethanschoonover.com/solarized" t)
(autoload    'color-theme-solarized-dark       "color-theme-solarized"            "Color Theme based on http://ethanschoonover.com/solarized" t)

(add-to-list 'load-path "~/.emacs.d/vendor")
(autoload    'adoc-mode        "adoc-mode"        "Mode for editing AsciiDoc files"        t)
(autoload    'applescript-mode "applescript-mode" "Mode for editing applescript files"     t)
(autoload    'as3-mode         "as3-mode"         "Mode for editing Actionscript files"    t)
(autoload    'cell-mode        "cell-mode"        "Mode for lightweight spreadsheet"       t)
(autoload    'clojure-mode     "clojure-mode"     "Mode for editing clojure files"         t)
(autoload    'coffee-mode      "coffee-mode"      "Mode for editing coffeescript files"    t)
(autoload    'docbook-xml-mode "docbook-xml-mode" "Mode for editing Docbook XML files"     t)
(autoload    'erlang-mode      "erlang-mode"      "Mode for editing erlang files"          t)
(autoload    'feature-mode     "feature-mode"     "Mode for editing cucumber files"        t)
(autoload    'haml-mode        "haml-mode"        "Mode for editing HAML files"            t)
(autoload    'js2-mode         "js2-mode"         "Mode for editing js2 files"             t)
(autoload    'markdown-mode    "markdown-mode"    "Mode for editing markdown files"        t)
(autoload    'mmm-mode         "mmm-mode"         "Mode for editing mmm files"             t)
(autoload    'nginx-mode       "nginx-mode"       "Mode for editing nginx config files"    t)
(autoload    'nxml-mode        "nxml-mode"        "Mode for editing XML files"             t)
(autoload    'php-mode         "php-mode"         "Mode for editing PHP files"             t)
(autoload    'pig-mode         "pig-mode"         "Mode for editing Hadoop Pig files"      t)
(autoload    'rhtml-mode       "rhtml-mode"       "Mode for editing rhtml files"           t)
(autoload    'rspec-mode       "rspec-mode"       "Mode for editing RSpec files"           t)
(autoload    'ruby-mode        "ruby-mode"        "Mode for editing ruby files"            t)
(autoload    'ruby-electric-mode "ruby-electric"  "Mode for whizzy braces in Ruby"         t)
(autoload    'sass-mode        "sass-mode"        "Mode for editing SASS files"            t)
(autoload    'scss-mode        "scss-mode"        "Mode for editing SCSS files"            t)
(autoload    'sinatra-mode     "sinatra-mode"     "Mode for editing sinatra files"         t)
(autoload    'wc-mode          "wc-mode"          "Mode for counting words, etc in region" t)
(autoload    'yaml-mode        "yaml-mode"        "Mode for editing YAML files"            t)
(autoload    'textile-mode     "textile-mode"     "Mode for editing Textile files"         t)

(autoload    'R-mode           "vendor/ess/lisp/ess-site" "Mode for editing R, sas, etc files" t)

;; (insert (prin1-to-string auto-mode-alist))
(setq auto-mode-alist (append (list
    '("\\(M\\|m\\|GNUm\\)akefile\\([.-].*\\)?$" . makefile-mode)
    '("\\.\\(xml\\|xsl\\|xsd\\|kml\\|rng\\|mxml\\)\\(\\.erb\\)?$" . nxml-mode)
    '("\\.\\(adoc\\|asciidoc\\|ad\\)$" . adoc-mode)
    '("\\.as$"                       . actionscript-mode)
    '("\\.\\(i|xs\\)$"               . c-mode)
    '("\\.\\([pP][LlMm]\\|al\\)$"    . cperl-mode)
    '("\\.css\\(\\.erb\\)?$"         . css-mode)
    '("\\.feature$"                  . feature-mode)
    '("\\.m$"                        . matlab-mode)
    '("\\.[rsx]html?\\(\\.erb\\)?$"  . nxhtml-mode)
    '("\\.py.?$"                     . python-mode)
    '("\\([cC]ap\\|[Rr]ake\\)file$"  . ruby-mode)
    '("\\.\\(gemspec\\|god\\)$"      . ruby-mode)
    '("\\.sass$"                     . sass-mode)
    '("\\.haml$"                     . haml-mode)
    '("\\.pig$"                      . pig-mode)
    '("\\.ya?ml$"                    . yaml-mode)
    '("\\.feature\\(\\.erb\\)?$"     . feature-mode)
    '("\\.ile\\.txt\\(\\.erb\\)?$"   . textile-mode)
    '("\\.textile\\(\\.erb\\)?$"     . textile-mode)
    '("\\.markdown\\(\\.erb\\)?$"    . markdown-mode)
    '("\\.md\\(\\.erb\\)?$"          . markdown-mode)
    '("\\.coffee\\(\\.erb\\)?$"      . coffee-mode)
    '("\\.php\d?$"                   . php-mode)
    '("\\.avdl$"                     . c-mode)
    '("\\.av\(pr|sc\)$"              . js-mode)
    '("\\.[Rr]$"                     . R-mode)
    ;; add more modes here
    ) auto-mode-alist))


;; if it's a shebang script, make is exemacutable
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(defun ruby-eval-buffer () (interactive)
  "Evaluate the buffer with ruby."
  (shell-command-on-region (point-min) (point-max) "ruby"))

;;; override definition in starter-kit-defuns.el
(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|KLUDGE\\|HACK\\)[-: ]"
          1 font-lock-warning-face t))))

;; make tab be a tab in text modes...
(defun insert-literal-tab (args) "insert a literal tab." (interactive '("")) (message args) (insert "	"))
;; (define-key adoc-mode-map     (kbd "<tab>") 'insert-literal-tab)

(add-hook 'ruby-mode-hook
  (lambda()
    (add-hook 'local-write-file-hooks '(lambda() (save-excursion (untabify (point-min) (point-max)) (delete-trailing-whitespace) )))
    (set (make-local-variable 'indent-tabs-mode) 'nil)
    (imenu-add-to-menubar "IMENU")
    (ruby-electric-mode t)
    (inf-ruby-keys)
    ;; (rails-minor-mode)
    ))

(add-hook 'coding-hook
          'turn-off-auto-fill)

(add-hook 'haml-mode-hook
          (lambda()
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            ))

(add-hook 'text-mode-hook
          (lambda()
            (define-key text-mode-map     (kbd "<tab>") 'insert-literal-tab)
            ))

(add-hook 'pig-mode-hook
          (lambda()
            (set (make-local-variable 'tab-width) '2)
            ))

(add-hook 'markdown-mode-hook
          (lambda()
            (set-fill-column 100)
            (visual-line-mode)
            (add-watchwords)
            (set (make-local-variable 'tab-width) 8)
            (define-key markdown-mode-map (kbd "<tab>") 'insert-literal-tab)
            ;; (set (make-local-variable 'paragraph-start)
            ;;      "\f\\|[ \t]*$\\|^[ \t*][0-9]+\\.\\|^[ \t]*: ")
            ;; ;;   "\f\\|[ \t]*$\\|^[ \t*][0-9]+\\.\\|^[ \t]*: |^[ \t]*[*+-] \\")
            ))
;; (modify-syntax-entry ?\" "\"" markdown-mode-syntax-table)

(add-hook 'adoc-mode-hook
          (lambda()
            (add-watchwords)
            (set-fill-column 100)
            (visual-line-mode)
            (buffer-face-mode -1)
            ))

(add-hook 'coffee-mode-hook
          (lambda()
            (add-watchwords)
            (set (make-local-variable 'tab-width) 2)
            ))

(c-add-style "flipjava" '(
             (c-basic-offset . 2)
             (c-comment-only-line-offset 0 . 0)
             (c-offsets-alist
              (inline-open           . 0)
              (topmost-intro-cont    . +)
              (statement-block-intro . +)
              (knr-argdecl-intro     . 5)
              (substatement-open     . +)
              (substatement-label    . +)
              (label                 . +)
              (statement-case-open   . +)
              (statement-cont        . +)
              ;; (arglist-intro      . c-lineup-arglist-intro-after-paren)
              (arglist-intro         . +)
              (arglist-cont          . +)
              (arglist-cont-nonempty . +)
              (arglist-close         . c-lineup-arglist)
              (access-label          . 0)
              (inher-cont            . c-lineup-java-inher)
              (func-decl-cont        . c-lineup-java-throws))))

(add-hook 'java-mode-hook
          (lambda()
            (add-watchwords)
            (set (make-local-variable 'tab-width) 4)
            (set (make-local-variable 'standard-indent) 4)
            (set (make-local-variable 'c-basic-offset) 'set-from-style)
            (c-set-style "flipjava")
            ))


;; (add-hook 'php-mode-hook
;;           (lambda()
;;             (add-watchwords)
;;             (set (make-local-variable 'tab-width) 4)
;;             (set (make-local-variable 'standard-indent) 4)
;;             (set (make-local-variable 'c-basic-offset) 'set-from-style)
;;             (c-set-style "flipjava")
;;             ))


;; ;;; integrate ido with artist-mode
;; (defun artist-ido-select-operation (type)
;; "Use ido to select a drawing operation in artist-mode"
;; (interactive (list (ido-completing-read "Drawing operation: "
;;                                      (list "Pen" "Pen Line" "line" "straight line" "rectangle"
;;                                            "square" "poly-line" "straight poly-line" "ellipse"
;;                                            "circle" "text see-thru" "text-overwrite" "spray-can"
;;                                            "erase char" "erase rectangle" "vaporize line" "vaporize lines"
;;                                            "cut rectangle" "cut square" "copy rectangle" "copy square"
;;                                            "paste" "flood-fill"))))
;; (artist-select-operation type))
;; (defun artist-ido-select-settings (type)
;; "Use ido to select a setting to change in artist-mode"
;; (interactive (list (ido-completing-read "Setting: "
;;                                      (list "Set Fill" "Set Line" "Set Erase" "Spray-size" "Spray-chars"
;;                                            "Rubber-banding" "Trimming" "Borders"))))
;; (if (equal type "Spray-size")
;; (artist-select-operation "spray set size")
;; (call-interactively (artist-fc-get-fn-from-symbol
;;                     (cdr (assoc type '(("Set Fill" . set-fill)
;;                                        ("Set Line" . set-line)
;;                                        ("Set Erase" . set-erase)
;;                                        ("Rubber-banding" . rubber-band)
;;                                        ("Trimming" . trimming)
;;                                        ("Borders" . borders)
;;                                        ("Spray-chars" . spray-chars))))))))
;; (add-hook 'artist-mode-init-hook
;;      (lambda ()
;;        (define-key artist-mode-map (kbd "C-c C-a C-o") 'artist-ido-select-operation)
;;        (define-key artist-mode-map (kbd "C-c C-a C-c") 'artist-ido-select-settings)))


(provide 'mrflip-modes)

