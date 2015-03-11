with (import <nixpkgs> {}).pkgs;
let pkg = haskellngPackages.callPackage
            ({ mkDerivation, base, blaze-markup, cabal-install, git, semigroups
             , stdenv, text, tasty, tasty-hunit, tasty-quickcheck }:
             mkDerivation {
               pname = "titlecase";
               version = "0.1.0.0";
               src = ./.;
               buildDepends = [ base blaze-markup semigroups text ];
               testDepends =
			     [ base semigroups tasty tasty-hunit tasty-quickcheck text ];
               buildTools = [ cabal-install git ];
               description = "Convert words to title case";
               license = stdenv.lib.licenses.bsd3;
             }) {};
in
  pkg.env
