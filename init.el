(server-start)


(add-to-list 'load-path
	     (expand-file-name "lisp" user-emacs-directory))

(require 'racket-mode)
(require 'startup)
(require 'M_elpa)
;;(require 'my-find-file)
;;(require 'ChaDefuApp)
(require 'init-racket)
(require 'init-latexx)
;;(require 'init-lsp)
(require 'config_Gtd)
(require 'org-protocol)
(require 'config_Rss)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open")))
 '(package-selected-packages
   '(elfeed-org nikola xpm org2blog ivy org-download auto-complete auto-company ccls lsp-mode cdlatex auto-complete-auctex geiser auctex keyfreq use-package))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans" :foundry "PfEd" :slant normal :weight normal :height 143 :width normal)))))

