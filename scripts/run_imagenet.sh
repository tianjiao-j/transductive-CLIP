export CUDA_VISIBLE_DEVICES=0,1,2,3

use_softmax_features=True
#method='hard_em_dirichlet'
method='em_dirichlet'
######
# caltech101 food101 ucf101 flowers102 dtd eurosat fgvcaircraft oxfordpets sun397 stanfordcars 
for dataset in imagenet
do
  python main.py --opts batch_size 1 number_tasks 1 dataset ${dataset} shots 0 use_softmax_features ${use_softmax_features} method ${method} use_features True
  for shot in 16 #8 4 2 1
  do
  python main.py --opts shots ${shot} dataset ${dataset} batch_size 10 number_tasks 100 use_softmax_feature True backbone RN50
  done
done