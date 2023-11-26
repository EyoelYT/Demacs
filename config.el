;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; wasn't installed correctly. Font issues are rarely Doom issues!
;; refresh your font settings. If Emacs still can't find your font, it likely

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-ayu-dark)
(setq doom-font (font-spec :family "Iosevka NFM" :size 18 :weight 'light))
(setq-default fringe-mode nil)
;; Set the default frame size
(setq default-frame-alist
      '((width . 180)   ; Width set to 180 columns
        (height . 40))) ; Height set to 30 lines
;; Automatic Flycheck is annoying
(after! flycheck
  (after! lsp-mode
    (setq global-flycheck-mode nil)))

(setq global-vi-tilde-fringe-mode nil)

(custom-set-faces!
  '(default :foreground "#FBF1C7") ;; #FBF1C7 #EBDBB2
  '(font-lock-string-face) ;; Strings
  '(font-lock-variable-name-face :foreground "#83A598") ;; Variable names #FCFCFF #83A598
  '(font-lock-keyword-face) ;; Language Keywords
  '(font-lock-comment-face :foreground "#555555") ;; Comments
  '(font-lock-type-face :foreground "#AF3A03") ;; Data-types
  '(font-lock-constant-face) ;; Constants
  '(font-lock-function-name-face) ;; Function and Methods
  '(region) ;; Text selection (highlighted text)
  '(line-number ) ;; Line Number
  '(line-number-current-line) ;; Current line number
  '(mode-line) ;; Active mode line
  '(mode-line-inactive)) ;; Inactive mode line


        ;;doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 14)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/AllMyFiles/org")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(desktop-save-mode 1) ;: Enable desktop
;; (setq desktop-restore-eager 10) ; Number of buffers to restore immediately
;; (setq desktop-save 'if-exists) ; Save desktop without asking if it already exists

;; Set whitespace-mode to none
(setq-default whitespace-style nil)

;; Set default lsp-mode to nil
;; (setq lsp-auto-configure nil) ;; Stops the lsp from automatically configuring itself
;; (setq lsp-enable-on-startup nil)

;; When entering lsp-mode, flycheck is off
(use-package! lsp-mode
  :hook
  (lsp-mode . (lambda ()
                (unless lsp-auto-configure
                  (flycheck-mode -1)))))
(setq lsp-enable-on-startup nil)
