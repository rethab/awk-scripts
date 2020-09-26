# FizzBuzz in AWK
*fizzbuzz is a classic programming interview task. this script demonstrates how the problem can be solved in a few characters of awk*

## What is FizzBuzz
The typical tasks is formulated like the following.

> Implement a function that,
>   - when givien a number that is divisible by 3, prints fizz
>   - when givien a number that is divisible by 5, prints buzz
>   - when givien a number that is divisible both, prints fizzbuzz
>   - otherwise print the number

## Run the script
Single number:
```bash
$> echo "15" | ./fizzbuzz.awk
fizzbuzz
```

Multiple:
```bash
$> for i in $(seq 10 16); do echo $i | ./fizzbuzz.awk; done
buzz
11
fizz
13
14
fizzbuzz
16
```

## Explanation
In order to understand what happens in [fizzbuzz.awk](fizzbuzz.awk), let's add some spaces and break it up into multiple lines:

```awk
# if the number is divisible by 3, set s to 'fizz'
$0 % 3 == 0 { s="fizz" }

# if the number is divisible by 5, append 'buzz' to s
# note that if the number is not divisible by 3, we are appending to an uninitialized s, but that works just fine
$0 % 5 == 0 { s=s"buzz" }

# if s is set, print s
s           { print s   }

# if s is not set, print the number
!s          { print $0  }
```
