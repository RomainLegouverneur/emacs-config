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

(defun php-mode-config ()
  (setq indent-tabs-mode nil
        tab-width 4
        c-basic-offset 4))

