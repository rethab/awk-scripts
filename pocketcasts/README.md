# Pocket Casts Statistics
*based on an export from pocketcasts, this script sums the playing time by podcast. i use this to figure out which podcasts i listen to the most. based on this, I donate to or create subscriptions with the respective podcast.*


Link to [Pocket Casts](https://www.pocketcasts.com/)

## Notes
Unfortunately, pocket casts does not offer an offical way to export the history. While it is possible to export some data, that history is limited to the 100 most recent plays. Therefore, you'll have to run this export periodically.

## Sample Output
```bash
$> ./sum-by-title.awk history.json 
title;minutes
Super Duper Podcast;98
Mega Awesome Podcast;76
```

## How To
- export data from pocket casts via curl
  - login on their website
  - go to profile --> listening history
  - open network tab, look for request to `https://api.pocketcasts.com/user/history`
  - copy as curl
  - run `curl ... > history.json`
- run this script
  - `./sum-by-title.awk history.json`
  - note that you can specify multiple files
