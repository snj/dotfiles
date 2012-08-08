(setq load-path (cons "/Users/kinoshita/.emacs.d/site-lisp" load-path))

;; don't make backups
(setq make-backup-files nil)

(column-number-mode 1)
(line-number-mode 1)

(defmacro req (lib &rest body)
  `(when (locate-library ,(symbol-name lib))
     (require ',lib) ,@body))

(defmacro lazyload (func lib &rest body)
  `(when (locate-library ,lib)
     ,@(mapcar (lambda (f) `(autoload ',f ,lib nil t)) func)
     (eval-after-load ,lib
       '(progn
          ,@body))))
;;;; Usage:
;; (lazyload (php-mode) "php-mode"
;;           (req symfony))
;;;; add-hookは外に書く
;; (add-hook-fn 'php-mode-hook
;;              (setq tab-width 2)
;;              (c-set-offset 'arglist-intro '+)
;;              (c-set-offset 'arglist-close 0))


(defmacro add-hook-fn (name &rest body)
  `(add-hook ,name #'(lambda () ,@body)))
;;;; Usage:
;; (add-hook-fn 'php-mode-hook
;;              (require 'symfony)
;;              (setq tab-width 2))

(defmacro append-to-list (to lst)
  `(setq ,to (append ,lst ,to)))
;;;; Usage:
;; (append-to-list exec-path
;;                 '("/usr/bin" "/bin"
;;                   "/usr/sbin" "/sbin" "/usr/local/bin"
;;                   "/usr/X11/bin"))

(defmacro global-set-key-fn (key args &rest body)
  `(global-set-key ,key (lambda ,args ,@body)))
;;;; Usage:
;; (global-set-key-fn (kbd "C-M-h") nil (interactive) (move-to-window-line 0))
;; (global-set-key-fn (kbd "C-M-m") nil (interactive) (move-to-window-line nil))
;; (global-set-key-fn (kbd "C-M-l") nil (interactive) (move-to-window-line -1))

(req ddx)
(req elscreen)

(setq text-mode-hook 'turn-off-auto-fill)
(setq html-mode-hook 'turn-off-auto-fill)

