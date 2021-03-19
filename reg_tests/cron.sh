#!/bin/bash

export MAILTO="kyle.gerheiser@noaa.gov"

export WORK_DIR=/work/noaa/stmp/gkyle/reg-tests
export UFS_UTILS_HOME_DIR=$PWD/..
export PROJECT_CODE=nems
export MACHINE_ID=orion
export QUEUE=batch

mkdir -p ${WORK_DIR}
cd ${WORK_DIR}
rm -rf UFS_UTILS

cd ${WORK_DIR}

git clone --recursive https://github.com/kgerheiser/UFS_UTILS.git >> /dev/null 2>&1
cd UFS_UTILS
git checkout feature/auto-reg-tests

source sorc/machine-setup.sh

current_hash=$(git rev-parse HEAD)

if [[ -f "${WORK_DIR}/prev_hash.txt" ]]; then
    prev_hash=$(cat ${WORK_DIR}/prev_hash.txt)
    if [[ "$current_hash" == "$prev_hash" ]]; then
        echo `date`
        echo ""
        echo "UFS_UTILS has not changed since last time. Not building."
        echo "UFS_UTILS hash: ${current_hash}"
        exit 0
    fi
fi

./build_all.sh

cd fix
./link_fixdirs.sh emc $MACHINE_ID

cd ../reg_tests

for dir in chgres_cube grid_gen; do
    cd $dir
    ./driver.$target.sh

    # Wait for each test to finish before submitting more jobs
    while [ ! -f "summary.log" ]; do
        sleep 10
    done
    
    cd ..
done

for dir in snow2mdl global_cycle ice_blend; do
    cd $dir
    if [[ $MACHINE_ID == "hera" ]] || [[ $MACHINE_ID == "jet" ]] || [[ $MACHINE_ID == "orion" ]]; then
        sbatch -A ${PROJECT_CODE} ./driver.$target.sh
    elif [[ $MACHINE_ID == "wcoss_dell_p3" ]] || [[ $MACHINE_ID == "wcoss_cray" ]]; then
        cat ./driver.$target.sh | bsub -P ${PROJECT_CODE}
    fi
    cd ..
done


# Wait for jobs to complete by checking for summary.log
time=0
should_wait=true
while [ "$should_wait" == true ]; do
    sleep 10
    for dir in snow2mdl global_cycle ice_blend; do
        should_wait=false
        if [[ ! -f "${dir}/summary.log" ]]; then
            should_wait=true
            break
        fi
    done
done

echo "Commit hash: ${current_hash}" >> reg_test_results.txt
echo "" >> reg_test_results.txt

for dir in chgres_cube grid_gen global_cycle ice_blend snow2mdl; do
    success=true
    if grep -qi "FAILED" ${dir}/summary.log; then
        success=false
        echo "${dir} regression tests FAILED" >> reg_test_results.txt
    else
        echo "${dir} regression tests PASSED" >> reg_test_results.txt
    fi
done

if [[ "$success" == true ]]; then
    mail -s "UFS_UTILS Regression Tests PASSED on ${MACHINE_ID}" ${MAILTO} < reg_test_results.txt
else
    mail -s "UFS_UTILS Regression Tests FAILED on ${MACHINE_ID}" ${MAILTO} < reg_test_results.txt
fi

# Save current hash as previous hash for next time
echo $current_hash > ${WORK_DIR}/prev_hash.txt




