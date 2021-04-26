#!/bin/bash
set -e
make
RUSTC_VERSION=1.39.0 MRUSTC_TARGET_VER=1.39 OUTDIR_SUF=-1.39.0 make RUSTCSRC
RUSTC_VERSION=1.39.0 MRUSTC_TARGET_VER=1.39 OUTDIR_SUF=-1.39.0 time make -f minicargo.mk LIBS
RUSTC_VERSION=1.39.0 MRUSTC_TARGET_VER=1.39 OUTDIR_SUF=-1.39.0 make test
RUSTC_VERSION=1.39.0 MRUSTC_TARGET_VER=1.39 OUTDIR_SUF=-1.39.0 make local_tests
RUSTC_INSTALL_BINDIR=bin RUSTC_VERSION=1.39.0 MRUSTC_TARGET_VER=1.39 OUTDIR_SUF=-1.39.0 make -f minicargo.mk output-1.39.0/rustc
LIBGIT2_SYS_USE_PKG_CONFIG=1 RUSTC_VERSION=1.39.0 MRUSTC_TARGET_VER=1.39 OUTDIR_SUF=-1.39.0 make -f minicargo.mk output-1.39.0/cargo
./output-1.39.0/cargo --version