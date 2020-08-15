BEGIN {
  FS=";"
  hours=0
  minutes=0
}
NF==3 {
  _=0 # track if something is matched
}
NF==3 && match($2, /^[[:digit:]]+h$/) {
  _=1
  hours+=substr($2, RSTART, RLENGTH-1)
}
NF==3 && match($2, /^[[:digit:]]+:[[:digit:]]+h$/) {
  _=1
  colon=index($2, ":")
  hours+=substr($2, RSTART, colon-1)
  minutes+=substr($2, colon+1, RLENGTH-colon-1)
}
NF==3 && !_ {
  printf("%d: Invalid format %s\n", NR, $2)
  exit
}
1 {
  if (minutes >= 60) {
    hours+=1
    minutes-=60
  }
}
END {
  printf("%d hours, %d minutes\n", hours, minutes)
}
