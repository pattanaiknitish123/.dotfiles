(require 'server)
(unless (server-running-p)
  (server-start))
;;cl deprecation warming solution
(require 'cl-lib)
;; It works ..
(set-frame-parameter nil 'undecorated t)
(add-to-list 'default-frame-alist '(undecorated . t))

;(set-frame-parameter nil 'background-color "black")
;(set-frame-parameter nil 'foreground-color "white")
(setq default-frame-alist
      '((width . 150)
        (height . 40)))


;; Enable package archives
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
;;Pakcage upgrade through one keybinding
(defun update-all-packages ()
  "Update all packages in Emacs."
  (interactive)
  (package-refresh-contents)
  (package-list-packages)
  (package-menu-mark-upgrades)
  (package-menu-execute))


; Default way of package installation -- use-package is the package here..
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;Set UTF-8 everywhere
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)


;;EDITING TWEAKS
;show-trailing-whitespace t or nil(default)
;Delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;indent-tabs-mode t (default) make it to nil (fot python) .. use spaces instead of tab
(setq-default indent-tabs-mode nil)
;tab-width  8(default) set it to 4 (my preference)
(setq-default tab-width 4)
;c-basic-offset 2(default)  set it to 4 (my preference)
(setq c-basic-offset 4)
;electric-indent-mode nil (by default) which is I wanted.. nothing to do

;;default completion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;;(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;;Necessary Appearance Changes
(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(scroll-bar-mode -1)
(global-subword-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
;;(setq display-line-numbers-type 'relative)


; THEME CONFIG [Installation and Customization]
;(load-theme 'tango-dark t) ; Tango Dark theme
(unless (package-installed-p 'modus-themes)
  (package-refresh-contents)
  (package-install 'modus-themes))
(setq modus-themes-common-palette-overrides
      '((border-mode-line-active unspecified)
        (border-mode-line-inactive unspecified)
        (comment green-warmer)
        (fnname yellow-warmer)
        (type blue)
        (constant red)))
(setq modus-themes-bold-constructs t
      modus-themes-italic-constructs nil
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-headings
      '((1 . (rainbow overline background 1.3))
        (2 . (rainbow background 1.2))
        (3 . (rainbow bold 1.1))
        (t . (semilight 1.0))))
(setq modus-themes-org-blocks 'gray-background)
(load-theme 'modus-vivendi t) ;; for the dark version

;This includes onl interger, floats and xXcharacters
;(add-hook 'prog-mode-hook
;  (lambda ()
;    (font-lock-add-keywords nil
;      '(("\\b\\(?:[0-9]+\\(?:\\.[0-9]*\\)?\\|0[xX][0-9A-Fa-f]+\\)\\b"
;         . font-lock-constant-face)))))

;this is more of them...
(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
              '(("\\b\\(?:[0-9]+\\(?:\\.[0-9]*\\(?:[eE][-+]?[0-9]+\\)?\\)?\\|0[bB][01]+\\|0[oO]?[0-7]+\\|0[xX][0-9A-Fa-f]+\\|\\(?:[0-9]+[eE][-+]?[0-9]+\\)\\|\\(?:[0-9]+_[0-9a-fA-F]+\\)\\)\\b"
                 . font-lock-constant-face)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-binary-literal-face ((t (:foreground "#880000"))))
 '(font-lock-constant-face ((t (:foreground "#FF0000"))))
 '(font-lock-float-literal-face ((t (:foreground "#880000"))))
 '(font-lock-hexadecimal-literal-face ((t (:foreground "#880000"))))
 '(font-lock-numeric-literal-face ((t (:foreground "#880000"))))
 '(font-lock-octal-literal-face ((t (:foreground "#880000"))))
 '(line-number ((t (:background "#00000"))))
 '(line-number-current-line ((t (:foreground "#FFFFFF" :background "#000000")))))


;;EMACS FONT CONFIG
(add-to-list 'default-frame-alist
	       '(font . "Iosevka Fixed Medium-12"))
;Set the default font to Iosevka with size 12
(set-face-attribute 'default nil :font "Iosevka Fixed Medium-12")
;Set the font for variable-pitch mode (used in some modes like Org mode)
(set-face-attribute 'variable-pitch nil :font "Iosevka Aile-15")
;Set the font for fixed-pitch mode (used in programming modes like Python mode)
(set-face-attribute 'fixed-pitch nil :font "Iosevka Fixed Medium Extended-12")
;Set the font for the mode-line (status bar)
(set-face-attribute 'mode-line nil :font "Iosevka Term-12")
;Set the font for the minibuffer prompt
(set-face-attribute 'minibuffer-prompt nil :font "Iosevka Term Medium-12")
;Set the font for the header line (used in some modes like Dired mode)
(set-face-attribute 'header-line nil :font "Iosevka Aile Medium-12")
;set different font face for BOLD fonts
;(set-face-font 'bold (font-spec :family "Iosevka Term Extended" :weight 'bold))
(set-face-attribute 'bold nil  :family "Iosevka" :weight 'semibold)
(set-face-attribute 'italic nil :family "Iosevka Fixed")


;;PACKAGES INSTALL [through use-package]
;;;vim keybindigs
(use-package evil
  :ensure t)
;;;company completion framework
(use-package company
    :ensure t)
; smex : ido based completion for M-x
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))
;which key best for knowing available commands
(use-package which-key
             :ensure t
             :init
             (which-key-mode))


;;WoMan (without man) setup
;(setq woman-manpath '("C:/Users/Patta/OpenBSD_ManPages/man-pages/"))
(setq woman-manpath '("//wsl.localhost/Ubuntu/usr/share/man"))

;;PWSH as default shell in emacs
(setq explicit-shell-file-name "pwsh.exe")
(setq shell-file-name "pwsh.exe")
(setq explicit-pwsh.exe-args '("-ExecutionPolicy" "Unrestricted"))


;;Key Bindings
(global-set-key (kbd "C-c u") 'update-all-packages)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c w") 'woman)
(global-set-key (kbd "<f12>") 'evil-mode)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)




;;AUTO ADD-ONS by GNU EMACS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(modus-themes use-package)))
