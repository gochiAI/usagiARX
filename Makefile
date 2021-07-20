default: run

.ONESHELL:
run:
	@read -p "ENTER EXAMPLE NAME: " appname
	(cd "$$appname" ; flutter clean; flutter run -d web-server --web-renderer html)
