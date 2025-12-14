# Rovr

Fetch PRs
```
gh pr list --repo NSPC911/rovr --json number,title,additions,deletions | jq -r '.[] | "+ \(.additions) - \(.deletions), PR #\(.number), \(.title)"'

gh pr list --repo NSPC911/rovr --state merged --json number,title,additions,deletions | jq -r '.[] | "+ \(.additions) - \(.deletions), PR #\(.number), \(.title)"'
```

# PR data
```
REPO="magic-human-pr-review-data/superfile"
ID=58

gh api --paginate "repos/$REPO/pulls/$ID/comments" --jq '.[].body' > inline_${ID}.txt; wc -l inline_${ID}.txt

gh pr view $ID --repo "$REPO" --json comments --jq '.comments.[].body' > general_${ID}.txt; wc -l general_${ID}.txt
```
