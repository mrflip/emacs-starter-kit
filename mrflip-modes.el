
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
(autoload    'applescript-mode "applescript-mode" "Mode for editing applescript files"     t)
(autoload    'as3-mode         "as3-mode"         "Mode for editing Actionscript files"    t)
(autoload    'cell-mode        "cell-mode"        "Mode for lightweight spreadsheet"       t)
(autoload    'clojure-mode     "clojure-mode"     "Mode for editing clojure files"         t)
(autoload    'coffee-mode      "coffee-mode"      "Mode for editing coffeescript files"    t)
(autoload    'docbook-xml-mode "docbook-xml-mode" "Mode for editing Docbook XML files"     t)
(autoload    'erlang-mode      "erlang-mode"      "Mode for editing erlang files"          t)
(autoload    'feature-mode     "cucumber-mode"    "Mode for editing cucumber files"        t)
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
(autoload    'sass-mode        "sass-mode"        "Mode for editing SASS files"            t)
(autoload    'scss-mode        "scss-mode"        "Mode for editing SCSS files"            t)
(autoload    'sinatra-mode     "sinatra-mode"     "Mode for editing sinatra files"         t)
(autoload    'wc-mode          "wc-mode"          "Mode for counting words, etc in region" t)
(autoload    'yaml-mode        "yaml-mode"        "Mode for editing YAML files"            t)
(autoload    'textile-mode     "textile-mode"     "Mode for editing Textile files"         t)
(autoload  'ruby-electric-mode "ruby-electric"    "Mode for whizzy braces in Ruby"         t)

;; (insert (prin1-to-string auto-mode-alist))
(setq auto-mode-alist (append (list
    '("\\(M\\|m\\|GNUm\\)akefile\\([.-].*\\)?$" . makefile-mode)
    '("\\.\\(xml\\|xsl\\|xsd\\|kml\\|rng\\|mxml\\)\\(\\.erb\\)?$" . nxml-mode)
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
    '("\\.php\d?$"                   . php-mode)
    '("\\.avdl$"                     . c-mode)
    '("\\.av\(pr|sc\)$"              . js-mode)
    ;; add more modes here
    ) auto-mode-alist))


;; if it's a shebang script, make is exemacutable
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(defun ruby-eval-buffer () (interactive)
  "Evaluate the buffer with ruby."
  (shell-command-on-region (point-min) (point-max) "ruby"))

(add-hook 'ruby-mode-hook
  (lambda()
    (add-hook 'local-write-file-hooks '(lambda() (save-excursion (untabify (point-min) (point-max)) (delete-trailing-whitespace) )))
    (set (make-local-variable 'indent-tabs-mode) 'nil)
    (imenu-add-to-menubar "IMENU")
    ;; (require 'ruby-electric)
    (ruby-electric-mode t)
    (inf-ruby-keys)
    ;; (rails-minor-mode)
    ))

(add-hook 'haml-mode-hook (lambda () (set (make-local-variable 'indent-tabs-mode) 'nil) ))

(add-hook 'markdown-mode-hook
          '(lambda ()
             (define-key markdown-mode-map (kbd "<tab>") 'indent-for-tab-command)
             (set (make-local-variable 'paragraph-start)
                  "\f\\|[ \t]*$\\|^[ \t*][0-9]+\\.\\|^[ \t]*: ")
             ;;   "\f\\|[ \t]*$\\|^[ \t*][0-9]+\\.\\|^[ \t]*: |^[ \t]*[*+-] \\")
          ))

(provide 'mrflip-modes)
