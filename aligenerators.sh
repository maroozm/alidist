package: AliGenerators
tag: "vAN-20220727"
version: "v%(year)s%(month)s%(day)s"
source: https://github.com/alisw/AliGenerators
requires:
  - AMPT
  - CRMC:(?!osx)
  - DPMJET
  - EPOS:(?!osx)
  - Herwig:(?!osx)
  - JEWEL
  - POWHEG
  - pythia
  - pythia6
  - SHERPA
  - ThePEG
  - AGILe:(?!osx)
  - Sacrifice
  - aligenmc
  - FONLL
  - Therminator2
  - Rivet
  - lhapdf-pdfsets
  - JETSCAPE
build_requires:
  - EPOS-test:(?!osx)
---
#!/bin/bash -ex

# Modulefile
MODULEDIR="$INSTALLROOT/etc/modulefiles"
MODULEFILE="$MODULEDIR/$PKGNAME"
mkdir -p "$MODULEDIR"
case $ARCHITECTURE in
  osx*)
cat > "$MODULEFILE" <<EoF
#%Module1.0
proc ModulesHelp { } {
  global version
  puts stderr "ALICE Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
}
set version $PKGVERSION-@@PKGREVISION@$PKGHASH@@
module-whatis "ALICE Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
# Dependencies
module load BASE/1.0 \
  aligenmc/$ALIGENMC_VERSION-$ALIGENMC_REVISION \
  AMPT/$AMPT_VERSION-$AMPT_REVISION \
  DPMJET/$DPMJET_VERSION-$DPMJET_REVISION \
  JEWEL/$JEWEL_VERSION-$JEWEL_REVISION \
  POWHEG/$POWHEG_VERSION-$POWHEG_REVISION \
  pythia/$PYTHIA_VERSION-$PYTHIA_REVISION \
  pythia6/$PYTHIA6_VERSION-$PYTHIA6_REVISION \
  Rivet/$RIVET_VERSION-$RIVET_REVISION \
  Sacrifice/$SACRIFICE_VERSION-$SACRIFICE_REVISION \
  SHERPA/$SHERPA_VERSION-$SHERPA_REVISION \
  ThePEG/$THEPEG_VERSION-$THEPEG_REVISION \
  Therminator2/$THERMINATOR2_VERSION-$THERMINATOR2_REVISION \
  JETSCAPE/$JETSCAPE_VERSION-$JETSCAPE_REVISION
EoF
  ;;
  *)
cat > "$MODULEFILE" <<EoF
#%Module1.0
proc ModulesHelp { } {
  global version
  puts stderr "ALICE Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
}
set version $PKGVERSION-@@PKGREVISION@$PKGHASH@@
module-whatis "ALICE Modulefile for $PKGNAME $PKGVERSION-@@PKGREVISION@$PKGHASH@@"
# Dependencies
module load BASE/1.0 \
  AGILe/$AGILE_VERSION-$AGILE_REVISION \
  aligenmc/$ALIGENMC_VERSION-$ALIGENMC_REVISION \
  AMPT/$AMPT_VERSION-$AMPT_REVISION \
  CRMC/$CRMC_VERSION-$CRMC_REVISION \
  DPMJET/$DPMJET_VERSION-$DPMJET_REVISION \
  JEWEL/$JEWEL_VERSION-$JEWEL_REVISION \
  Herwig/$HERWIG_VERSION-$HERWIG_REVISION \
  POWHEG/$POWHEG_VERSION-$POWHEG_REVISION \
  pythia/$PYTHIA_VERSION-$PYTHIA_REVISION \
  pythia6/$PYTHIA6_VERSION-$PYTHIA6_REVISION \
  Rivet/$RIVET_VERSION-$RIVET_REVISION \
  Sacrifice/$SACRIFICE_VERSION-$SACRIFICE_REVISION \
  SHERPA/$SHERPA_VERSION-$SHERPA_REVISION \
  ThePEG/$THEPEG_VERSION-$THEPEG_REVISION \
  Therminator2/$THERMINATOR2_VERSION-$THERMINATOR2_REVISION \
  JETSCAPE/$JETSCAPE_VERSION-$JETSCAPE_REVISION
EoF
  ;;
esac
