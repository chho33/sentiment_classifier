## Pre-Request (execute first to download and install dependencies):
- python version: 3.6 up
- execute `pip install -r requirements.txt`

- Please download the trained model and put them into correct directory manually as below:
> [sentiment model](https://drive.google.com/open?id=112GPe7_tIoqKQwcgiXBgh6FeFPn7-ZK8) 
```
mkdir saved_models
mv Model07.tar.gz saved_models;
cd saved_models;
tar zxf Model07.tar.gz; rm Model07.tar.gz;
```
- Prepare a file we want to evaluate as the format in `data/test.csv`, and put it in the `data` directory. *the file must contain the "utterance" header. 

## Usage:
- `./run.sh [-d=$data_path|--data_path=$data_path] [-l=$log_path|--log_path=$log_path] [-s=$model_path|--sent_model_path=$sent_model_path]` (the default of $data_path, $log_path and $sent_model_path are: ./data/test.csv, ./logs/\`date +%s\`.log and ./saved_models/Model07)
- example: `./run.sh -d=data/test_neg.csv -l=logs/test_neg.log`
##### after ./run.sh executed, the log will dump in ./logs directory.

