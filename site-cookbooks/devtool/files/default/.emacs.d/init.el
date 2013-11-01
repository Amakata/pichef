; 行数表示                                                                                                                                                                                 
(setq line-number-mode t)

;; ビープ音を消す                                                                                                                                                                           (setq visible-bell t)

;; タブキー                                                                                                                                                                                
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;; スタートアップページを表示しない  
(setq inhibit-startup-message t)

;; 対応する括弧を光らせる。                                                                                                                                                                (show-paren-mode 1)

;; ruby-mode                                                                                                                                                                               
(add-to-list 'load-path "~/.emacs.d/elisp")
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
            (inf-ruby-keys)))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-indent-level 1)
(setq ruby-indent-tabs-mode nil)
(setq ruby-insert-encoding-magic-comment nil)

;; js2-mode                                                                                                                                                                                (autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; バックアップファイルを作らない                                                                                                                                                          (setq make-backup-files nil)
(setq auto-save-default nil)
