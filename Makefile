PWD=$(shell pwd)
NAME=$(shell basename $(PWD))
IMAGE=$(NAME)
TAG=local
JUPYTER_IP=0.0.0.0
JUPYTER_PORT=8888

.PHONY: start-notebook

start-notebook:
	docker run --name $(NAME) --rm -it -v $(PWD):/src -p $(JUPYTER_PORT):$(JUPYTER_PORT) $(IMAGE):$(TAG) jupyter notebook --ip $(JUPYTER_IP) --port $(JUPYTER_PORT) --allow-root

include Makefile.defs
