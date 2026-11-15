#!/bin/sh
set -eu
kit_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
exec pkgman install "$kit_dir/renkuos_opengl_tests-2026.11.15-1-x86_64.hpkg"
