(server-start)



;; CEDET Related

;; (load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(if (file-directory-p "c:/cygwin/bin")
      (add-to-list 'exec-path "c:/cygwin/bin"))

(add-to-list 'load-path "C:/Users/sturgman/.emacs.d")
(add-to-list 'load-path "~/.emacs.d")

(require 'cygwin-mount)
(require 'setup-cygwin)
(cygwin-mount-activate)

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(require 'ipython)

;; Mouse behavior
(setq select-active-regions nil)
(setq mouse-drag-copy-region t)
(global-set-key [mouse-2] 'mouse-yank-at-click)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(explicit-shell-file-name "C:/cygwin/bin/zsh.exe")
 '(hs-lint-command "c:/cygwin/bin/hlint")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(py-shell-input-prompt-1-regexp "^In \\[[0-9]+\\]: *")
 '(py-shell-input-prompt-2-regexp "^   [.][.][.]+: *")
 '(py-shell-name "ipython")
 '(py-shell-toggle-1 "python")
 '(shell-file-name "C:/cygwin/bin/bash.exe")
 '(temporary-file-directory "~/.emacs.d/autosave_backup"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(load "~/.emacs.d/lammps")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Haskell related stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/haskell-mode/haskell-site-file.el")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")

(add-hook 'haskell-mode-hook
	  '(lambda () (auto-complete-mode 1)
	     (make-local-variable 'ac-sources)
	     (setq ac-sources '(ac-source-yasnippet
				ac-source-abbrev
				ac-source-words-in-buffer
				my/ac-source-haskell))
	     nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autocomplete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'haskell-ac) ;; https://gist.github.com/1241063
(add-to-list 'exec-path "C:/Program Files/Aspell/bin/")
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.ispell")
(require 'ispell)
