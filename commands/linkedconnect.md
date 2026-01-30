# Connect ICP

Send strategic connection requests to people matching your Ideal Customer Profile.

## Prerequisites

- Chrome connection active (`claude --chrome`)
- Setup completed (`/linkedinoutreach`)
- `linkedin-automator/config.md` exists

## Behavior

### Step 1: Verify Setup

Check for `linkedin-automator/config.md`. If missing:

```
Setup not found. Run /linkedinoutreach first to configure your profile.
```

Load config for ICP criteria and **automation_mode**.

**Check automation_mode:**
- If `human` → Show each profile for approval before connecting
- If `autonomous` → Send connection requests automatically for ICP matches

### Step 2: Load Tracking Data (MANDATORY)

**This step is non-negotiable. Always check tracking before sending connection requests.**

1. Read `linkedin-automator/connections/tracking.md`
2. Build a "do not request" list of all previously requested connections:
   - Extract all names and profile URLs from existing entries
   - Note status (pending, accepted, declined)
3. Check weekly sends count
4. Store this list in memory for cross-referencing during evaluation

```
Loaded tracking data:
- X connections previously requested
- This week: Y/100 requests sent
- Remaining quota: Z

Ready to filter duplicates.
```

If tracking file doesn't exist or is empty:
```
No previous connection requests logged. Starting fresh tracking.
```

**Weekly limit check:**
If over 80% of limit:
```
Warning: You're at X% of your weekly limit.
Consider waiting until [reset date] or proceeding carefully.

Continue anyway? [Yes] [Wait]
```

### Step 3: Session Size

```
How many connection requests this session?

1. Conservative (10 requests)
2. Standard (25 requests)
3. Aggressive (50 requests)
4. Use remaining weekly quota (Y requests)
```

### Step 4: Navigate to Prospects

Options for finding prospects:

```
Where do you want to find prospects?

1. "People you may know" suggestions
2. Search by keywords/title
3. Members of a specific group
4. Followers of a specific person/company
```

Based on choice:

- **Suggestions**: Navigate to `https://www.linkedin.com/mynetwork/`
- **Search**: Ask for keywords, navigate to search results
- **Group**: Ask for group name/URL
- **Followers**: Ask for person/company

### Step 5: Process Each Profile

For each prospect:

#### 5a. Read Profile

Use `mcp__claude-in-chrome__read_page` to extract:
- Name
- Headline
- Location
- Mutual connections
- Recent activity (if visible)

#### 5b. Evaluate Against ICP

**FIRST: Check against tracking data loaded in Step 2.**
- If profile name or URL matches any entry in the "do not request" list → **Auto-skip** with note: `Skipped [Name] - already requested on [date] (status: [pending/accepted/declined])`

Using `references/filtering-criteria.md` and user's ICP:

**Connect signals:**
- Role matches target criteria
- Industry aligns
- Has business indicators
- Mutual connections add credibility
- Recent activity shows engagement

**Skip signals:**
- Doesn't match ICP
- No clear business signal
- Profile looks inactive
- Already connected (visible on profile)
- **IN TRACKING LIST** (already requested - caught by pre-check above)

#### 5c. Connect or Approve (Based on Mode)

**If automation_mode = human:**

```
[Name] - [Headline]
[Location] · [X mutual connections]

Rating: Strong match / Possible match / Skip
Reason: [Why this rating]

[Connect] [Connect with note] [Skip] [View full profile]
```

- **Connect**: Click Connect button (no note)
- **Connect with note**: Generate personalized note, then send
- **Skip**: Move to next prospect
- **View full profile**: Navigate to profile, then return

**If automation_mode = autonomous:**

- If Strong match or Possible match → Send connection request automatically
- Skip profiles that don't match ICP
- Add personalized note for Strong matches, no note for Possible matches
- Log to tracking.md
- Brief status update: `Connected with [Name] ✓`
- Continue to next prospect
- Respect rate limiting (2-3 second pause between requests)

**Note generation rules (if adding note):**
- Under 300 characters (LinkedIn limit)
- Reference something specific (mutual connection, their work, shared interest)
- No pitch, just genuine connection reason
- Match user's tone

Note template:
```
Hey [Name] — [Specific reference to their profile/work]. Would love to connect and see what you're building.
```

#### 5d. Log to Tracking

After each request, append to `linkedin-automator/connections/tracking.md`:

```markdown
## Week of [Date]

### Requests Sent

| Date | Name | Headline | Note? | Status |
|------|------|----------|-------|--------|
| [date] | [Name] | [Headline] | Yes/No | Pending |
```

### Step 6: Session Summary

```
Session complete!

Requests sent: X
- With note: X
- Without note: X
Skipped: X

Weekly total: X/100
Remaining this week: Y

Note: New connections will appear in your network within 1-3 days.
Use /dmconnections to message them once they accept!
```

### Step 7: Weekly Reset

Track the week start date. When a new week begins:
- Archive previous week's data
- Reset counter
- Note acceptance rate from previous week

```markdown
## Week of [Previous Date] - Summary

- Requests sent: X
- Accepted: Y (Z%)
- Pending: W

---

## Week of [Current Date]

### Requests Sent
[New entries]
```

## Connection Note Examples

**For agency owners:**
```
Hey [Name] — saw you're running [agency type]. Always great to connect with fellow agency builders. What's your main focus these days?
```

**For founders:**
```
Hey [Name] — [Company] looks interesting. Love connecting with founders building in [space]. Would be great to exchange notes sometime.
```

**For consultants:**
```
Hey [Name] — your work in [specialty] caught my eye. Always looking to connect with others in the consulting world.
```

**With mutual connection:**
```
Hey [Name] — noticed we're both connected with [Mutual]. Small world! Would love to connect directly.
```

## Chrome Automation Flow

```
1. Navigate to prospect source (suggestions/search/etc.)
2. Read page to identify prospect cards
3. For each prospect:
   a. Read their profile info
   b. If connecting:
      - Click "Connect" button
      - If adding note: Click "Add a note", type note, click "Send"
      - If no note: Confirm send
   c. Wait 2-3 seconds before next
4. Scroll to load more prospects as needed
```

## Error Handling

- **Chrome disconnected**: Save progress, inform user
- **LinkedIn logged out**: Prompt user to log in
- **"Pending" shown**: Already sent request, skip
- **Connect button missing**: Already connected or can't connect, skip
- **Rate limited**: Stop immediately, warn user, suggest waiting 24-48 hours
- **Weekly limit reached**: Stop session, inform user of reset date
