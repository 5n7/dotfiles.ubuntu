.PHONY: symlink
symlink:
	ln -fs ~/src/github.com/skmatz/dotfiles/.gitconfig ~/.gitconfig
	ln -fs ~/src/github.com/skmatz/dotfiles/.tmux.conf ~/.tmux.conf
	ln -fns ~/src/github.com/skmatz/dotfiles/.zsh ~/.zsh
	ln -fs ~/src/github.com/skmatz/dotfiles/.zshenv ~/.zshenv
	ln -fs ~/src/github.com/skmatz/dotfiles/.zshrc ~/.zshrc
	ln -fs ~/src/github.com/skmatz/dotfiles/albert.conf ~/.config/albert/albert.conf
	ln -fs ~/src/github.com/skmatz/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
	ln -fns ~/src/github.com/skmatz/dotfiles/nvim/rc ~/.config/nvim/rc
