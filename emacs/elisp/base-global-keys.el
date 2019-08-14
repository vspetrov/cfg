;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

(global-set-key [(meta h)] 'backward-kill-word)
(global-set-key [f5] 'compile)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the
     current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end
            (line-end-position)))
    (comment-or-uncomment-region beg end))
  (next-line))

(global-set-key [f6] 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "M-i") 'back-to-indentation)
(global-set-key (kbd "C-c [") 'set-rectangular-region-anchor)

(provide 'base-global-keys)
