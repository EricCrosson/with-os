;;; with-os.el --- Conditionally execute sexps based on current OS -*- lexical-binding: t; -*-
;;
;;; Copyright (C) 2018  Free Software Foundation, Inc.
;;
;; Author: Eric Crosson <eric.s.crosson@utexas.com>
;; Version: 1.0.0
;; Keywords: convenience
;; URL: https://github.com/EricCrosson/with-os
;; Package-Requires: ((emacs "24"))
;;
;; This file is not a part of GNU Emacs.
;;
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.
;;
;;
;;; Commentary:
;;
;; This package provides a macro to conditionally execute
;; symbolic-expressions depending on the current operating system.

;;; Code:


(defun with-os-process (plist)
  "Process PLIST and execute the sexps associated with the current `system-type'."
  (let ((system-type-symbol (intern (concat ":" (symbol-name system-type)))))
  (dolist (sexp (plist-get plist system-type-symbol))
    (eval sexp))))


(defun with-os-normalize (plist)
  "Normalize the PLIST given as arguments to `with-os'."
  (let* (plist-grouped)
    (while plist
      (if (symbolp (car plist))
          (setq plist-grouped (cons (car plist) plist-grouped)
             plist (cdr plist))
        (push
         (let (body)
           (while (not (symbolp (car plist)))
             (push (car plist) body)
             (setq plist (cdr plist)))
           (reverse body))
         (cdr plist-grouped))))
  plist-grouped))


;;;###autoload
(defmacro with-os (&rest args)
  "Conditionally execute symbolic expressions based on operating system.

For full documentation, please see the README file that came with this
file.  Usage:

  (with-os
    [:operating-system [body]]...)

Recognized operating systems (determined by `system-type'):

:darwin          Mac OS
:linux           GNU/Linux
:windows-nt      Microsoft Windows"
  (declare (indent defun))
  `(let* ((args* (with-os-normalize ',args)))
     (with-os-process args*)))


(provide 'with-os)

;;; with-os.el ends here
