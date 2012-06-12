vim-magiq
=========

This vim bundle adds syntax highlighting, for NCS MagiQ.

## Installing and Using ##

- Install [pathogen](http://www.vim.org/scripts/script.php?script_id=2332) into `~/.vim/autoload/` and add the
   following line to your `~/.vimrc`:

        call pathogen#infect()

- Make a clone of the `vim-magiq` repository:

        $ mkdir -p ~/.vim/bundle
        $ cd ~/.vim/bundle
        $ git clone https://github.com/tfentonz/vim-magiq

- OR use git submodules:

        $ git submodule add https://github.com/tfentonz/vim-magiq.git bundle/vim-magiq
        $ git submodule init

That's it. Pathogen should handle the rest. Opening a file with first line
`*DYOFF*` will load everything.
