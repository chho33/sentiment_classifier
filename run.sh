#!/bin/bash

# default
log_dir=$PWD/logs
data_dir=$PWD/data
model_dir=$PWD/saved_models
log_path=$log_dir/`date +%s`".log"
data_path=$data_dir/test.csv
model_path=$model_dir/Model07
mapping_path=$data_dir/char_mapping
mkdir -p $log_dir
mkdir -p $data_dir
mkdir -p $model_dir

for i in "$@"
do
case $i in
    -d=*|--data_path=*)
    DATA="${i#*=}"
    shift
    ;;
    -l=*|--log_path=*)
    LOG="${i#*=}"
    shift
    ;;
    -s=*|--model_path=*)
    SENT="${i#*=}"
    shift
    ;;
    -m=*|--mapping_path=*)
    MAP="${i#*=}"
    shift
    ;;
    *)
          # unknown option
    ;;
esac
done

if [ -n "$DATA" ]; then
    data_path=$DATA
fi

if [ -n "$LOG" ]; then
    log_path=$LOG
fi

if [ -n "$SENT" ]; then
    model_path=$SENT
fi

if [ -n "$MAP" ]; then
    mapping_path=$MAP
fi

python infer_scores.py --data_path=$data_path --log_path=$log_path --model_path=$model_path --mapping_path=$mapping_path
