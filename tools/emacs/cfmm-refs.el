;;; cfmm-refs.el --- Open cfmm-refs shelf PDFs from Hippius in Emacs  -*- lexical-binding: t; -*-

;; Usage: (load "~/cfmm-refs/tools/emacs/cfmm-refs.el")
;;        M-x cfmm-refs-open-pdf  — pick a citekey, PDF is fetched from the
;;        public Hippius bucket into `cfmm-refs-cache' and opened (pdf-tools
;;        or doc-view).  In org: [[shelf:CITEKEY]].
;; The URL is read from the card's `pdf:' front-matter line, which `shelf
;; index' writes after `shelf push' has verified the object.  No credentials.

(defvar cfmm-refs-root (expand-file-name "~/cfmm-refs/")
  "Checkout of the cfmm-refs shelf.")
(defvar cfmm-refs-cache (expand-file-name "~/.cache/cfmm-refs/")
  "Where fetched PDFs are kept between sessions.")

(defun cfmm-refs--citekeys ()
  (mapcar #'file-name-base
          (directory-files (concat cfmm-refs-root "text/") nil "\\.md\\'")))

(defun cfmm-refs--url-for (citekey)
  "Return the pdf: URL from the first card that belongs to CITEKEY."
  (let ((card (car (file-expand-wildcards
                    (concat cfmm-refs-root "topics/*/refs/" citekey ".md")))))
    (unless card (user-error "No card for %s" citekey))
    (with-temp-buffer
      (insert-file-contents card)
      (if (re-search-forward "^pdf: \\(https://[^ \n]+\\)" nil t)
          (match-string 1)
        (user-error "%s has no pdf URL yet (not pushed to Hippius?)" citekey)))))

;;;###autoload
(defun cfmm-refs-open-pdf (citekey &optional refresh)
  "Fetch CITEKEY's PDF from Hippius into the cache and open it.
With prefix argument REFRESH, re-download even if cached."
  (interactive (list (completing-read "Citekey: " (cfmm-refs--citekeys) nil t)
                     current-prefix-arg))
  (let ((url (cfmm-refs--url-for citekey))
        (dest (concat cfmm-refs-cache citekey ".pdf")))
    (make-directory cfmm-refs-cache t)
    (when (or refresh (not (file-exists-p dest)))
      (message "Fetching %s…" url)
      (url-copy-file url dest t))
    (find-file dest)))

;;;###autoload
(defun cfmm-refs-copy-url (citekey)
  "Put CITEKEY's public PDF URL on the kill ring."
  (interactive (list (completing-read "Citekey: " (cfmm-refs--citekeys) nil t)))
  (let ((url (cfmm-refs--url-for citekey)))
    (kill-new url)
    (message "%s" url)))

(declare-function org-link-set-parameters "ol" (type &rest parameters))

(with-eval-after-load 'org
  (org-link-set-parameters "shelf" :follow (lambda (ck _) (cfmm-refs-open-pdf ck))))

(provide 'cfmm-refs)
;;; cfmm-refs.el ends here
