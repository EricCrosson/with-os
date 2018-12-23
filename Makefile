test:
	emacs --version
	emacs -nw --batch --eval '(load-file "with-os.el")'
