Combined native x86-64 RenkuOS package for Piglit and Khronos OpenGL CTS, plus an optional Mesa llvmpipe software-rendering kit.

- **renkuos_opengl_tests-2026.11.15-1-x86_64.hpkg**: Install both test tools without changing the graphics driver.
- **renkuos-opengl-tests-software-kit.tar**: Includes the test package and the tested CPU-only Mesa stack. Installing the optional stack upgrades or replaces graphics packages.
- **SHA256SUMS**: Checksums for both downloads.

Tested in a RenkuOS build00085 VM. The full suites have not been run, and the N100 hardware driver has not been tested with these packages. See the repository README for installation instructions, dependencies and test limitations.
