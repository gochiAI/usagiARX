default: run

.ONESHELL:
run:
	@read -p "ENTER EXAMPLE NAME: " appname;
	(cd "$$appname" ; flutter run -d web-server)
