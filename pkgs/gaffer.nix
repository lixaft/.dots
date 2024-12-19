{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "gaffer";
  version = "1.5.1.0";
  src = pkgs.fetchFromGitHub {
    owner = "GafferHQ";
    repo = pname;
    rev = "${version}";
    sha256 = "sha256-eZnHG1/PbVHV3ii7YGrNxOjYImCPWC5z2LKHSTlmuMg=";
  };


  nativeBuildInputs = with pkgs; [
    gcc11
    inkscape
    scons
  ];

  buildInputs = with pkgs; [
    alembic
    boost
    rPackages.fontBitstreamVera
    c-blosc
    boost
    cmark
    # TODO: cortex
    # TODO: cycles
    # TODO: embree
    expat
    fmt
    freetype
    glew
    # TODO: gaffer resources
    hdf5
    imath
    jemalloc
    python3Packages.jinja2
    llvmPackages.llvm.dev # huh?
    lz4
    libffi
    libjpeg
    libpng
    libraw
    libtiff
    libwebp
    python3Packages.markupsafe
    materialx
    minizip
    opencolorio
    openjpeg
    openpgl
    osl
    opensubdiv
    openvdb
    pcg_c
    partio
    psutils
    pugixml
    python3Packages.pybind11
    python3Packages.pyopengl
    python3Packages.pyside2
    pystring
    python
    # TODO: Qt.py
    # TODO: qt
    tbb
    openusd
    yaml-cpp
    zlib
    python3Packages.zstrandard
  ];
}
