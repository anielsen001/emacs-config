; .emacs


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; https://melpa.org/#/getting-started
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "https://melpa.org/packages/")
   t)
  (package-initialize))

;;;;;; add things to the path
(add-to-list 'load-path "~/sw/emacs/elisp" )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (quarto-mode csv csv-mode ledger-import ledger-mode ivy-bibtex ivy helm-bibtex helm org-ref markdown-mode matlab-mode docker-compose-mode dockerfile-mode docker-tramp ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set up ipython - needs to have ipython.el in .emacs-d directory
;;(setq ipython-command "ipython")
;;(require 'ipython)
;;(setq py-python-command-args '("-pylab"))
;;(setq ansi-color-for-comint-mode t)
(setq python-shell-interpreter "ipython"
       python-shell-interpreter-args "-i")

(require 'tramp)
(setq tramp-default-method "ssh")

;; set up matlab mode
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))

;; set up gnuplot
;;(add-to-list 'load-path "/home/apnielsen/elisp/gnuplot-el")
;;(require 'gnuplot)

;; this is not needed with org-mode > 8.0
;; set up gnuplot mode
;;(add-to-list 'load-path "/home/apnielsen/elisp/gnuplot-mode")
;;(require 'gnuplot-mode)
;;(setq gnuplot-program "/usr/bin/gnuplot")

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; configure org mode babel for languages
;;(require 'org-babel)
;;(require 'org-babel-init)
;;(require 'org-babel-gnuplot)

;;(org-babel-do-load-languages
;; 'org-babel-load-languages
;; '((python . t)
;;   (gnuplot . t)
;;   (ledger .t)
;;   (sh .t)
;;   (dot .t)
;;   ))
;;   (gnuplot . t)))
;; add additional languages with '((language . t)))

;; set up gnuplot key-binding
;;(local-set-key "\M-\C-g" 'org-plot/gnuplot)

;; set up to do keywords
(setq org-todo-keywords '((sequence "TODO" "WAITING" "|" "DONE" "HOLD" "DELEGATED")))

;; set up task list
;; (setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ))

(setq org-agenda-exporter-settings
                '((ps-number-of-columns 2)
                  (ps-landscape-mode t)
		  (ps-print-color-p 'black-white)
                  (org-agenda-add-entry-text-maxlines 5)
                  (htmlize-output-type 'css)))

(setq org-agenda-custom-commands
           '(("X" agenda ""
              ((ps-number-of-columns 2)
               (ps-landscape-mode t)
               (org-agenda-prefix-format " [ ] ")
               (org-agenda-with-colors nil)
               (org-agenda-remove-tags t))
              ("theagenda.ps"))))

;; for org-contacts
;;(require 'org-contacts)
;;(setq org-contacts-files "/home/apn/org/contacts.org")

;; html export from org-mode
(require 'ox-reveal)
(setq org-reveal-root "file:///home/apn/sw/reveal.js")

;;(require 'ox-extras)
;;(ox-extras-activate '(ignore-headlines))

;; latex export
(require 'ox-latex)
;;(require 'ox-bibtex)

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

(add-to-list 'org-latex-classes
             '("antpages"
               "\\documentclass{antpages}"
               ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("afmemo"
               "\\documentclass{afmemo}"
               ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
           '("classmark"
             "\\documentclass{classmark}
              \\usepackage[pdftex,colorlinks,bookmarks=true]{hyperref}
              \\usepackage[pdftex]{graphicx,color}
             [NO-DEFAULT-PACKAGES]
             [EXTRA]"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; from
;; https://joonro.github.io/Org-Coursepack/Lectures/04%20Creating%20Content%20for%20Slides%20and%20Handouts.html
;; to allow for a notes block in an org file and export appropriately depending upon type of export
(defun string/starts-with (string prefix)
  "Return t if STRING starts with prefix."
  (and (string-match (rx-to-string `(: bos ,prefix) t) string) t))

(defun my/process-NOTES-blocks (text backend info)
  "Filter NOTES special blocks in export."
  (cond
   ((eq backend 'latex)
    (if (string/starts-with text "\\begin{NOTES}") ""))
   ((eq backend 'rst)
    (if (string/starts-with text ".. NOTES::") ""))
   ((eq backend 'html)
    (if (string/starts-with text "<div class=\"NOTES\">") ""))
   ((eq backend 'beamer)
    (let ((text (replace-regexp-in-string "\\\\begin{NOTES}" "\\\\note{" text)))
      (replace-regexp-in-string "\\\\end{NOTES}" "}" text)))
   ))

(eval-after-load 'ox '(add-to-list
                   'org-export-filter-special-block-functions
                   'my/process-NOTES-blocks))




;; set up org-ref for inserting bibtex style references into org mode files
(setq bibtex-completion-bibliography (list (expand-file-name "/home/apn/Documents/magnav/magnav.bib")))

(require 'org-ref)
(require 'org-ref-helm)
(setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
      org-ref-insert-cite-function 'org-ref-cite-insert-helm
      org-ref-insert-label-function 'org-ref-insert-label-link
      org-ref-insert-ref-function 'org-ref-insert-ref-link
      org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))






;; (setq org-latex-to-pdf-process (list "latexmk -pdf %f"))
;; (setq org-latex-pdf-process (list "latexmk -pdf %f"))

;; set up ido "interactivel do things" mode
(require 'ido)
(ido-mode t)

;; control how the file names are displayed at the bottom
;; if more than one file of the same name is opened
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; control visual line mode
;; (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; set hooks for modes
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Below are packages not included with emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; This site had useful config info also for setting up
;; IDE configuration in emacs
;; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/

;; add popup - required by autocomplete
;; https://github.com/auto-complete/popup-el
;;(add-to-list 'load-path "~/sw/elisp/popup-el")
;;(require 'popup)

;; set up auto-complete
;; https://www.emacswiki.org/emacs/AutoComplete
;; https://github.com/auto-complete/auto-complete
;;(add-to-list 'load-path "~/sw/elisp/auto-complete" )
;;(require 'auto-complete)
;;(global-auto-complete-mode t)

;; fill column indicator
;; https://www.emacswiki.org/emacs/fill-column-indicator.el
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode
;;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(global-fci-mode t)

;; set up ledger
;;(add-to-list 'load-path "~/sw/ledger/lisp")
;;(require 'ledger-mode)

;; set up markdown mode
(add-to-list 'load-path "/home/apn/sw/elisp/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; set up julia mode
(add-to-list 'load-path "/home/apn/sw/emacs/julia-emacs")
(require 'julia-mode)

;; add column number
(setq column-number-mode t)

;; setup quarto mode
(require 'quarto-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;; docker integration
