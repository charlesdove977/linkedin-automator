# DM Connections

Send personalized DMs to your existing LinkedIn connections. Warm outreach, not cold spam.

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

Load config to get ICP criteria, voice settings, user info, and **automation_mode**.

**Check automation_mode:**
- If `human` → Show each message for approval before sending
- If `autonomous` → Generate and send messages automatically

### Step 2: Load Tracking Data (MANDATORY)

**This step is non-negotiable. Always check tracking before any outreach.**

1. Read `linkedin-automator/outreach/tracking.md`
2. Build a "do not contact" list of all previously messaged connections:
   - Extract all names and profile URLs from existing entries
   - Note the date of last contact for each
3. Store this list in memory for cross-referencing during evaluation

```
Loaded tracking data: X connections previously messaged.
Ready to filter duplicates.
```

If tracking file doesn't exist or is empty:
```
No previous outreach logged. Starting fresh tracking.
```

### Step 3: Session Size

```
How many connections do you want to message this session?

1. Quick session (5 messages)
2. Standard session (10 messages)
3. Deep session (20 messages)
4. Manual (I'll say when to stop)
```

### Step 4: Navigate to Connections

Use Chrome automation:

1. `mcp__claude-in-chrome__tabs_context_mcp` - Get current tabs
2. `mcp__claude-in-chrome__navigate` - Go to `https://www.linkedin.com/mynetwork/invite-connect/connections/`
3. Wait for page load with `mcp__claude-in-chrome__read_page`

### Step 5: Process Each Connection

For each connection on the page:

#### 5a. Read Profile

- Get name, headline, profile link from the connections list
- Use `mcp__claude-in-chrome__read_page` to extract connection details
- If needed, click through to full profile for more context

#### 5b. Evaluate Fit

**FIRST: Check against tracking data loaded in Step 2.**
- If connection name or profile URL matches any entry in the "do not contact" list → **Auto-skip** with note: `Skipped [Name] - already messaged on [date]`

Using criteria from `references/filtering-criteria.md` and user's ICP:

**Strong fit signals:**
- Role matches target (owner, founder, consultant, etc.)
- Industry matches ICP
- Has business indicators in headline
- Recent activity suggests engagement

**Skip signals:**
- Under 25 (junior/entry level)
- Employee without decision-making power
- Job seeker ("seeking opportunities", "open to work")
- Vague profiles ("visionary", "thought leader" with no substance)
- **IN TRACKING LIST** (already messaged - caught by pre-check above)

Present evaluation:

```
[Name] - [Headline]
Rating: Strong fit / Worth a shot / Skip
Reason: [Why this rating]
```

If Skip, move to next. Otherwise continue.

#### 5c. Generate Opener

Using patterns from `references/opener-patterns.md` and user's voice:

**Opener rules:**
- 2-3 sentences max
- Reference something specific (their role, business, headline)
- End with open-ended question
- Never pitch in first message
- Match user's configured tone

#### 5d. Send or Approve (Based on Mode)

**If automation_mode = human:**

```
Draft message to [Name]:

"Hey [Name] — [personalized opener referencing their profile]. [Open-ended question]?"

[Send] [Edit] [Skip] [View profile first]
```

- **Send**: Use Chrome to click Message button, type text, send
- **Edit**: Let user modify the draft, then send
- **Skip**: Move to next connection
- **View profile**: Navigate to full profile, return to draft after

**If automation_mode = autonomous:**

- Generate message using opener patterns and user voice
- Send immediately via Chrome (no approval prompt)
- Log to tracking.md
- Brief status update: `Sent to [Name] ✓`
- Continue to next connection
- Respect rate limiting (2-3 second pause between sends)

#### 5e. Log to Tracking

After each sent message, append to `linkedin-automator/outreach/tracking.md`:

```markdown
## [Date]

### [Name] - [Headline]
- **Profile**: [LinkedIn URL]
- **Rating**: [Strong fit/Worth a shot]
- **Message sent**: "[The opener]"
- **Status**: Sent - awaiting reply
```

### Step 6: Session Summary

After completing session (or user says stop):

```
Session complete!

Messages sent: X
- Strong fits: X
- Worth a shot: X
Skipped: X

Would you like to save any learnings from this session?
```

If yes, ask what patterns worked or didn't, append to `linkedin-automator/outreach/strategy.md`:

```markdown
## [Date] Session Learnings

- [Pattern that worked]
- [Segment that responded well]
- [Adjustment to make]
```

## Chrome Automation Flow

```
1. Navigate to connections page
2. Read page to get connection list
3. For each connection:
   a. Read their info from the list
   b. Click "Message" button next to their name
   c. Wait for compose modal to open
   d. Type message in the text field
   e. Click Send button
   f. Close modal / move to next
4. Scroll to load more connections as needed
```

## Error Handling

- **Chrome disconnected**: Save progress to tracking, inform user to reconnect
- **LinkedIn logged out**: Prompt user to log in manually, then continue
- **Rate limited**: Stop session, warn user, suggest waiting 24 hours
- **Message modal fails**: Close and retry, or navigate to profile to message directly
- **Connection already messaged**: Check tracking.md, skip duplicates
