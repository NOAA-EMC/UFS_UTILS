#%Module#####################################################
## Build and run module for Odin
#############################################################

module load craype/2.6.2
module load craype-ivybridge
module load PrgEnv-intel
module swap intel/19.0.5.281
module load cray-mpich/7.7.10
module load cray-libsci
module load cray-netcdf-hdf5parallel
module load cray-parallel-netcdf
module load cray-hdf5-parallel

setenv NETCDF /opt/cray/pe/netcdf-hdf5parallel/4.6.3.2/INTEL/19.0

#module use -a /oldscratch/ywang/external/modulefiles
#module use /oldscratch/ywang/external/NCEPLIBS_SRW/modules
module use /oldscratch/ywang/external/NCEPLIBS_SRWv2.0/modules
module load w3nco
module load w3emc
module load sp
module load ip
module load bacio
module load sigio
module load sfcio
module load nemsio
module load nemsiogfs
module load gfsio
module load landsfcutil
module load g2
module load wgrib2

#module load esmf/8.0.0
#setenv ESMFMKFILE /oldscratch/ywang/external/NCEPLIBS_SRW/lib64/esmf.mk
setenv ESMFMKFILE /oldscratch/ywang/external/NCEPLIBS_SRWv2.0/lib64/esmf.mk

setenv CMAKE_Fortran_COMPILER ftn
setenv CMAKE_C_COMPILER cc

#setenv WGRIB2_ROOT /oldscratch/ywang/external/NCEPLIBS_SRWv2.0/wgrib2-2.0.8
