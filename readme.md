# with-os [![Build Status](https://travis-ci.org/EricCrosson/with-os.svg?branch=master)](https://travis-ci.org/EricCrosson/with-os) [![MELPA Stable](https://stable.melpa.org/packages/with-os-badge.svg)](https://stable.melpa.org/#/with-os) [![MELPA](http://melpa.org/packages/with-os-badge.svg)](http://melpa.org/#/with-os)

> Conditionally execute emacs-lisp based on current operating system

## Install

[Coming soon](https://github.com/melpa/melpa/pull/5882) to [MELPA](https://melpa.org/)

``` {.sourceCode .lisp}
(use-package with-os :ensure t)
```

Or manually, after downloading into your `load-path`

``` {.sourceCode .lisp}
(require 'with-os)
```

## Use

``` {.sourceCode .lisp}
(with-os
  :darwin
  (message "Hello from Mac")
  (message "Multiple sexps are accepted")
  :linux
  (message "Hello from GNU/Linux)
  (message "Free as in freedom, baby")
  :windows-nt
  (message "I'm sorry for your loss"))
```

## License

GPL 2 (or higher) © [Free Software Foundation, Inc](http://www.fsf.org/about).
