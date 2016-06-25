(defun my-scons-mode()
  (interactive)
  (python-mode)
  (setq python-indent-offset 4)
  (setq indent-tabs-mode nil))

(add-to-list 'auto-mode-alist '("SConstruct" . my-scons-mode))
(add-to-list 'auto-mode-alist '("SConscript" . my-scons-mode))




