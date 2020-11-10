;;; init.el -*- lexical-binding: t; -*-
(doom! :input
       :completion
       company                        ; the ultimate code completion backend
       ivy                            ; a search engine for love and life
       helm

       :ui
       doom                           ; what makes DOOM look the way it does
       doom-dashboard                 ; a nifty splash screen for Emacs
       doom-quit                      ; DOOM quit-message prompts when you quit Emacs
       hl-todo                        ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       (ligatures +hasklig)           ; ligatures and symbols to make your code pretty again
       modeline                       ; snazzy, Atom-inspired modeline, plus API
       neotree
       ophints                        ; highlight the region an operation acts on
       (popup +defaults)              ; tame sudden yet inevitable temporary windows
       vc-gutter                      ; vcs diff in the fringe
       vi-tilde-fringe                ; fringe tildes to mark beyond EOB
       (window-select +switch-window) ; visually switch windows
       workspaces                     ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)             ; come to the dark side, we have cookies
       file-templates                 ; auto-snippets for empty files
       fold                           ; (nigh) universal code folding
       snippets                       ; my elves. They type so I don't have to

       :emacs
       dired                          ; making dired pretty [functional]
       electric                       ; smarter, keyword-based electric-indent
       undo                           ; persistent, smarter undo for your inevitable mistakes
       vc                             ; version-control and Emacs, sitting in a tree

       :checkers
       syntax                         ; tasing you for every semicolon you forget

       :tools
       direnv
       editorconfig                   ; let someone else argue about tabs vs spaces
       (eval +overlay)                ; run code, run (also, repls)
       lookup                         ; navigate your code and its documentation
       lsp
       (magit +forge)                 ; a git porcelain for Emacs

       :os
       (:if IS-MAC macos)             ; improve compatibility with macOS

       :lang
       elixir                         ; erlang done right
       emacs-lisp                     ; drown in parentheses
       erlang                         ; an elegant language for a more civilized age
       json                           ; At least it ain't XML
       markdown                       ; writing docs for people to ignore
       org                            ; organize your plain life in plain text
       sh                             ; she sells {ba,z,fi}sh shells on the C xor

       :config
       (default +bindings +smartparens))
