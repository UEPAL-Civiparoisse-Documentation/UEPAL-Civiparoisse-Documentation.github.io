.PHONY: build serve pull image clean servopen servclose
image = uepal_test/mkdocs-material
builddir = MATERIAL
sitedir = site
all: image build
image:
	rm -Rf ${builddir}
	git clone https://github.com/squidfunk/mkdocs-material.git ${builddir}
	docker build --rm --no-cache -t ${image} ${builddir}
	rm -Rf ${builddir}
build:
	docker run --rm -ti --mount type=bind,source=${CURDIR},destination=/docs --name="mkdocs_material" ${image}  build
serve:
	docker run  --rm -ti -d -p 127.0.0.1:8000:8000 --mount type=bind,source=${CURDIR},destination=/docs --name="mkdocs_material" ${image}

servopen: serve
	xdg-open http://127.0.0.1:8000

servclose:
	docker stop mkdocs_material

clean:
	rm -Rf ${builddir}
	rm -Rf ${sitedir}/*
