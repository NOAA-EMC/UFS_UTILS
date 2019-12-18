#!/bin/bash

set -x

MEMBER=$1

FIX_FV3=$UFS_DIR/fix
FIX_ORO=${FIX_FV3}/fix_fv3_gmted2010
FIX_AM=${FIX_FV3}/fix_am

date10=`$NDATE -6 $yy$mm$dd$hh`
yy_d=$(echo $date10 | cut -c1-4)
mm_d=$(echo $date10 | cut -c5-6)
dd_d=$(echo $date10 | cut -c7-8)
hh_d=$(echo $date10 | cut -c9-10)

YMDH=${yy}${mm}${dd}.${hh}0000

if [ ${MEMBER} == 'hires' ]; then
  CINP=C768
  CTAR=${CRES_HIRES}
  INPUT_DATA_DIR="${INPUT_DIR}/gdas.${yy_d}${mm_d}${dd_d}/${hh_d}/RESTART"
  OUTDIR=$OUTDIR/chgres.fv3.${MEMBER}.${yy}${mm}${dd}${hh}
else  
  CINP=C384
  CTAR=${CRES_ENKF}
  INPUT_DATA_DIR="${INPUT_DIR}/enkfgdas.${yy_d}${mm_d}${dd_d}/${hh_d}/mem${MEMBER}/RESTART"
  OUTDIR=$OUTDIR/chgres.fv3.mem${MEMBER}.${yy}${mm}${dd}${hh}
fi

rm -fr $OUTDIR
mkdir -p $OUTDIR
cd $OUTDIR

cat << EOF > fort.41

&config
 fix_dir_target_grid="${FIX_ORO}/${CTAR}/fix_sfc"
 mosaic_file_target_grid="${FIX_ORO}/${CTAR}/${CTAR}_mosaic.nc"
 orog_dir_target_grid="${FIX_ORO}/${CTAR}"
 orog_files_target_grid="${CTAR}_oro_data.tile1.nc","${CTAR}_oro_data.tile2.nc","${CTAR}_oro_data.tile3.nc","${CTAR}_oro_data.tile4.nc","${CTAR}_oro_data.tile5.nc","${CTAR}_oro_data.tile6.nc"
 mosaic_file_input_grid="${FIX_ORO}/${CINP}/${CINP}_mosaic.nc"
 orog_dir_input_grid="${FIX_ORO}/${CINP}"
 orog_files_input_grid="${CINP}_oro_data.tile1.nc","${CINP}_oro_data.tile2.nc","${CINP}_oro_data.tile3.nc","${CINP}_oro_data.tile4.nc","${CINP}_oro_data.tile5.nc","${CINP}_oro_data.tile6.nc"
 data_dir_input_grid="${INPUT_DATA_DIR}"
 atm_core_files_input_grid="${YMDH}.fv_core.res.tile1.nc","${YMDH}.fv_core.res.tile2.nc","${YMDH}.fv_core.res.tile3.nc","${YMDH}.fv_core.res.tile4.nc","${YMDH}.fv_core.res.tile5.nc","${YMDH}.fv_core.res.tile6.nc","${YMDH}.fv_core.res.nc"
 atm_tracer_files_input_grid="${YMDH}.fv_tracer.res.tile1.nc","${YMDH}.fv_tracer.res.tile2.nc","${YMDH}.fv_tracer.res.tile3.nc","${YMDH}.fv_tracer.res.tile4.nc","${YMDH}.fv_tracer.res.tile5.nc","${YMDH}.fv_tracer.res.tile6.nc"
 vcoord_file_target_grid="${FIX_AM}/global_hyblev.l65.txt"
 sfc_files_input_grid="${YMDH}.sfc_data.tile1.nc","${YMDH}.sfc_data.tile2.nc","${YMDH}.sfc_data.tile3.nc","${YMDH}.sfc_data.tile4.nc","${YMDH}.sfc_data.tile5.nc","${YMDH}.sfc_data.tile6.nc"
 cycle_mon=$mm
 cycle_day=$dd
 cycle_hour=$hh
 convert_atm=.true.
 convert_sfc=.true.
 convert_nst=.true.
 tracers="sphum","liq_wat","o3mr","ice_wat","rainwat","snowwat","graupel"
 tracers_input="sphum","liq_wat","o3mr","ice_wat","rainwat","snowwat","graupel"
/
EOF

mpirun $UFS_DIR/exec/chgres_cube.exe

exit

# Note, model does not recognize vertical velocity when using warm restart
# files as input to chgres.  For now, zero it out using ncap utility.

for tile in 'tile1' 'tile2' 'tile3' 'tile4' 'tile5' 'tile6'
do
  ncap -s "w=w*0" out.atm.${tile}.nc gfs_data.${tile}.nc
  rm -f out.atm.${tile}.nc
  mv out.sfc.${tile}.nc  sfc_data.${tile}.nc 
done

exit
