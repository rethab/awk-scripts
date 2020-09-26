#!/usr/bin/awk -f

BEGIN               { found_played=0; found_title=0; }
$1 ~ /playedUpTo/   { found_played=1; played=substr($2, 1, length($2)-1); }
$1 ~ /podcastTitle/ {
  found_title=1;
  colon=index($0, ":");
  len=length($0);
  if (colon + 4 >= len) {
    title="";
    printf "WARN: %s:%d empty title\n", FILENAME, NR;
  } else {
    title=substr($0, colon+3, length($0)-colon-4);
  }
}
$1 ~ /\}/ && (found_played || found_title) {
  if (found_played != found_title) {
    printf "ERROR: %s:%d played or title not found\n", FILENAME, NR
    exit 1;
  } else if (title != "") {
    if (! (title in sums)) { sums[title] = 0; }
    sums[title] += played;
    found_played=0;
    found_title=0;
  }
}
END                 {
  print "title;minutes"
  for (title in sums) {
    printf "%s;%d\n", title, sums[title] / 60
  }
}
