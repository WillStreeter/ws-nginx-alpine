TAG = $(shell echo `grep "TAG=" ./hub.config.env | sed 's/.*=//'`)
VERSION = $(shell echo `grep "VERSION=" ./hub.config.env | sed 's/.*=//'`)

build:
	docker build -t ws-nginx-alpine .


tag-it:
	docker tag $(TAG) willsonic/ws-nginx-alpine:$(VERSION)


hub-push:
	docker push willsonic/ws-nginx-alpine
