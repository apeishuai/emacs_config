;; use an org file to organise feeds
(use-package elfeed-org
  :ensure t
  :config
  (setq elfeed-db-directory(expand-file-name "elfeed" user-emacs-directory)
	elfeed-show-entry-switch 'display-buffer)
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")
	))

;;key-binding
(global-set-key (kbd "C-x r") 'elfeed)
(global-set-key (kbd "C-x s") 'elfeed-star)


(defun elfeed-star ()
  "Apply starred to all selected entries."
  (interactive )
  (let* ((entries (elfeed-search-selected))
         (tag (intern "starred")))

    (cl-loop for entry in entries do (elfeed-tag entry tag))
    (mapc #'elfeed-search-update-entry entries)
    (unless (use-region-p) (forward-line))))

(defun elfeed-show-starred ()
  (interactive)
  (bookmark-jump "elfeed-starred"))
(define-key elfeed-search-mode-map (kbd "S") 'elfeed-show-starred)



(provide 'RSS)
