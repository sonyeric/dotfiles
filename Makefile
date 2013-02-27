.PHONY: clean linux freebsd git tmux

is_bashrc := $(shell grep "github.com" ~/.bashrc)

all:
	@echo "make linux for linux version"
	@echo "make freebsd for freebsd version"

linux: git tmux
ifeq ($(is_bashrc),)
	@cat .bashrc >> ~/.bashrc;
endif
	[ ! -f "~/.inputrc" ] && cp .inputrc ~/
	[ ! -f "~/.profile" ] && cp $@/.profile ~/
	@echo "Install $@ version compeletely !!!"

freebsd: git tmux
	[ ! -f "~/.profile" ] && cp $@/.profile ~/
	[ ! -f "/etc/make.conf" ] && cp $@/make.conf /etc/
	echo "==> copy .cshrc file to home directory"
	cp .cshrc ${HOME}/
	@echo "Install $@ version compeletely !!!"

git:
	wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ${HOME}/.git-completion.bash
	[ ! -f "~/.gitconfig" ] && cp .gitconfig ~/
	@echo "copy .gitconfig to home folder !!"

tmux:
	[ ! -f "~/.tmux.conf" ] && cp .tmux.conf ~/
	@echo "copy .tmux.conf to home folder !!"

clean:
	@rm -rf ~/.gitconfig
	@echo "clear .gitconfig"
