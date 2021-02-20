
(setq ring-bell-function 'ignore)

(set-frame-font "Mononoki-13")

(set-face-attribute 'default nil :font "Mononoki-13")


(menu-bar-mode 0)

(tool-bar-mode 0)

(scroll-bar-mode 0)

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(setq startup/gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(defun startup/reset-gc () (setq gc-cons-threshold startup/gc-cons-threshold))
(add-hook 'emacs-startup-hook 'startup/reset-gc)

(custom-set-variables
    '(tab-width 4))

(add-hook 'text-mode-hook #'auto-fill-mode)

(setq-default fill-column 80)

(add-hook 'prog-mode-hook #'auto-fill-mode)

(use-package linum
  :ensure t)

(setq make-backup-files nil)

(add-hook 'prog-mode-hook 'linum-mode)

(electric-pair-mode)

(show-paren-mode 1)

(use-package evil
  :ensure t)

(evil-mode 1)

(use-package doom-themes
  :ensure t)

(use-package tron-legacy-theme
  :ensure t)

(use-package alect-themes
  :ensure t)

(use-package minsk-theme
  :ensure t)

(use-package nimbus-theme
  :ensure t)

(load-theme 'doom-old-hope t)

(use-package doom-modeline
  :ensure t)

(doom-modeline-mode)

(use-package all-the-icons
  :ensure t)

(use-package linum-relative
  :ensure t)

(linum-on)

(linum-relative-mode)

(ido-mode 1)

(use-package yaml-mode
  :ensure t)

(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

;; Langs here

(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-rust
  :ensure t)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(use-package yasnippet
  :ensure t)

(use-package  yasnippet-snippets
  :ensure t)

(yas-global-mode 1)


(use-package lsp-mode
    :hook(
	(rust-mode . lsp))
  :ensure t)


;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

;; optionally if you want to use debugger
(use-package dap-mode
  :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-TAB" . centaur-tabs-forward))

(setq centaur-tabs-style "slant")

(setq centaur-tabs-set-icons t)

;;(setq centaur-tabs-set-bar 'over)

(setq centaur-tabs-set-bar 'under)
;; Note: If you're not using Spacmeacs, in order for the underline to display
;; correctly you must add the following line:
(setq x-underline-at-descent-line t)

(define-key evil-normal-state-map (kbd "g t") 'centaur-tabs-forward)
(define-key evil-normal-state-map (kbd "g T") 'centaur-tabs-backward)

(setq centaur-tabs-cycle-scope 'tabs)


;; Rust support

(use-package rust-mode
  :ensure t)

;;(add-hook 'rust-mode-hook
;;          (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)

(use-package  go-mode
  :ensure t)

(autoload 'go-mode "go-mode" nil t)

(add-hook 'go-mode-hook 'lsp-deferred)

(use-package flymake-go
  :ensure t)

;; C support

(use-package irony
  :ensure t)

(use-package company-irony
  :ensure t)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(use-package flycheck-irony
  :ensure t)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(tron-legacy-theme tron-legacy flymake-go gomode go-mode centaur-tabs evil evil-mode doom doom-mode flycheck-irony company-irony irony yaml-mode flycheck-rust rust-mode yasnippet-snippets yasnippet flycheck company comapny dap-mode which-key lsp-ui lsp-mode use-package nimbus-theme minsk-theme linum-relative doom-themes doom-modeline alect-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
