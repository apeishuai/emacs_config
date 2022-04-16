(defun company-mytags-scan-project-root()
  (let* ((root-dir (locate-dominating-file default-directory ".git" ))
	 (default-directory root-dir)
	 (find-cmd (format "find . -path \"*/.git\" -prune -o  -type f -iname \"*.txt\" -print"))
	 (output (shell-command-to-string find-cmd))
	 (files (split-string output "[\n\r]+"))
	 (all-content "")
	 rlt)

    (dolist (file files)
      (when (and (not (string= file ""))
		 (file-exists-p file))
	(setq all-content (concat all-content
				  (with-temp-buffer
				    (insert-file-contents file)
				    (buffer-string)
				    )))))
    ;; scan root-dir
    ;; word 
    ;; [a-zA-Z-_]+ [^a-zA-Z-_]+
    (setq rlt
	  (delq nil (delete-dups (sort (split-string all-content "[^a-zA-Z-_]+") 'string<))))
    (message "rlt=%s" rlt)
    rlt))

(defun company-mytags-candidates(prefix)
  (let* (
	 (all-items (company-mytags-scan-project-root))
	 (i 0)
	 (pattern "^")
	 rlt)
    (while (< i (length prefix))
      (setq pattern (concat  pattern (substring prefix i (1+ i)) ".*"))
      (setq i (1+ i)))

    (dolist (item all-items)
      (when (string-match pattern item)
	(push item rlt)))
    rlt))


(defun company-mytags (command &optional arg &rest ignored)
  "`company-mode' completion backend for GNU Global."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-gtags))
    (prefix (company-grab-symbol))
    (candidates (company-mytags-candidates arg))))

(setq company-backends '(company-mytags))

(provide 'company-mytags)

