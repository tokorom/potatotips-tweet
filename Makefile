build:
	swift build
run:
	pbpaste | swift run
test:
	swift test 2>&1 | xcpretty
