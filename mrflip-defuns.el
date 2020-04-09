(defun fixnewlines  ()             "Turn ^M into ^J."  (interactive) (replace-string "\C-M" "\C-j"))
(defun set-tab-width-2 ()          "Sets tab width to 2" (interactive) (setq tab-width 2) (font-lock-and-redraw))
(defun set-tab-width-4 ()          "Sets tab width to 4" (interactive) (setq tab-width 4) (font-lock-and-redraw))
(defun set-tab-width-8 ()          "Sets tab width to 8" (interactive) (setq tab-width 8) (font-lock-and-redraw))
(defun Buffer-menu-sort-by-path () "Sort buffer menu by pathname"  (interactive) (Buffer-menu-sort 5))

(defun font-lock-and-redraw ()     "Force a font-lock-fontify-buffer and then do the redraw" (interactive) (font-lock-fontify-buffer) (recenter) )


;;; Bug: kills line and newline. o wells
(defun delete-line () "deletes the line forward"
  (interactive "")
  (save-excursion
    (delete-region (point) (progn (forward-visible-line 1) (point))) ))
(defun delete-next-word () "deletes (without copying) the next word"
  (interactive "")
  (save-excursion
    (delete-region (point) (progn (forward-word) (point))) ))

(defun wu-lign-region (start end arg)
  (interactive (list (region-beginning) (region-end) current-prefix-arg))
  (shell-command-on-region start end "~/bin/wu-lign" t t))

(defun indent-buffer ()
  "Indent the current buffer."
  (interactive)
  (indent-region (point-min) (point-max) nil)
  )
(defun indent-line-or-region-rigidly (b e n) "indent-rigidly by arg tab-widths"
  (interactive "r\np")
  (save-excursion
    (let (deactivate-mark)
      (if (or (= b e) (not mark-active))
          (progn
            (end-of-line)
            (let ((eol (point)))
              (beginning-of-line)
              (indent-rigidly (point) eol (* tab-width n))))
        (indent-rigidly b e (* tab-width n))))))
(defun unindent-line-or-region-rigidly (b e n) "(un)indent-rigidly by -arg tab-widths"
  (interactive "r\np")
  (indent-line-or-region-rigidly b e (* -1 n)))

(defun indent-rigidly-2 (b e n) "indent-rigidly by arg tab-widths"
  (interactive "r\np")
  (save-excursion
    (let (deactivate-mark)
      (if (or (= b e) (not mark-active))
          (progn
            (end-of-line)
            (let ((eol (point)))
              (beginning-of-line)
              (indent-rigidly (point) eol (* 2 (or n 1)))))
        (indent-rigidly b e (* 2 (or n 1)))))))
(defun unindent-rigidly-2 (b e n) "(un)indent-rigidly by -arg tab-widths"
  (interactive "r\np")
  (indent-rigidly-2 b e (* -1 n)))

;; auto-save fixes now in mrflip-dot-files

(provide 'mrflip-defuns)
