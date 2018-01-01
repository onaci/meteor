

build:
	docker build -t onaci/meteor .

run:
	docker run --rm -it -p 3000:3000 -v $(PWD):/app onaci/meteor

shell:
	docker run --rm -it -p 3000:3000 -v $(PWD):/app onaci/meteor
