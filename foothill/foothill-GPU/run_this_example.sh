##########################################################################
# File Name: run_this_example.sh
# Author: Wenbin Jiang
# Created Time: 2019年03月29日 星期五 18时47分59秒
#########################################################################

#!/bin/bash
sfclean
nohup sfrun > nohup.out 2>&1 &
