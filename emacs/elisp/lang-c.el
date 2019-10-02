;; C-IDE based on https://github.com/tuhdo/emacs-c-ide-demo
(use-package cc-mode
  :config
  ;; Available C style:
  ;; "gnu": The default style for GNU projects
  ;; "k&r": What Kernighan and Ritchie, the authors of C used in their book
  ;; "bsd": What BSD developers use, aka "Allman style" after Eric Allman.
  ;; "whitesmith": Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
  ;; "stroustrup": What Stroustrup, the author of C++ used in his book
  ;; "ellemtel": Popular C++ coding standards as defined by "Programming in C++, Rules and Recommendations," Erik Nyquist and Mats Henricson, Ellemtel
  ;; "linux": What the Linux developers use for kernel development
  ;; "python": What Python developers use for extension modules
  ;; "java": The default style for java-mode (see below)
  ;; "user": When you want to define your own style
  (setq c-default-style "k&r") ;; set style to "linux"
  (setq gdb-many-windows t ;; use gdb-many-windows by default
	gdb-show-main t))

(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(defun my-cpp-highlight ()
  "highlight c/c++ #if 0 #endif macros"
  ;; (interactive)
  (setq cpp-known-face 'default)
  (setq cpp-unknown-face 'default)
  (setq cpp-known-writable 't)
  (setq cpp-unknown-writable 't)
  (setq cpp-edit-list '(("0" font-lock-comment-face default both)
                        ("1" default font-lock-comment-face both)))
  (cpp-highlight-buffer t))

(add-hook 'c-mode-common-hook 'my-cpp-highlight)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

(use-package semantic
  :config
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (global-semantic-stickyfunc-mode 1)
  (semantic-mode 1))

;; (use-package ggtags
;;   :config
;;   (ggtags-mode 1)
;;   (add-hook 'c-mode-common-hook
;; 	    (lambda ()
;; 	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;; 		(ggtags-mode 1))))

;;   (dolist (map (list ggtags-mode-map))
;;     (define-key map (kbd "C-c g s") 'ggtags-find-other-symbol)
;;     (define-key map (kbd "C-c g h") 'ggtags-view-tag-history)
;;     (define-key map (kbd "C-c g r") 'ggtags-find-reference)
;;     (define-key map (kbd "C-c g f") 'ggtags-find-file)
;;     (define-key map (kbd "C-c g c") 'ggtags-create-tags)
;;     (define-key map (kbd "C-c g u") 'ggtags-update-tags)
;;     (define-key map (kbd "M-.")     'ggtags-find-tag-dwim)
;;     (define-key map (kbd "M-,")     'pop-tag-mark)
;;     (define-key map (kbd "C-c <")   'ggtags-prev-mark)
;;     (define-key map (kbd "C-c >")   'ggtags-next-mark)))

;; Enable helm-gtags-mode
(use-package helm-gtags
  :config
  (helm-gtags-mode 1)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  (dolist (map (list helm-gtags-mode-map))
    (define-key map (kbd "M-g t") 'helm-gtags-find-tag)
    (define-key map (kbd "M-g p") 'helm-gtags-find-pattern)
    (define-key map (kbd "M-g r") 'helm-gtags-find-rtag)
    (define-key map (kbd "M-g s") 'helm-gtags-find-symbol)
    (define-key map (kbd "M-g <") 'helm-gtags-previous-history)
    (define-key map (kbd "M-g >") 'helm-gtags-next-history)
    (define-key map (kbd "M-g u") 'helm-gtags-resume)
    (define-key map (kbd "M-g f") 'helm-gtags-find-files)
    (define-key map (kbd "M-g q") 'helm-gtags-create-tags)
    (define-key map (kbd "M-g w") 'helm-gtags-update-tags)
    (define-key map (kbd "M-.") 'helm-gtags-dwim)
    (define-key map (kbd "M-,") 'helm-gtags-pop-stack)))

  ;; ;; Set key bindings
  ;; (eval-after-load "helm-gtags"
  ;;   '(progn
  ;;      (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  ;;      (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  ;;      (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  ;;      (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  ;;      (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  ;;      (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  ;;      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))


;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

(use-package cc-mode
  :init
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))

;; git@github.com:syohex/emacs-counsel-gtags.git
;(use-package counsel-gtags
;  :load-path "vendor/emacs-counsel-gtags/"
;  :ensure nil
;  :config
;  (add-hook 'c-mode-hook 'counsel-gtags-mode)
;  (add-hook 'c++-mode-hook counsel-gtags-mode)
;
;  (with-eval-after-load 'counsel-gtags
;    (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
;    ;(define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
;    ;(define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
;    (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-pop-stack)))

(defun alexott/cedet-hook ()
  (local-set-key (kbd "C-c C-j") 'semantic-ia-fast-jump)
  (local-set-key (kbd "C-c C-s") 'semantic-ia-show-summary))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

(provide 'lang-c)
