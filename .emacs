(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'monokai t)
(set-default-font "Consolas 11")

(setq inhibit-startup-message t)
(desktop-save-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Autocomplete
(ac-config-default)

(require 'neotree)
(add-hook 'neo-after-create-hook
          (lambda (&rest _) (display-line-numbers-mode -1)))
(setq neo-theme 'ascii)
(setq neo-smart-open t)
(neotree-show)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Projectile
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Automatically change buffers when files have changed on disk
(global-auto-revert-mode t)

;; Elpy
(elpy-enable)

;; Javascript
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Web-mode
(setq web-mode-markup-indent-offset 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1d1d4459c16a7120dd81cc1881e10fece40d218396228e5e3ca3b1d9806518c3" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(package-selected-packages
   (quote
    (projectile auto-complete web-mode rjsx-mode elpy magit multiple-cursors neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
