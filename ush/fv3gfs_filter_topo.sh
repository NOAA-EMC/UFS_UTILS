#!/bin/bash
set -ax

#-----------------------------------------------------------------------------------------
#
# Script name: fv3gfs_filter_topo.sh
# -----------
#
# Description: Filters the topography.
# -----------
#
#-----------------------------------------------------------------------------------------

if [ $# -ne 4 ]; then
   set +x
   echo
   echo "FATAL ERROR: Usage: $0 resolution grid_dir orog_dir out_dir"
   echo
   set -x
   exit 1
fi

if [ $gtype = stretch ] || [ $gtype = regional_gfdl ]; then
  stretch=$stretch_fac
else
  stretch=1.0
fi

export res=$1 
export griddir=$2
export orodir=$3
export outdir=$4

executable=$exec_dir/filter_topo
if [ ! -s $executable ]; then
  set +x
  echo
  echo "FATAL ERROR: ${executable} does not exist"
  echo
  set -x
  exit 1 
fi

export mosaic_grid=C${res}_mosaic.nc
export topo_file=oro.C${res}

if [ ! -s $outdir ]; then mkdir -p $outdir ;fi
cd $outdir ||exit 8

cp $griddir/$mosaic_grid .
cp $griddir/C${res}_grid.tile?.nc .
cp $orodir/${topo_file}.tile?.nc .
cp $executable .

regional=.false.
if [ $gtype = regional_gfdl ] || [ $gtype = regional_esg ] ; then
  regional=.true.
fi

cat > input.nml <<EOF
&filter_topo_nml
  grid_file = $mosaic_grid
  topo_file = $topo_file
  mask_field = "land_frac"
  regional = $regional 
  stretch_fac = $stretch
  res = $res
  /
EOF

$APRUN $executable

if [ $? -ne 0 ]; then
  set +x
  echo
  echo "FATAL ERROR running filter topography for C$res "
  echo
  set -x
  exit 1
else
  set +x
  echo
  echo "Successfully ran filter topography for C$res"
  echo
  set -x
  exit 0
fi

exit
