# Answer DM

Reply to unread LinkedIn messages with contextual, on-brand responses.

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

Load config for voice settings, response guidelines, and **automation_mode**.

**Check automation_mode:**
- If `human` → Show each reply for approval before sending
- If `autonomous` → Generate and send replies automatically

### Step 2: Load Tracking Data (MANDATORY)

**This step is non-negotiable. Always check tracking before processing DMs.**

1. Read `linkedin-automator/dms/tracking.md`
2. Build a conversation history reference:
   - Extract all names and conversation types from existing entries
   - Note last interaction date and status for each
   - Identify any flagged conversations (stale, archived, cold pitch)
3. Store this context for informed responses

```
Loaded DM tracking: X conversations logged.
Ready to cross-reference history.
```

If tracking file doesn't exist or is empty:
```
No previous DM history logged. Starting fresh tracking.
```

### Step 3: Navigate to Messages

Use Chrome automation:

1. `mcp__claude-in-chrome__tabs_context_mcp` - Get current tabs
2. `mcp__claude-in-chrome__navigate` - Go to `https://www.linkedin.com/messaging/`
3. Wait for page load

### Step 4: Identify Unread Conversations

Use `mcp__claude-in-chrome__read_page` to find conversations with unread indicators.

```
Found X unread conversations. Let's go through them.
```

### Step 5: Process Each Conversation

For each unread conversation:

#### 5a. Read Conversation History

- Click on the conversation
- Read the full message thread for context
- Note who they are (check their headline/profile)

#### 5b. Cross-Reference Tracking & Classify

**FIRST: Check against tracking data loaded in Step 2.**
- If conversation exists in tracking, note previous context (last reply, status, type)
- Use history to inform response tone and continuity
- Flag if previously marked as cold pitch or archived

Using criteria from `references/dm-guidelines.md`:

| Type | Description | Response Style |
|------|-------------|----------------|
| **First response** | They replied to your opener | Excited, continue thread |
| **Ongoing** | Multi-message conversation | Build on previous exchange |
| **Booking request** | They want to meet/call | Provide booking link |
| **Cold pitch to us** | Someone selling to you | Polite decline or ignore |
| **Stale** | No reply in 14+ days | Consider archiving |

Present classification (include tracking context if available):

```
[Name] - [Their headline]
Type: [Classification]
Last message from them: "[Preview of their message]"
```

#### 5c. Generate Response

Using `references/dm-guidelines.md` and user's voice:

**Response rules:**
- Acknowledge what they said specifically
- Share something personal/relatable
- End with open-ended question (keeps conversation going)
- If they show pain points → soft mention of booking link
- Match user's configured tone and key phrases

For cold pitches:

```
This looks like a cold pitch. Options:
1. Skip (mark as read)
2. Polite decline
3. Actually engage (if interesting)
```

#### 5d. Send or Approve (Based on Mode)

**If automation_mode = human:**

```
Reply to [Name]:

"[Draft response following guidelines]"

[Send] [Edit] [Skip]
```

- **Send**: Type response and send via Chrome
- **Edit**: Let user modify, then send
- **Skip**: Mark as read, move to next

**If automation_mode = autonomous:**

- Generate reply using dm-guidelines and user voice
- Send immediately via Chrome (no approval prompt)
- Log to tracking.md
- Brief status update: `Replied to [Name] ✓`
- Continue to next conversation
- Skip cold pitches automatically (log as skipped)

#### 5e. Log to Tracking

After each reply, update `linkedin-automator/dms/tracking.md`:

```markdown
## [Date]

### [Name] - [Headline]
- **Conversation type**: [Classification]
- **Their message**: "[What they said]"
- **My reply**: "[What we sent]"
- **Status**: Active conversation
```

### Step 6: Handle Stale Conversations

After processing unreads, check for stale conversations:

```
Found X conversations with no reply in 14+ days:
- [Name 1] - last message [date]
- [Name 2] - last message [date]

Archive these as completed?
```

If yes, move to "Archived" section in tracking.md.

### Step 7: Session Summary

```
Session complete!

Replies sent: X
- First responses: X
- Ongoing: X
- Booking requests: X
Skipped (cold pitches): X
Archived (stale): X

Would you like to save any response patterns that worked well?
```

If yes, append to `linkedin-automator/dms/guidelines.md` Learning Log:

```markdown
## [Date] Session Learnings

- Phrase that got good engagement: "[phrase]"
- Topic that resonated: [topic]
- Adjustment to make: [note]
```

## Response Templates

### First Response (they replied to opener)
```
Hey [Name] — [acknowledge their reply]. [Share related experience/thought]. [Open-ended follow-up question]?
```

### Ongoing Conversation
```
[Acknowledge what they said]. [Add value or share perspective]. [Question to continue thread]?
```

### Booking Request
```
[Express enthusiasm]. Here's my calendar: [booking_link]. [Open question about their availability/preferences]?
```

### Polite Decline (for pitches)
```
Appreciate you reaching out! Not a fit for me right now, but best of luck with [their thing].
```

## Error Handling

- **Chrome disconnected**: Save progress, inform user
- **LinkedIn logged out**: Prompt user to log in
- **Message send fails**: Retry once, then skip with note
- **Conversation not found**: Skip, note in tracking
