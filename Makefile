.PHONY: symlink
symlink:
	ln -fns ~/src/github.com/skmatz/dotfiles/.zsh ~/.zsh
	ln -fns ~/src/github.com/skmatz/dotfiles/nvim/rc ~/.config/nvim/rc
	ln -fs ~/src/github.com/skmatz/dotfiles/.tmux.conf ~/.tmux.conf
	ln -fs ~/src/github.com/skmatz/dotfiles/.zshenv ~/.zshenv
	ln -fs ~/src/github.com/skmatz/dotfiles/.zshrc ~/.zshrc
	ln -fs ~/src/github.com/skmatz/dotfiles/albert.conf ~/.config/albert/albert.conf
	ln -fs ~/src/github.com/skmatz/dotfiles/git/.gitconfig ~/.gitconfig
	ln -fs ~/src/github.com/skmatz/dotfiles/git/ignore ~/.config/git/ignore
	ln -fs ~/src/github.com/skmatz/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
