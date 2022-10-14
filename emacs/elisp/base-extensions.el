(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq-default ediff-highlight-all-diffs 'nil)
  (setq ediff-diff-options "-w"))

(use-package exec-path-from-shell
  :config
  ;; Add GOPATH to shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "GOPATH")
    (exec-path-from-shell-copy-env "PYTHONPATH")
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :bind
  ("C-=" . er/expand-region))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f"  . counsel-describe-function)
  ("<f1> v"  . counsel-describe-variable)
  ("C-x f"   . counsel-git)      ; search for files in git repo
  ("C-x p"   . counsel-git-grep) ; search for regexp in git repo
  ("C-x c k" . counsel-yank-pop))

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package posframe)

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))

(use-package magit
  :config

  (setq magit-completing-read-function 'ivy-completing-read)

  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package magit-popup)

(use-package multiple-cursors
  :bind
  ("C-c ]" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C->" . mc/mark-all-like-this))

(use-package org
  :config
  (setq org-directory "~/org-files"
        org-default-notes-file (concat org-directory "/todo.org"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda))

(use-package org-projectile
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile-todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(use-package page-break-lines)

(use-package projectile
  :config
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" temp-dir))

  (setq projectile-completion-system 'ivy)

  (projectile-global-mode))

(use-package recentf
  :config
  (setq recentf-save-file (recentf-expand-file-name "~/.emacs.d/private/cache/recentf"))
  (recentf-mode 1))

(use-package smartparens)
(use-package
  rainbow-delimiters
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (setq rainbow-delimiters-max-face-count 9))
(setq search-highlight        t)
(setq query-replace-highlight t)
(setq column-number-mode 1)

;; Electric pair mode
(electric-pair-mode 1)

;; Иконки в статус-баре
(use-package
  mode-icons
  :config (mode-icons-mode 1))

;; Показывать отступы во всех режимах
(use-package
  indent-guide
  :config (indent-guide-global-mode 1))

;; (use-package smex)

;; (use-package undo-tree
;;   :config
;;   ;; Remember undo history
;;   (setq
;;    undo-tree-auto-save-history nil
;;    undo-tree-history-directory-alist `(("." . ,(concat temp-dir "/undo/"))))
;;   (global-undo-tree-mode 1))

;; (use-package which-key
;;   :config
;;   (which-key-mode))

;; (use-package windmove
;;   :bind
;;   ("C-x <up>" . windmove-up)
;;   ("C-x <down>" . windmove-down)
;;   ("C-x <left>" . windmove-left)
;;   ("C-x <right>" . windmove-right))

;; (use-package wgrep)

(use-package yasnippet
  :custom (yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config (yas-global-mode 1))

(use-package highlight-symbol
  :bind
  ("C-x M-h" . highlight-symbol-at-point)
  ("C-x M-r" . highlight-symbol-remove-all)
  ([f3] . highlight-symbol-next)
  ([f4] . highlight-symbol-prev))

(use-package ws-butler
  :config
  (ws-butler-global-mode 1))

(use-package imenu-list
  :bind
  ([f10] . imenu-list-smart-toggle)
 :custom
  (imenu-list-focus-after-activation t)
  (imenu-list-auto-resize t))

(use-package git-timemachine)
(provide 'base-extensions)
