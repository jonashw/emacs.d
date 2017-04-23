This is my humble emacs config.  It's all based around evil mode, since I come from vim.  The high-level configuration is done in `init.el`, with references to details under `lisp/`.

This config has allowed me to use emacs over vim for the majority of my frontend work (read: angular v1) between Sept. 2016 and May 2017. I find it to be pretty comfortable.

Things that need improvement:
- Directory browsing experience (Switch from `dired` to  something else, or improve `dired` keybindings):
    - regex searching via `/` 
    - `gg` and `G` for BOF, EOF
    - `u` to go up
- Shell access
- Better autocomplete (is Company even working?)
- Haskell mode