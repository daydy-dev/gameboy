.DEFAULT_GOAL := build

.PHONY: web desktop

all: build install

watch:
	cargo watch -- make run

lint:
	cargo fmt -- --check --color always
	cargo clippy --all-targets --all-features -- -D warnings

build-wasm:
	cargo build --release --target wasm32-unknown-unknown
	wasm-opt -O4 ./target/wasm32-unknown-unknown/release/lr35902.wasm -o gameboy.wasm && du -h gameboy.wasm

test:
	cargo test --release

desktop:
	cd examples/desktop && cargo run --release

desktop-dev:
	cd examples/desktop && cargo run

terminal-dev:
	cd examples/terminal && cargo run

terminal:
	cd examples/terminal && cargo run --release

web:
	cd web && npm run serve

web-build-dev:
	cd web && npm run build-dev

web-publish:
	cd web && npm run publish

web-build:
	cd web && npm run build

