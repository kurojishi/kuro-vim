Kuro neovim config
=======

my personal .config/nvimrc, feel free to use it and modify as you wish


it uses vundle for plugin management and the init can be a bit long

for YouCompleteMe plugin and Syntastic please follow their documentation for a correct setup(use the full installation guide for all the features)
https://github.com/Valloric/YouCompleteMe
https://github.com/scrooloose/syntastic


it's still not final, it need a lot of polishing as it's pratically a fork(reorganized and heavily modified) of Cris.config/nvim by crisidev
if you find something that can be improved or removed please set up a issue i'm open to modifications


INSTALL and SETUP
--------
be sure to have at least.config/nvim 7.3.584(needed by YouCompleteMe) compiled with +python support.
you need to clone vundle in .config/nvim/bundle/ https://github.com/gmarik/vundle/ a :BundleInstall! will download and install all the other plugin

YouCompleteMe needs to be compiled cd .confi/.config/nvim/bundle/YouCompleteMe && ./install.sh --clang-completer 
but read the doc for more infos

Pyclewn
----
pyclewn is still being tested if you want it working you can download it from there http://sourceforge.net/projects/pyclewn/files/ and install it following this guide http://pyclewn.sourceforge.net/install.html
