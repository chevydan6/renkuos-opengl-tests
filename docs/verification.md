# Native package verification

The combined package was created in the RenkuOS build00085 VM, installed with pkgman, removed, reinstalled, updated with documentation and licenses, reinstalled again, and tested after reboot from `/tmp`. Removing it removed `/boot/system/bin/piglit` and `/boot/system/bin/glcts` while the original VM copies in `/boot/home` remained intact. Final host artifact and installed HPKG have identical SHA-256 hashes.

The installed package's Piglit runner executed the `clear-varray-2.0` OpenGL test: 1 passed. Its 30-case sanity profile produced 27 passes, 0 failures, 0 crashes, 1 skip and 2 timeouts. Both timed-out cases were also run using the old unpackaged binaries: both printed a Piglit result but failed to exit within 12 seconds. This existing issue is not resolved by the package.

Installed CTS ran the six GL 4.6 info cases and 12 aggressive shader tests with all passing, and the GLUT compatibility renderer info case also passed. The standalone Mesa 26/EGL build previously completed a 755-case representative run with 700 passes, 55 unsupported and no failures. These are not complete conformance runs.

`pkgman resolve-dependencies` resolved the package against the active system. The extracted software kit's checksums all passed in RenkuOS; an installer dry-run showed exactly the five bundled HPKGs and was canceled. The optional kit has not been installed on a fresh or physical system. It may need configured package repositories for dependencies and may require resolving old Mesa software-renderer conflicts.

Log files in this directory capture the sanity profile, original binaries' hangs, package rendering and CTS checks, dependency resolution and the optional installer dry-run.
