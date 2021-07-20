default: run

.ONESHELL:
pubget:
	@for v in $(shell find . -maxdepth 1 -type d -name "[^.]*"); do
		(cd "$$v" ; flutter pub get)
	done

.ONESHELL:
analyze:
	@for v in $(shell find . -maxdepth 1 -type d -name "[^.]*"); do
		(cd "$$v" ; flutter analyze)
	done

.ONESHELL:
format:
	@for v in $(shell find . -maxdepth 1 -type d -name "[^.]*"); do
		(cd "$$v" ; flutter format lib)
	done

.ONESHELL:
run:
	@read -p "ENTER EXAMPLE NAME: " appname
	(cd "$$appname" ; flutter clean; flutter run -d web-server --web-renderer html)
