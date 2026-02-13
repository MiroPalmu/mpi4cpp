(use-modules (guix)
             (guix git-download)
             (guix build utils)
             (guix build-system cmake)
             (guix licenses)
             (gnu packages mpi))

(define mpi4cpp-commit "6269eef509aaa657bd3a60b46fe94740e5e72a02")

(package
  (name "mpi4cpp")
  (version "0.1.0")
  (source
   (origin
     (method git-fetch)
     (uri (git-reference
            (url "https://github.com/MiroPalmu/mpi4cpp")
            (commit mpi4cpp-commit)))
     (file-name (git-file-name name mpi4cpp-commit))
     (sha256
      (base32
       "1kczg5jypwwamfraqrcs1jfqxalpq6znazix40wsbpr32aqja5s8"))))
  (build-system cmake-build-system)
  (propagated-inputs
   (list openmpi))
  (arguments
   (list #:configure-flags #~(list "-DBUILD_TESTS=ON")))
  (native-search-paths
   (list (search-path-specification
           (variable "CPLUS_INCLUDE_PATH")
           (files '("include")))))
  (home-page "https://github.com/hel-astro-lab/mpi4cpp")
  (synopsis "C++ bindings for MPI")
  (description "This package contains C++ bindings for MPI called mpi4cpp")
  (license #f))
