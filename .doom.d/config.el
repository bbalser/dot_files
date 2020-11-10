;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq display-line-numbers-type t
      doom-font "Hasklig-14"
      doom-theme 'doom-one
      org-directory "~/Documents/org/"
      user-full-name "Brian Balser"
      user-mail-address "brian.balser@gmail.com")

;; package config
(use-package! exunit
  :hook (elixir-mode . exunit-mode))

(use-package! forge
  :config (setq forge-topic-list-limit '(10 . 0)))

(use-package! lsp-mode
  :hook (elixir-mode . lsp)
  :init (setq lsp-elixir-dialyzer-enabled nil
              lsp-elixir-project-dir ""))

(use-package! mix
  :hook (elixir-mode . mix-minor-mode)
  :config (setq compilation-scroll-output t))

;; (use-package! popwin
;;   :hook (elixir-mode . popwin-mode)
;;   :config
;;   (let ((buffer-pattern "\\*Flycheck*\\|\\*exunit-*\\|\\*mix ex*"))
;;     (push `(,buffer-pattern
;;             :regexp t
;;             :dedicated t
;;             :stick t
;;             :noselect t
;;             :position right
;;             :width 0.30)
;;           popwin:special-display-config)
;;     (push '("magit\\:*"
;;             :regexp t
;;             :position right
;;             :width 0.30)
;;           popwin:special-display-config)))

;; package hooks
(after! lsp-clients
  (let ((ignore-list (append lsp-file-watch-ignored
                             '("deps/" "_build/" ".elixir_ls/" "assets/" "docs/"))))
    (setq lsp-file-watch-ignored ignore-list)))

(after! lsp-ui
  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-delay 1.5
        lsp-ui-doc-max-height 20
        lsp-ui-doc-max-width 80
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-use-webkit nil
        lsp-ui-sideline-ignore-duplicate t))

;; functions
(defun exunit-kill-compilation ()
  "Kill *exunit-compilation* buffer and window."
  (interactive)
  (let* ((bname "*exunit-compilation*")
         (window (get-buffer-window bname)))
    (delete-window window)
    (kill-buffer bname)))

(defun mix/execute-task-umbrella ()
  "Run mix command in umbrella project."
  (interactive)
  (let ((mix-start-in-umbrella t))
    (mix-execute-task)))

(defun mix/format-buffer ()
  "Format current buffer. Save before running formatter command."
  (interactive)
  (let ((file-to-format (file-relative-name (buffer-file-name) (exunit-project-root)))
        (default-directory (exunit-project-root)))
    (save-buffer)
    (shell-command (s-join " " `("mix" "format" ,file-to-format)))
    ;; reload file after possible changes
    (revert-buffer :ignore-auto :noconfirm :preserve)))

(defun projectile-yank-line-number ()
  "Copy current line in file to clipboard, relative to project root."
  (interactive)
  (let* ((line-no (number-to-string (line-number-at-pos)))
         (path-from-root (file-relative-name (buffer-file-name) (projectile-project-root)))
         (from-root-with-line (concat path-from-root ":" line-no)))
    (kill-new from-root-with-line)
    (message from-root-with-line)))

(defun display-elixir-output (buffer ignore)
  "Display elixir compiler output BUFFER IGNORE."
  (let* ((frame (select-frame-by-name "TEST OUTPUT"))
        (window (car (window-list frame))))
    (select-window window)
    (display-buffer-same-window buffer nil)
    (display-buffer-record-window 'reuse window buffer)
    (select-frame-set-input-focus (old-selected-frame))
    window)
  )

;; keybindings
(map! :prefix "g"
      :ne "p" #'lsp-ui-peek-find-definitions
      :ne "P" #'lsp-ui-peek-find-references)

(map! :leader
      :prefix "p"
      :ne "y" #'projectile-yank-line-number
      :prefix "w"
      :ne "C-d" #'ace-delete-window
      :ne "C-p" #'popwin:close-popup-window)

(map! :leader
      :prefix ("w")
      :desc "Delete Other Window" :ne "D" #'ace-delete-window
      :desc "Switch Window" :ne "<tab>" #'ace-window)

(map! :mode elixir-mode
      :localleader
      :ne "=" #'mix/format-buffer
      :ne "m" #'mix-execute-task
      :ne "u" #'mix/execute-task-umbrella
      :prefix ("t" . "Testing")
      :ne "<backtab>" #'exunit-toggle-file-and-test-other-window
      :ne "<tab>" #'exunit-toggle-file-and-test
      :ne "a" #'exunit-verify-all
      :ne "b" #'exunit-verify
      :ne "q" #'exunit-kill-compilation
      :ne "r" #'exunit-rerun
      :ne "t" #'exunit-verify-single
      :ne "u" #'exunit-verify-all-in-umbrella)

(push '("\\*exunit-compilation\\*" display-elixir-output) display-buffer-alist)
