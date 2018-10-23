{ pkgs ? import <nixpkgs> {} }:

with pkgs;


let dtek-tex-pkg = stdenv.mkDerivation rec {
      name = "dtek-tex";
      src = { outPath = ./.; name = name; };
      installPhase = ''
        mkdir -p $out/tex/latex
        cp *.cls $out/tex/latex
        cp dteklogo.pdf $out/tex/latex
      '';
      pname = name;
      tlType = "run";
    };
    dtek-tex = { pkgs = [ dtek-tex-pkg ]; };
    tex-dependencies = texlive.combine {
      inherit (texlive)
        collection-basic
        collection-xetex
	collection-fontsrecommended
        fontspec
	parskip
	fancyhdr
	graphics
	babel-swedish
	lastpage
	hyperref
	oberdiek
	url
	geometry
	etoolbox
	pdfpages
	tools
	tocloft
	;
      dtek-tex = dtek-tex;
    };
in stdenv.mkDerivation rec {
  name = "TeX-env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    tex-dependencies
  ];
}
