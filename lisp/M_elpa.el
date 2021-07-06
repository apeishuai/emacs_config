(require 'package)
(setq package-enable-at-startup nil)
(setq package-check-signature nil)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                       ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;;(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org-download
  :ensure t
  :bind ("C-S-y" . org-download-screenshot)
  :config
  (require 'org-download)
  (add-hook 'dired-mode-hook 'org-download-enable))


;;Blog
(use-package nikola 
  :ensure t)


(use-package try
  :ensure t)

(use-package company
  :ensure t
  )
 
(use-package which-key
  :ensure t
  :config(which-key-mode))

(use-package evil
  :ensure t
  :config(evil-mode))

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode)
  (keyfreq-autosave-mode))

(use-package graphviz-dot-mode
  :ensure t
  :config
  (setq graphviz-dot-indent-width 4))

(use-package cnfonts
  :ensure t
)

;;latex-package
(use-package cdlatex 
  :ensure t)

(use-package auctex
  :defer t
  :ensure t)

;;scheme-package
(use-package racket-mode 
  :ensure t)

(use-package paredit
  :ensure t)


;;定时提醒
(use-package appt)
(setq appt-message-warning-time 0)      ; 0 minute time before warning
(setq diary-file "/home/shuai/shuai-files/GTD/diary.org")             ; diary file

;;programming lsp environment
(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package flycheck
    :ensure t)

;;(use-package company-lsp
;;  :ensure t
;;  :commands company-lsp
;;  :config
;;  (push 'company-lsp company-backends))

(use-package lsp-ui
    :ensure t)


;;C++ programming
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disable-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook((c-mode c++-mode objc-mode) . (lambda () (require 'ccls) (lsp))))



(provide 'M_elpa)
