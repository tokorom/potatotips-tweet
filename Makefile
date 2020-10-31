SHELL=/bin/zsh

build:
	swift build
run:
	pbpaste | swift run
run_and_pbcopy:
	pbpaste | swift run | pbcopy
test:
	swift test 2>&1 | xcpretty
watch:
	fswatch **/*.swift -o --event PlatformSpecific | xargs -n1 -I{} make test
