;; SERVER SETUP
(require 'server)
(unless (server-running-p)
  (server-start))


;; CL DEPRECATION SOLUTION
(require 'cl-lib)


;; BORDERLESS --NO-DECORATION
; It works ..(except emacs in server-client model) IMPORTANT don't delete it.
(set-frame-parameter nil 'undecorated t)
(add-to-list 'default-frame-alist '(undecorated . t))
; I just simply like it so much


;; DEFAULT FRAME SIZE
; (set-frame-parameter nil 'background-color "black")
; (set-frame-parameter nil 'foreground-color "white")
(setq default-frame-alist
      '((width . 150)
        (height . 40)))


;; SETUP PACKAGE ARCHIVES
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
; Pakcage upgrade through one command
(defun update-all-packages ()
  "Update all packages in Emacs."
  (interactive)
  (package-refresh-contents)
  (package-list-packages)
  (package-menu-mark-upgrades)
  (package-menu-execute))


;; DEFAULT PAKCKAGE INSTALLATION METHOD
; use-package installation
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; SET UTF-8 ENCODING EVERYWHERE
(set-terminal-coding-system 'utf-8)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)


;; EDITING TWEAKS
; show-trailing-whitespace t or nil(default)
; delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; indent-tabs-mode t (default) make it to nil (fot python) .. use spaces instead of tab
(setq-default indent-tabs-mode nil)
; tab-width  8(default) set it to 4 (my preference)
(setq-default tab-width 4)
; c-basic-offset 2(default)  set it to 4 (my preference)
(setq c-basic-offset 4)
; electric-pair-mode ...MUST
(electric-pair-mode 1)
; default completion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; NECESSARY APPEARANCE CHANGES
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
;(setq visible-bell 1)
;(setq display-line-numbers-type 'relative)


;; THEME CONFIG
; (load-theme 'tango-dark t)
; Tango Dark theme
(unless (package-installed-p 'modus-themes)
  (package-refresh-contents)
  (package-install 'modus-themes))
(setq modus-themes-common-palette-overrides
      '((border-mode-line-active unspecified)
        (border-mode-line-inactive unspecified)
        (fg-main "#F4F4F4")
        (bg-main "#161616")
        (bg-region "#4d5358")
        (fg-region unspecified)
        (bg-mode-line-active "#262626")
        (bg-mode-line-inactive "#272525")
        (fg-mode-line-active "#ffffff")
        (comment green-warmer)
        (fnname yellow-warmer)
        (bg-tab-bar bg-main)
        (bg-tab-current bg-active)
        (bg-tab-other bg-dim)
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
(load-theme 'modus-vivendi t) ; for the dark version
;(load-theme 'modus-operandi t)


;; HIGHLIGHT CONSTANTS AS RED
(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
              '(("\\b\\(?:[0-9]+\\(?:\\.[0-9]*\\(?:[eE][-+]?[0-9]+\\)?\\)?\\|0[bB][01]+\\|0[oO]?[0-7]+\\|0[xX][0-9A-Fa-f]+\\|\\(?:[0-9]+[eE][-+]?[0-9]+\\)\\|\\(?:[0-9]+_[0-9a-fA-F]+\\)\\)\\b"
                 . font-lock-constant-face)))))



;; FOREGROUND COLOR SETTINGS
(set-face-attribute 'error nil :foreground "#da1e28" :weight 'bold)
(set-face-attribute 'warning nil :foreground "#f1c21b" :weight 'bold)
;(set-face-attribute 'info nil :foreground "#")
(set-face-attribute 'success nil :foreground "#24a148")
(with-eval-after-load 'compile
  (custom-set-faces
   '(compilation-error ((t (:foreground "#da1e28" ))))
   '(compilation-info ((t (:foreground "#24a148" ))))
   '(compilation-mode-line-fail ((t (:foreground "#da1e28" ))))
   '(compilation-mode-line-run ((t (:foreground "#f1c21b" ))))
   '(compilation-mode-line-exit ((t (:foreground "#24a148" ))))
   '(compilation-warning ((t (:foreground "#ff832b" ))))
   ))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-binary-literal-face ((t (:foreground "#880000"))))
 '(font-lock-warning-face ((t (:foreground "#DA1E28"))))
 '(font-lock-constant-face ((t (:foreground "#FF0000"))))
 '(font-lock-float-literal-face ((t (:foreground "#880000"))))
 '(font-lock-hexadecimal-literal-face ((t (:foreground "#880000"))))
 '(font-lock-numeric-literal-face ((t (:foreground "#880000"))))
 '(font-lock-octal-literal-face ((t (:foreground "#880000"))))
 '(line-number ((t (:background "#00000"))))
 '(line-number-current-line ((t (:foreground "#FFFFFF" :background "#161616")))))


;; CUSTOMIZATION FOR SOME KEYWORDS
(defface font-lock-todo-face
  '((t (:foreground "#da1e28")))
  "Face for TODO keywords.")
(defface font-lock-fixme-face
  '((t (:foreground "#9f1853")))
  "Face for FIXME keywords.")
(defface font-lock-note-face
  '((t (:foreground "#0f62fe")))
  "Face for NOTE keywords.")
(defface font-lock-hack-face
  '((t (:foreground "yellow")))
  "Face for HACK keywords.")
(defvar font-lock-todo-keywords
  '(("\\<\\(TODO\\)\\>" 0 'font-lock-todo-face t)
    ("\\<\\(FIXME\\)\\>" 0 'font-lock-fixme-face t)
    ("\\<\\(NOTE\\)\\>" 0 'font-lock-note-face t)
    ("\\<\\(HACK\\)\\>" 0 'font-lock-hack-face t))
  "Font-lock keywords for highlighting TODO, FIXME, NOTE, and HACK.")
(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil font-lock-todo-keywords)))
(add-hook 'text-mode-hook
          (lambda ()
            (font-lock-add-keywords nil font-lock-todo-keywords)))


;;EMACS FONT CONFIG
; List all fonts by using this.. evaluate through C-x C-e
;(dolist (font (x-list-fonts "*"))
;  (insert (format "%s\n" font)))
;(add-to-list 'default-frame-alist
;	       '(font . "Iosevka Fixed Medium-12"))
(add-to-list 'default-frame-alist
	         '(font . "-outline-Iosevka Fixed Medium-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1") ;I use medium weight, because of my low resolution monitor
             '(height . 120))
; Set the default font to Iosevka with size 12, 120 or 1.1 or 1.0 or 1.2 nothing else
(set-face-attribute 'default nil :font "-outline-Iosevka Fixed Medium-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" :height '120)
; below font uses XLFD format to specify(supported in MS-windows, see: https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html)
; XLFD format-> "-maker-family-weight-slant-widthtype-style-pixels-height-horiz-vert-spacing-width-registry-encoding"
; (set-face-attribute 'variable-pitch nil :font "-outline-CMU Sans Serif-normal-normal-normal-*-*-*-*-*-p-*-iso10646-1" :height '1.1)
(set-face-attribute 'variable-pitch nil :font "-outline-IBM Plex Sans Cond Text-normal-normal-normal-sans-*-*-*-*-p-*-iso10646-1" :height '1.1) ;This font really looks good in eww while viewing webpages
(set-face-attribute 'fixed-pitch nil :font "-outline-Iosevka Fixed Medium-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" :height '120)
(set-face-attribute 'fixed-pitch-serif nil :font "-outline-Courier New-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" :height '120) ;Courier new default for fixed-pitch and serif --the-only-one
(set-face-attribute 'mode-line nil :font "-outline-Iosevka Term Medium-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" :height '1.0)
(set-face-attribute 'minibuffer-prompt nil :font "-outline-Iosevka Fixed Medium-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" :height '120)
(set-face-attribute 'header-line nil :font "-outline-Iosevka Fixed Medium-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1" :height '1.0)
(set-face-attribute 'bold nil  :family "Iosevka Fixed" :weight 'semibold)  ;I set bold to semibold, because bold looks obnoxious in my monitor
(set-face-attribute 'italic nil :font "-outline-Iosevka Fixed Medium-normal-italic-normal-mono-*-*-*-*-c-*-iso10646-1")


;; PACKAGES INSTALL
; [through use-package]
(use-package evil
  :ensure t)
;company completion framework
(use-package company
    :ensure t)
;smex : ido based completion for M-x
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))
;which key
(use-package which-key
             :ensure t
             :init
             (which-key-mode))
; (use-package vterm :ensure t)
; (setq vterm-shell "wsl.exe")
; (setq shell-file-name "wsl.exe")
; (setq vterm-kill-buffer-on-exit t)
; (add-to-list 'exec-path "//wsl.localhost/Ubuntu/usr/bin")
; (add-to-list 'exec-path "C:/Program Files/WindowsApps/MicrosoftCorporationII.WindowsSubsystemForLinux_1.2.5.0_x64__8wekyb3d8bbwe")


;; WOMAN PATH SETUP
;(setq woman-manpath '("C:/Users/Patta/OpenBSD_ManPages/man-pages/"))
(setq woman-manpath '("//wsl.localhost/Ubuntu/usr/share/man"))


;; PWSH AS DEFAULT SHELL IN EMACS
(setq explicit-shell-file-name "pwsh.exe")
(setq shell-file-name "pwsh.exe")
(setq explicit-pwsh.exe-args '("-ExecutionPolicy" "Unrestricted"))


;; CUSTOM KEY BINDINGS
(global-set-key (kbd "C-c u") 'update-all-packages)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c w") 'woman)
(global-set-key (kbd "<f12>") 'evil-mode)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



;; AUTO ADD-ONS BY GNU EMACS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("eb7cd622a0916358a6ef6305e661c6abfad4decb4a7c12e73d6df871b8a195f8" "11873c4fbf465b956889adfa9182495db3bf214d9a70c0f858f07f6cc91cbd47" default))
 '(package-selected-packages '(modus-themes use-package)))

