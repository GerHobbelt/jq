#!/usr/bin/env bash
set -euo pipefail

declare -r SCRIPT_DIR=`cd -- "$(dirname "$0")" >/dev/null 2>&1; pwd -P`

main() {
	# ensure we are in jq root
	cd "$SCRIPT_DIR/../.."
	configure_build
	build
}

configure_build() {
	export CC=arm-linux-gnueabihf-gcc
	export CXX=arm-linux-gnueabihf-g++
	
	git submodule update --init
	autoreconf -fi
	./configure --with-oniguruma=builtin --target=arm-linux-gnueabihf --host=x86_64-linux-gnu
}

build() {
	make -j8
}

main
