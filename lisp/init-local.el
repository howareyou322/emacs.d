;; reveal.js
(require 'ox-reveal)
(setq org-reveal-root "file:///Users/peter/code/reveal.js")
;; this line activates dot
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)(dot . t)))

;; setup plantuml jar path
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/lisp/plantuml.jar"))

;; Enable org-mode
(require 'org)
(require 'pbcopy)

;; enable flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(require 'flyspell-lazy)
(flyspell-lazy-mode 1)

;; hotkey setting
(global-set-key (kbd "<f8>") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/code/org/peter.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t))))

;; enable ggtags for c/c++/javascript
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'javascript-mode)
              (ggtags-mode 1))))

;; el-get
;;(add-to-list 'load-path "~/.emacs.d/el-get-5.1")
;;(require 'el-get)

;; jedi python auto completion
;;(add-hook 'python-mode-hook 'jedi:setup)

;; enable which-function-mode
(which-function-mode 1)

(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))


;; search for gecko
(setq grep-find-command
      "grep -rnH --exclude=.git --include=\*.{c,cpp,h} --include=-e 'pattern' ~/code/gecko/*")

;; ag
(setq ag-highlight-search t)
(require 'quickrun)
(require 'whitespace-cleanup-mode)

(provide 'init-local)

(require 'centered-cursor-mode)
