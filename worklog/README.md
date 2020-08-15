# Worklog
*Given a worklog (csv) with the worked hours per day in a column, this script sums up the hours (and minutes).*

## Usage
```bash
awk -f worklog-sum.awk worklog.txt
```

(prints eg. *120 hours, 5 minutes*)

## Worklog Sample
```txt
2020-08-15;8h;worked on important features, did stuff, wrote docs
```


