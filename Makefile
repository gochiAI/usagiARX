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
	@read -p "ENTER EXAMPLE NAME: " input
	@for example in $(shell find . -maxdepth 1 -type d -name "[^.]*"); do
		if [ `echo "$$example" | grep "$$input"` ]; then
			@echo '======================================================'
			@echo "[TARGET] $$example"
			@echo '======================================================'
			(
				cd "$$example";
				flutter clean;
				flutter pub get;
				flutter format lib/;
				flutter analyze;
				flutter run -d web-server --web-renderer html;
			)
			break
		fi
	done
