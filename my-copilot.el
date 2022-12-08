;; copilot-hydra - Wrapper around copilot with some useful keybinings

;; Usage

;; (require 'copilot-hydra)

;; M-x copilot-hydra/body

;; I make no guarantee that I won't change these bindings later.


;;; Commentary:

(require 'copilot)
(require 'hydra)

;;; Code:

(defhydra copilot-hydra-hydra (:pre (copilot-complete))
  "Completing with copilot"
  ("j" copilot-hydra-accept-line "Take Line" :exit nil)
  ("h" copilot-previous-completion "Prev" :exit nil)
  ("k" copilot-accept-completion "Accept newline" :exit 't)
  ("w" copilot-accept-completion-by-word "Take word" :exit nil)
  ("<RET>" copilot-hydra-accept-newline "Accept" :exit nil)
  ("<backspace>" copilot-hydra-clear-overlay "Give up" :exit 't)
  ("." copilot-accept-completion "Accept" :exit 't)
  ("<SPC>" copilot-next-completion "Next" :exit nil))


(defun copilot-hydra-accept-newline ()
  (interactive)
  (copilot-accept-completion)
  (newline)
  (run-with-timer 0.2 nil 'copilot-complete))

(defun copilot-hydra-accept-line ()
  (interactive)
  (copilot-accept-completion-by-line 1)
  (indent-for-tab-command)
  (run-with-timer 0.2 nil 'copilot-complete))


(defun copilot-hydra-accept-repeat ()
  (interactive)
  (copilot-accept-completion)
  (indent-for-tab-command)
  (copilot-complete))

(defun copilot-hydra-clear-overlay ()
  (interactive)
  (message "Clearing overlay")
  ; wasn't working without overlap
  (run-with-timer 0.2 nil 'copilot-clear-overlay))


(provide 'copilot-hydra)
;;; copilot-hydra.el ends here
