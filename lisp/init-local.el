;; reveal.js
(require 'ox-reveal)
(setq org-reveal-root "file:///Users/peter/code/reveal.js")

;; this line activates dot
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (plantuml . t)
   (dot . t)
   (R . t)))

;; setup plantuml jar path
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/lisp/plantuml.jar"))

(require 'pbcopy)

;; enable flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(require 'flyspell-lazy)
(flyspell-lazy-mode 1)

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
(xterm-mouse-mode 0)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))

;; search for gecko
(setq grep-find-command
      "grep -rnH --exclude=.git --include=\*.{c,cpp,h} --include=-e 'pattern' ~/code/gecko/*")

;; ag
(setq ag-highlight-search t)
(global-set-key (kbd "C-x g") 'ag-project)

(require 'quickrun)
(require 'whitespace-cleanup-mode)

;;find-file-in-project
(autoload 'find-file-in-project "find-file-in-project" nil t)
(autoload 'find-file-in-project-by-selected "find-file-in-project" nil t)
(global-set-key (kbd "C-x f") 'find-file-in-project-by-selected)
(setq ffip-prune-patterns '("*/.git/*"))
(setq ffip-project-root "~/code/gecko")
(setq ffip-prefer-ido-mode t)
;;(setq ffip-debug t)

;;(setq-local ffip-find-options "-not -size +64k -not -iwholename '*/.git/*' -not -iwholename '*/GTAGS/*' -not -iwholename '*/GPATH/*' -not -iwholename '*/GRTAGS/*' ")
(provide 'init-local)

(require 'centered-cursor-mode)

;; Enable org-mode
(require 'org)

;; hotkey setting
(global-set-key (kbd "<f8>") 'org-agenda)
(global-set-key (kbd "<f9>") 'org-capture)
(global-set-key (kbd "C-c c") 'org-capture)

;; setup for GTD
(setq org-capture-templates (quote(
                                   ("t" "Todo" entry (file+headline "~/code/org/newgtd.org" "Tasks")
                                    "* TODO %^{Brief Description} %^g\n Next: %i%?\n  %U")
                                   ("w" "Working" entry (file+headline "~/code/org/newgtd.org" "Working")
                                    "* TODO %^{Brief Description} %^g\n Next: %i%?\n  %U")
                                   ("j" "Journal" entry (file+datetree "~/code/org/journal.org")
                                    "* %?\nEntered on %U\n  %i\n  %a"))
                                  ))
(add-to-list 'org-modules 'org-timer)
(setq org-agenda-files (quote ("~/code/org"
                               )))
