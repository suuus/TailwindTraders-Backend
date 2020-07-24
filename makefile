BRANCH ?= jessica-gnome-fix
USERNAME ?= jldeen
USEREMAIL ?= jedeen@outlook.com

.PHONY: clean

clean:
	-make git-clean

setup:
	-git config --global user.email $(USEREMAIL)
	-git config --global user.name $(USERNAME)

git-clean: 
	-git checkout main
	-git pull
	-git branch -d $(BRANCH)
	-git push origin -d $(BRANCH) && echo "$(BRANCH) successfully deleted"
	-git fetch --prune
	-git checkout -b $(BRANCH) origin/main
	-git push --set-upstream origin $(BRANCH)
	