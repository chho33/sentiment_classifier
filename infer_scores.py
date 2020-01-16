from keras.models import load_model
import pandas as pd
import numpy as np
from utils import * 

def inference(infer_data_path,model_dir):
    df = pd.read_csv(infer_data_path)
    x_test = df.utterance.values
    x_test_word_ids = texts_to_sequences(x_test)
    x_test_padded_seqs = pad_sequences(x_test_word_ids, maxlen=MAX_LEN)
    x_test_padded_seqs_split = get_split_list(x_test_padded_seqs,SPLIT_DIMS)
    
    model= load_model(model_dir)          
    print("model loaded")
    scores = model.predict(np.array(x_test_padded_seqs_split),batch_size=batch_size)
    return np.mean(scores)

if __name__ == '__main__':
    if args.d: infer_data_path = args.d
    if args.s: model_dir = args.s
    assert infer_data_path

    mean_score = inference(infer_data_path,model_dir)
    print("sentiment mean_score: ",mean_score)
    if args.l:
        with open(args.l,"a") as f:
            f.write("sent: %s\n"%mean_score)
