BEGIN{RS=""}{_=0;for(i=1;i<=NF;i++)if(match($i,/([ebi]yr|ecl|pid|hcl|hgt)/)&&_++==6)x++}END{print x}
