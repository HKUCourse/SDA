now=$(date +"%Y%m%d_%H%M%S")

output_path='exp/cifar100_4label_seed4_1card'

mkdir -p $output_path

/usr/bin/python3 -m torch.distributed.launch \
    --nproc_per_node=$1 \
    --master_addr=localhost \
    --master_port=$2 \
    fixmatch.py \
    --dataset cifar100 --label_per_class 4 --seed 4 --DA --checkpoint exp/cifar100_4label_seed4_1card/latest.pth \
    --output_path $output_path --port $2 2>&1 | tee $output_path/$now.log