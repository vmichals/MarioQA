#! /bin/bash

dt=case3
if [ ! -d ./model_${dt} ]; then
   mkdir -p ./model_${dt}
fi

stdbuf -oL th train.lua -start_from model_HardTemp/model_id9.t7 -clip_info_file data/clip_info_${dt}.json -qa_label_file data/qa_labels_${dt}.h5 -uni_gru_path data/pretrained_models/skipthought/uni_gru_params_${dt}.t7 -uni_gru_word2vec_path data/pretrained_models/skipthought/videoqa_uni_gru_word2vec_${dt}.t7 -num_step 2 -batch_size 16 -gpuid 0 -checkpoint_path model_${dt} 2>&1 | tee log_train_${dt}.log