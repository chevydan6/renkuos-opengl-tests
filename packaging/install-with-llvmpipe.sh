#!/bin/sh
set -eu
kit_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
exec pkgman install \
    "$kit_dir/software-renderer/libglvnd-1.7.0-4-x86_64.hpkg" \
    "$kit_dir/software-renderer/llvm21_libs-21.1.8-2-x86_64.hpkg" \
    "$kit_dir/software-renderer/mesa-26.1.8-1-x86_64.hpkg" \
    "$kit_dir/software-renderer/mesa_eglvnd-26.1.8-1-x86_64.hpkg" \
    "$kit_dir/renkuos_opengl_tests-2026.11.15-1-x86_64.hpkg"
