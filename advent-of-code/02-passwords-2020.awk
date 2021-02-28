BEGIN{FS="[- :]"}gsub($3,$3,$5)>=$1&&gsub($3,$3,$5)<=$2{x++}END{print x}
