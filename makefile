.PHONY: link unlink

link:
	ln -s $(PWD)/zshrc $(HOME)/.zshrc
	ln -s $(PWD)/zsh-theme $(HOME)/.zsh-theme

unlink:
	unlink $(HOME)/.zshrc
	unlink $(HOME)/.zsh-theme
