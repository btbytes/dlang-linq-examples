dlang-linq-examples:
	dub

docs:
	dub build --build=docs

test:
	dub run --build=unittest


.PHONY:
clean:
	rm -rf docs
	rm -rf dlang-linq-examples
