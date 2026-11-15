# RenkuOS OpenGL test tools

This x86_64 native package installs Piglit and Khronos OpenGL CTS together. It contains the compiled tools, test data and licenses. The commands are `piglit` and `glcts`; both are terminal programs.

## Install

On RenkuOS x86_64 build00085 or a compatible newer build, copy the `.hpkg` to the system and run:

```sh
pkgman install /path/to/renkuos_opengl_tests-2026.11.15-1-x86_64.hpkg
```

The package declares its Python 3.10, NumPy, Mako, OpenGL, EGL, PNG and other runtime dependencies. `pkgman` needs configured repositories or locally supplied packages to resolve missing dependencies. An EGL-capable OpenGL stack must be available. The standalone test package does not replace the current graphics driver.

### Optional CPU-only Mesa stack

The accompanying `renkuos-opengl-tests-software-kit.tar` contains the test package plus the tested Mesa 26.1.8 llvmpipe renderer, libglvnd and LLVM runtime. Extract it on RenkuOS and run `./install-with-llvmpipe.sh` from the extracted directory. The package manager may ask how to resolve conflicts with an older Mesa software renderer. Repositories may still be needed for Python and other dependencies.

This optional operation upgrades/replaces the installed Mesa and OpenGL dispatch packages and installs CPU software rendering. Use the standalone test package with a compatible hardware EGL stack when testing a GPU driver; do not install the CPU-only stack over a hardware setup unless that replacement is intended. The supplied stack was built and tested against RenkuOS build00085 (Haiku hrev60072+815) and compatible newer builds are not guaranteed.

## Run

Use a new results directory for each Piglit run:

```sh
piglit run -1 --timeout 60 sanity /boot/home/piglit-results/sanity
piglit summary console -s /boot/home/piglit-results/sanity

glcts --deqp-case='KHR-GL46.info.*' --deqp-log-filename=/boot/home/gl46-info.qpa
glcts --deqp-case='KHR-GL46.aggressive_optimizations.*' --deqp-log-filename=/boot/home/gl46-shaders.qpa
```

`glcts` defaults to an offscreen EGL pbuffer, disables the Mesa shader cache to avoid a VM shutdown stall, and limits unspecified FBO dimensions to 256. Set `MESA_SHADER_CACHE_DISABLE=false` to test the cache. Use `--deqp-gl-context-type=haiku` to select the older native GLUT window backend. The EGL adapter currently does not support window surfaces, shared contexts, context flags, or OpenGL ES.

OpenGL CTS's list of 16,498 GL 4.6 cases is at `/boot/system/data/renkuos-opengl-tests/opengl-cts/gl_cts/data/mustpass/gl/khronos_mustpass/4.6.0.x/gl46-main.txt`. Tests use the renderer selected by the installed system: llvmpipe is a CPU renderer. Check `GL_RENDERER` in the CTS results before treating results as GPU tests.

## Verification and limitations

The package was installed, uninstalled and reinstalled with `pkgman` in the isolated RenkuOS VM. Installed CTS passed six GL 4.6 information checks; previous tests of this CTS build passed a 755-case GL 4.6 sample with 700 passes, no failures, and 55 unsupported. A package-installed Piglit sanity run completed with 27 passes, one skip and two timeouts. The same two individual tests also hung after emitting results from the pre-existing, unpackaged Piglit build in this VM; this is an existing runtime limitation, not a package-only regression. The full suites have not been run and no Khronos conformance certification is implied.

To remove the test package: `pkgman uninstall renkuos_opengl_tests`. Your test result directories remain separate from the package.

## Downloads and source

Download the install packages and their SHA-256 checksums from the [latest release](https://github.com/chevydan6/renkuos-opengl-tests/releases/latest). The repository contains the port patches and package launcher scripts; it does not contain complete upstream source trees or a fully automated rebuild system.

The Piglit patch is based on upstream commit `edf773823120c32f84c667e9610d21b1d0aa8d42`; the OpenGL CTS patch is based on Khronos VK-GL-CTS commit `5bb4c7e83acea0fc73e3333625e4f20542e584d0`. The optional software stack uses Mesa 26.1.8. See [verification notes](docs/verification.md) for the VM results and limitations.
