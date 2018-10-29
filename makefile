.PHONY: link unlink

link:
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc
	ln -s $(CURDIR)/zsh-theme $(HOME)/.zsh-theme

unlink:
	unlink $(HOME)/.zshrc
	unlink $(HOME)/.zsh-theme
