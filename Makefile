build:
	make -C apps/a build
	make -C apps/b build
	make -C apps/root build
	docker build . -t ok:v1
