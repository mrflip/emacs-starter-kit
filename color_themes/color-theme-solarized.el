;;; Author: Ethan Schoonover, Solarized; Greg Pfeil, Emacs adaptation
;;; URL: http://ethanschoonover.com/solarized

;;; This file is not (YET) part of GNU Emacs.

;;; # Usage

;;; 1. Install the color-theme package
;;;   (http://www.emacswiki.org/cgi-bin/wiki/ColorTheme)
;;; 2. Load this file
;;; 3. M-x color-theme-solarized-[dark|light]

(eval-when-compile
  (require 'color-theme))

(defun color-theme-solarized (mode)
  "Color theme by Ethan Schoonover, created 2011-03-24.
Ported to Emacs by Greg Pfeil, http://ethanschoonover.com/solarized."
  (interactive "Slight or dark? ")

  ;; -- for some bizarre reason emacs renders colors much lighter than given.
  ;; specifying #dddddd will give you something more like #e4e4e4
  (let (
        (base0T    "#00161c") ;; 021d25 -- text
        (base03    "#002028") ;; 002b36
        (pinkish0  "#183d43") ;;        -- alert highlight
        (base0H    "#022933") ;; 003640
        (base02    "#022933") ;; 073642
        (base0C    "#254555") ;;        -- cursor
        (base01    "#455b62") ;; 586e75
        (base00    "#556870") ;; 657b83
        (base0     "#6f8284") ;; 839496
        (base1     "#7f9090") ;; 93a1a1
        (baseC     "#cac3ab") ;; d3ceb9 -- cursor
        (base2     "#eae3cb") ;; eee8d5
        (baseT     "#eae3cb") ;; fdf4dc -- text
        (baseH     "#f3f0dd") ;; f5f3e4
        (pinkish   "#fae9d4") ;; faeedc -- alert highlight
        (base3     "#fdf4dc") ;; fdf6e3
        (yellow    "#a97c00") ;; b58900
        (orange    "#c5350d") ;; cb4b16
        (red       "#da1b1e") ;; dc322f
        (magenta   "#ce1f6e") ;; d33682
        (violet    "#575db7") ;; 6c71c4
        (blue      "#0a79c8") ;; 268bd2
        (cyan      "#0f9187") ;; 2aa198
        (solgreen  "#728800") ;; 859900 ;; this one looks horrible, renaming
        (green     "#287820") ;; 859900
        (darkgreen "#115522") ;; 859900 ;; 3f7028
        )

    (when (eq 'light mode)
      (rotatef base03   base3)
      (rotatef base02   base2)
      (rotatef base01   base1)
      (rotatef base00   base0)
      (rotatef pinkish0 pinkish)
      (rotatef base0C   baseC)
      (rotatef base0T   baseT)
      (rotatef base0H   baseH)
      )
    (color-theme-install
     `(color-theme-solarized
       ((foreground-color . ,baseT)
        (background-color . ,base03)
        (background-mode  . ,mode)
        (cursor-color     . ,base0C))

       ;; basic
       (default                      ((t ( ))))
       (italic                       ((t (:italic t ))))
       (underline                    ((t (:underline t ))))
       (bold                         ((t (:bold t ))))
       (bold-italic                  ((t (:bold t :italic t ))))
       (nobreak-space                ((t (                       :background ,base02 ))))
       ;;
       (cursor                       ((t (:foreground ,base0C    :background ,base03 :inverse-video t ))))
       (escape-glyph-face            ((t (:foreground ,red ))))
       (fringe                       ((t (:foreground ,base01    :background ,base02 ))))
       (header-line                  ((t (:foreground ,base0     :background ,base2 ))))
       (menu                         ((t (:foreground ,base0     :background ,base02 ))))
       (minibuffer-prompt            ((t (:foreground ,blue ))))
       (mode-line                    ((t (:foreground ,base1     :background ,base02 :box (:line-width 1 :color ,base1  :family "Helvetica" )))))
       (mode-line-buffer-id          ((t (:foreground ,base1 ))))
       (mode-line-inactive           ((t (:foreground ,base0     :background ,base02 :box (:line-width 1 :color ,base02 )))))
       (vertical-border              ((t (:foreground ,base0 ))))
       ;; highlight-y stuff
       (highlight                    ((t (                       :background ,base0H ))))
       (isearch                      ((t (:foreground ,base01    :background ,base3  :inverse-video t ))))
       (isearch-fail                 ((t (:foreground ,red       :background ,base02 :inverse-video t ))))
       (match                        ((t (:foreground ,base0C    :background ,darkgreen :inverse-video t ))))
       (region                       ((t (                       :background ,base02 ))))
       (secondary-selection          ((t (                       :background ,base02 ))))
       (query-replace                ((t (                       :background ,base01 ))))
       (lazy-highlight               ((t (                       :background ,base0C ))))
       (trailing-whitespace          ((t (:foreground ,base02    :inverse-video t ))))
       ;; compilation
       (compilation-error            ((t (:forground  ,red       :bold t ))))
       (compilation-info             ((t (:forground  ,green     :italic t ))))
       (compilation-warning          ((t (:foreground ,violet    :bold t ))))
       (completions-annotations      ((t (:foreground ,darkgreen ))))
       (completions-first-difference ((t (:foreground ,blue ))))
       (next-error                   ((t (:foreground ,orange ))))
       (flymake-errline              ((t (:foreground ,red       :background ,pinkish0 :bold t ))))
       (flymake-warnline             ((t (:foreground ,green     :background ,pinkish0 :bold t ))))
       ;; customize
       (button                       ((t (                       :background ,base02            :box (:line-width 1 :style released-button :color ,base02 )))))
       (custom-button                ((t (:inherit button))))
       (custom-button-mouse          ((t (:inherit custom-button         :foreground ,base1 ))))
       (custom-button-pressed        ((t (:inherit custom-button-mouse   :box (:line-width 2 :style pressed-button )))))
       (custom-button-unraised       ((t (:inherit custom-button         :box (:line-width 1 :style none )))))
       (custom-button-pressed-unraised ((t (:inherit custom-button-mouse :box (:line-width 1 :style none )))))
       ;;
       (custom-comment               ((t (:foreground ,base01         :background ,base02 ))))
       (custom-changed               ((t (:foreground ,red       :italic t ))))
       (custom-invalid               ((t (:foreground ,base02    :background ,red :reverse-video t ))))
       (custom-modified              ((t (:foreground ,orange    :background ,base02 ))))
       (custom-set                   ((t (:foreground ,darkgreen :background ,base02 ))))
       (custom-saved                 ((t (:foreground ,baseT     :background ,base02 ))))
       (custom-state                 ((t (:foreground ,blue ))))
       (custom-documentation         ((t (:foreground ,base01 ))))
       (custom-face-tag              ((t (:foreground ,blue      :bold t ))))
       (custom-group-tag             ((t (:foreground ,blue      :bold t ))))
       (custom-variable-tag          ((t (:foreground ,cyan ))))
       (custom-link                  ((t (:foreground ,magenta   :italic t ))))
       ;; diff
       (diff-added                   ((t (:foreground ,green     :inverse-video t ))))
       (diff-changed                 ((t (:foreground ,yellow    :inverse-video t ))))
       (diff-removed                 ((t (:foreground ,red       :inverse-video t ))))
       ;; dropdown
       (dropdown-list-face           ((t (                       :background ,pinkish0 ))))
       (dropdown-list-selection-face ((t (:foreground ,base2     :inverse-video t ))))
       ;; emacs-wiki
       (emacs-wiki-bad-link-face     ((t (:foreground ,red       :underline t ))))
       (emacs-wiki-link-face         ((t (:foreground ,blue      :underline t ))))
       (emacs-wiki-verbatim-face     ((t (:foreground ,base00    :underline t ))))

       ;; font-lock
       (font-lock-builtin-face       ((t (:foreground ,blue ))))
       (font-lock-comment-face       ((t (:foreground ,base01    :italic t ))))
       (font-lock-constant-face      ((t (:foreground ,magenta ))))
       (font-lock-doc-face           ((t (:foreground ,cyan ))))
       (font-lock-function-name-face ((t (:foreground ,violet ))))
       (font-lock-keyword-face       ((t (:foreground ,blue ))))
       (font-lock-string-face        ((t (:foreground ,green ))))
       (font-lock-type-face          ((t (:foreground ,magenta ))))
       (font-lock-variable-name-face ((t (:foreground ,cyan ))))
       (font-lock-warning-face       ((t (:foreground ,red       :bold t ))))
       (font-lock-negation-char-face ((t (:foreground ,red ))))
       (font-lock-preprocessor-face  ((t (                       :background ,pinkish0 ))))
       ;; ido
       (ido-first-match              ((t (:foreground ,darkgreen :bold t ))))
       (ido-incomplete-regexp        ((t (:foreground ,red ))))
       (ido-indicator                ((t (:foreground ,base2     :reverse-video t ))))
       (ido-only-match               ((t (:foreground ,blue ))))
       (ido-subdir                   ((t (:foreground ,cyan ))))
       ;; info
       (info-xref                    ((t (:foreground ,blue      :underline t ))))
       (info-xref-visited            ((t (:inherit info-xref     :foreground ,magenta ))))
       (info-node                    ((t (:foreground ,darkgreen ))))
       (info-header-node             ((t (:foreground ,darkgreen :bold t ))))
       ;; org
       (org-hide                     ((t (:foreground ,base0C ))))
       (org-todo                     ((t (:foreground ,red       :bold t ))))
       (org-done                     ((t (:foreground ,green     :bold t ))))
       ;; show-paren
       (show-paren-match-face        ((t (                       :background ,pinkish0 :bold t ))))
       (show-paren-mismatch-face     ((t (                       :background ,base02   :foreground ,red ))))
       ;; misc
       (rng-error-face               ((t (:foreground ,red       :underline t ))))
       (link                         ((t (:foreground ,blue      :underline t ))))
       ;; textile
       (textile-h1-face              ((t (:weight     bold       :height 2.0   :underline t ))))
       (textile-h2-face              ((t (:weight     bold       :height 1.5 ))))
       (textile-h3-face              ((t (:slant      italic     :height 1.325 :family "Trebuchet MS" ))))
       (textile-h4-face              ((t (:weight     semi-bold  :height 1.25  :family "Trebuchet MS" ))))
       (textile-h5-face              ((t (:weight     bold       :height 1.2   :family "Trebuchet MS" :stipple nil ))))
       (textile-acronym-face         ((t (:foreground ,cyan ))))
       (textile-alignments-face      ((t (:foreground ,blue ))))
       (textile-blockquote-face      ((t (:foreground ,blue ))))
       (textile-class-face           ((t (:foreground ,base2 ))))
       (textile-code-face            ((t (:foreground ,blue ))))
       (textile-pre-face             ((t (:foreground ,blue ))))
       (textile-image-face           ((t (:foreground ,red ))))
       (textile-lang-face            ((t (:foreground ,baseT ))))
       (textile-ol-bullet-face       ((t (:foreground ,magenta ))))
       (textile-ul-bullet-face       ((t (:foreground ,magenta ))))
       (textile-span-face            ((t (:foreground ,yellow ))))
       (textile-strong-face          ((t (:weight bold ))))
       (textile-emph-face            ((t (:foreground ,darkgreen :slant italic ))))
       (textile-deleted-face         ((t (:foreground ,red ))))
       ;;
       (font-lock-comment-delimiter-face    ((t (:foreground ,darkgreen :italic t ))))
       (font-lock-regexp-grouping-backslash ((t (:foreground ,magenta :background ,base01 ))))
       (font-lock-regexp-grouping-construct ((t (                :background ,base02 ))))
       ))))

(defun color-theme-solarized-dark ()
  (interactive)
  (color-theme-solarized 'dark))

(defun color-theme-solarized-light ()
  (interactive)
  (color-theme-solarized 'light))

(provide 'color-theme-solarized)
