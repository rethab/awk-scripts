BEGIN{FS="[- :]"}_=gsub($3,"",$5){}_>=$1&&_<=$2{x++}END{print x}
