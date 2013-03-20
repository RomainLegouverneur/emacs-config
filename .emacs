;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LOAD PATH
(add-to-list 'load-path "~/elisp/")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; REQUIRES & LOADS
(require 'cl)
(require 'pp)
(require 'url-util)
(require 'etags)
(require 'thingatpt)
(require 'anything)
(require 'paren)
(require 'auto-complete-config)
(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)
(require 'magit)
(require 'jira)
(require 'vline)
(require 'col-highlight)
(require 'column-marker)
(load "nlinum-1.1.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GENERAL CONFIGURATION
(show-paren-mode t)
(column-number-mode t)
(line-number-mode t)

(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

(setq visible-bell t)

(global-linum-mode t)

(add-to-list 'ac-dictionary-directories "~/elisp//ac-dict")
(ac-config-default)

(setq browse-url-mozilla t)

(setq tramp-default-method "ssh")

(toggle-highlight-column-when-idle t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; UNICODE & LINE ENDINGS
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COPOUND_TEXT TEXT STRING))
(prefer-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CUSTOM VARIABLES
(custom-set-variables '(pc-selection-mode t nil (pc-select)))
(custom-set-variables '(mouse-wheel-mode t nil (mwheel)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; JIRA CONFIG
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(jira-url "http://jiraurl/rpc/xmlrpc")
 '(mouse-wheel-mode t nil (mwheel))
 '(pc-selection-mode t nil (pc-select)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; YOUR CODING STANDARDS
(setq-default indent-tabs-mode nil)
(c-add-style
 "myconf"
 (quote
  (
   (c-basic-offset . 4)
   (c-backslash-column . 48)
   (c-cleanup-list scope-operator)
   (c-comment-only-line-offset . 0)
   (c-electric-pound-behavior)
   (c-hanging-braces-alist
    (brace-list-open)
    (brace-entry-open)
    (substatement-open after)
    (block-close . c-snug-do-while)
    (extern-lang-open after)
    (inexpr-class-open after)
    (inexpr-class-close before))
   (c-hanging-colons-alist)
   (c-hanging-comment-starter-p . t)
   (c-hanging-comment-ender-p . t)
   (c-offsets-alist
    (string . c-lineup-dont-change)
    (c . c-lineup-C-comments)
    (defun-open . 0)
    (defun-close . 0)
    (defun-block-intro . +)
    (class-open . +)
    (class-close . 0)
    (inline-open . 0)
    (inline-close . 0)
    (func-decl-cont . +)
    (knr-argdecl-intro . +)
    (knr-argdecl . 0)
    (topmost-intro . 0)
    (topmost-intro-cont . 0)
    (member-init-intro . +)
    (member-init-cont . 0)
    (inher-intro . +)
    (inher-cont . c-lineup-multi-inher)
    (block-open . 0)
    (block-close . 0)
    (brace-list-open . 0)
    (brace-list-close . 0)
    (brace-list-intro . 0)
    (brace-list-entry . +)
    (brace-entry-open . 0)
    (statement . 0)
    (statement-cont . +)
    (statement-block-intro . +)
    (statement-case-intro . 0)
    (statement-case-open . 0)
    (substatement . +)

    ;; Pas de décalage lors de l'ouverture d'un bloc
    (substatement-open . 0)
    (case-label . +)
    (access-label . -)
    (label . 4)
    (do-while-closure . 0)
    (else-clause . 0)
    (catch-clause . 0)
    (comment-intro . c-lineup-comment)
    (arglist-intro . +)
    (arglist-cont . 0)
    (arglist-cont-nonempty . 0);c-lineup-arglist)
    (arglist-close . 0)
    (stream-op . c-lineup-streamop)
    (inclass . 4)
    (cpp-macro . -1000)
    (cpp-macro-cont . c-lineup-dont-change)
    (friend . 0)
    (objc-method-intro . -1000)
    (objc-method-args-cont . c-lineup-ObjC-method-args)
    (objc-method-call-cont . c-lineup-ObjC-method-call)
    (extern-lang-open . 0)
    (extern-lang-close . 0)
    (inextern-lang . +)
    (namespace-open . +)
    (namespace-close . 0)
    (innamespace . +)
    (template-args-cont . +)
    (inlambda . c-lineup-inexpr-block)
    (lambda-intro-cont . +)
    (inexpr-statement . 0)
    (inexpr-class . +)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PHP SPECIFIC CONFIGURATION
(add-hook 'php-mode-hook 'php-mode-config)

(add-hook 'php-mode-hook
	  (lambda ()
	    (require 'php-completion)
	    (php-completion-mode t)
	    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)))

(add-hook 'php-mode-hook
	  (lambda ()
	    (when (require 'auto-complete nil t)
	      (make-variable-buffer-local 'ac-sources)
	      (add-to-list 'ac-sources 'ac-source-php-completion)
	      (auto-complete-mode t))))

(add-hook 'php-mode-hook
	  (lambda ()
	    (interactive)
	    (column-marker-1 80)))

(add-hook 'php-mode-hook
	  (lambda ()
	    (interactive)
	    (column-marker-2 120)))

(add-hook 'php-mode-hook
	  (lambda ()
	    (interactive)
	    (c-set-style "myconf")))