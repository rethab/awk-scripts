BEGIN{FS=""}NR>1&&$(x+1)=="#"{y++}{x=(x+3)%NF}END{print y}
