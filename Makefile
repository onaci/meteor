

build:
	docker build -t meteor .

run:
	docker run --rm -it -p 3000:3000 -v $(PWD):/app meteor bash
