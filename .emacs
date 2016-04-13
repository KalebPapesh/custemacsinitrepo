;;remove default start-up buffer
(setq inhibit-startup-message t)

;;implement colour coding
(global-font-lock-mode t)

;;turn off menu bar if in CLI
(cond
    ((eq window-system 'x)
     (menu-bar-mode 1))
    (t
     (menu-bar-mode 0)))

;;stop annoying backup files
(setq make-backup-files nil)

;;change yes or no to y or p
(fset `yes-or-no-p `y-or-n-p)

;; Set Linum-Mode on
(global-linum-mode t)
 
;; Linum-Mode and add space after the number
(setq linum-format "%d ")

;;suppress symbolic link warnings
(setq find-file-visit-truename t)

;;show matching parens
(show-paren-mode 1)

;;use ibuffer instead of default buffer menu
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;overwrite the selected region after marking and yanking. ie cut and paste
(delete-selection-mode 1)

;;auto update buffer if changes are made to file.
(global-auto-revert-mode t)

;;fucntion to save macros
(defun save-macro (name)                  
    "save a macro. Take a name as argument
     and save the last defined macro under 
     this name at the end of your .emacs"
     (interactive "SName of the macro: ")  ; ask for the name of the macro    
     (kmacro-name-last-macro name)         ; use this name for the macro    
     (find-file user-init-file)            ; open ~/.emacs or other user init file 
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro 
     (newline)                             ; insert a newline
     (save-buffer)                         ; save buffery
     (switch-to-buffer nil))               ; switch back to original buffer

(fset 'removeline
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 11 backspace 14] 0 "%d")) arg)))

