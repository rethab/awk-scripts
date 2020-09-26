#!/bin/awk -f
$0%3==0{s="fizz"}$0%5==0{s=s"buzz"}s{print s}!s{print$0}
