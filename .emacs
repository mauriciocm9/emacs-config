;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(ac-config-default)

(desktop-save-mode 1)

;;(load-theme 'spolsky t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'meghanada)
; (add-hook 'java-mode-hook
;           (lambda ()
;             ;; meghanada-mode on
;             (meghanada-mode t)
;             (setq c-basic-offset 2)
;             ;; use code format
;             (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
(require 'package)
(require 'neotree)
(require 'all-the-icons)
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-molokai t)
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
;;(doom-themes-neotree-config)  ;; all-the-icons fonts must be installed!
(setq inhibit-compacting-font-caches t)
;;(setq neo-theme 'icons)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


(set-frame-font "-outline-Consolas-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" nil t)
(setq frame-title-format "Mauricio")
;; (set-foreground-color 'region "#000000")
;; (set-background-color 'region "#FFFFFF")
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(neotree-show)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar)
(column-number-mode)
(elpy-enable)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)
(global-set-key [C-tab] 'other-window)
(global-unset-key "\C-n")
(global-set-key (kbd "C-n") 'comment-line)
(global-set-key (kbd "<M-left>") nil)
(global-set-key (kbd "<M-right>") nil)
(global-set-key (kbd "<M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<M-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<M-up>") 'shrink-window)
(global-set-key (kbd "<M-down>") 'enlarge-window)

;; Mode Line
(defun custom-modeline-modified
  ((let* ((config-alist
            '(("*" all-the-icons-faicon-family all-the-icons-faicon "chain-broken" :height 1.2 :v-adjust -0.0)
              ("-" all-the-icons-faicon-family all-the-icons-faicon "link" :height 1.2 :v-adjust -0.0)
              ("%" all-the-icons-octicon-family all-the-icons-octicon "lock" :height 1.2 :v-adjust 0.1)))
           (result (cdr (assoc (format-mode-line "%*") config-alist))))
      (propertize (apply (cadr result) (cddr result))
                  'face `(:family ,(funcall (car result))))))

(defun custom-modeline-region-info ()
  (when mark-active
    (let ((words (count-lines (region-beginning) (region-end)))
          (chars (count-words (region-end) (region-beginning))))
      (concat
       (propertize (format "   %s" (all-the-icons-octicon "pencil") words chars)
                   'face `(:family ,(all-the-icons-octicon-family))
                   'display '(raise -0.0))
       (propertize (format " (%s, %s)" words chars)
                   'face `(:height 0.9))))))

;; Call defun
(setq mode-line-format '("%e" (:eval
							   (concat
								(custom-modeline-modified)
								(custom-modeline-region-info))))))

;; End Mode Line

(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))

(require 'autopair)
(autopair-global-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;; (setq web-mode-content-types-alist
;;   '(("jsx"  . "/some/react/path/.*\\.js[x]?\\'")))
;; (setq web-mode-content-types-alist
;;       '(("jsx" . "\\.js[x]?\\'")))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil) ;;Use space instead of tab
	    (setq js-indent-level 2) ;;space width is 2 (default is 4)
	    (setq js2-strict-missing-semi-warning nil)))

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(setq js-indent-level 2)
(setq web-mode-code-indent-offset 4)

(setq python-shell-completion-native-enable nil)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq-default indent-tabs-mode t)
	    (setq-default tab-width 4)
	    (setq-default py-indent-tabs-mode t)
	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(global-set-key [C-f8] 'neotree-toggle)
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jdee-compiler (quote ("javac server")))
 '(jdee-server-dir "C:\\Users\\mauri\\emacs\\home\\myJars")
 '(package-selected-packages
   (quote
    (web-mode sublime-themes rjsx-mode pyenv-mode php-mode neotree multiple-cursors monokai-theme mmm-mode meghanada jedi-direx jdee elpy ebdb-gnorb doom-themes autopair))))
