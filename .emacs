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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CUSTOM VARIABLES
(custom-set-variables '(pc-selection-mode t nil (pc-select)))
(custom-set-variables '(mouse-wheel-mode t nil (mwheel)))

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
  "My PHP mode configuration."
  (setq indent-tabs-mode nil
        tab-width 4
        c-basic-offset 4))