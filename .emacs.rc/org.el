(setq org-hide-emphasis-markers t)
(setq org-return-follows-link  t)
(setq org-startup-indented t)
(setq org-pretty-entities t)

(defun my/org-auto-export-to-latex ()
  "Exporta automáticamente el archivo Org a LaTeX."
  (interactive)
  (when (eq major-mode 'org-mode)
    (org-latex-export-to-latex)))

(add-hook 'org-mode-hook
          (lambda ()
	    (visual-line-mode)
	    (setq word-wrap t)
	    (org-indent-mode)
            (local-set-key (kbd "C-c C-c") #'my/org-auto-export-to-latex)))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("apa7"
                 "\\documentclass[12pt, stu, donotrepeattitle, floatsintext, a4paper, margin=1cm]{apa7}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))