;; show time on status bar
(display-time)

;; show matched bracket
(show-paren-mode 1)
(setq show-paren-delay 0)

;; rainbow delimiters
(add-to-list 'load-path "~/.emacs.d/rainbow-delimiters")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

;;delete whole line
(setq kill-whole-line t)

; Copy Line Command
(defun copy-line (n)
    "Copy N lines at point to the kill-ring."
    (interactive "p")
    (kill-ring-save (line-beginning-position) (line-beginning-position (1+ n))))

(global-set-key "\C-c\C-y" 'copy-line)

;; Emacs-neotree
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(global-set-key [f8] 'neotree-toggle)

;; load theme monokai
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;; set indent 4 spaces
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
;;(setq-default tab-width 4)
;;(setq c-basic-offset 4)

;; VIM's 'o' and 'O'
;; newline-without-break-of-line
(defun newline-without-break-of-line ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun newline-without-break-of-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "<C-return>") 'newline-without-break-of-line)
(global-set-key (kbd "<M-return>") 'newline-without-break-of-line-above)

;; frame size
(add-to-list 'default-frame-alist '(height . 150))
(add-to-list 'default-frame-alist '(width .300))

;; linum setting
(global-linum-mode 1)

;; window move
;;(windmove-default-keybindings 'meta)

;; mouse scroll
;; 마우스 스크롤 사이즈
(setq mouse-wheel-scroll-amount '(3))

;; 마우스 스크롤 가속 없애기
(setq mouse-wheel-progressive-speed nil)

;; 키보드 한 줄씩 스크롤
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; before-save-hook
(add-hook 'before-save-hook 'delete-trailing-whitespace)
