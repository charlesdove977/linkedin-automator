# LinkedIn Outreach Setup

Interactive setup wizard for LinkedIn automation. Configures your profile, ICP, communication style, and activity preferences.

## Behavior

### Step 1: Verify Chrome Connection

First, check if Claude-in-Chrome is available:

```
Before we begin, let me verify your Chrome connection is working.
```

Use `mcp__claude-in-chrome__tabs_context_mcp` to check connection. If it fails:

```
Chrome connection not detected. To use LinkedIn automation:

1. Install the Claude-in-Chrome extension
2. Restart Claude Code with: claude --chrome
3. Run /linkedinoutreach again

Need help? See references/chrome-guide.md
```

If connected, continue to setup.

### Step 2: Profile Information

Ask these questions one at a time, waiting for each response:

1. **Name**: "What's your name?"
2. **Business**: "What's your business/company name?"
3. **What you do**: "In one sentence, what do you help people with?"
4. **Social links**: "Share your key links (website, YouTube, LinkedIn, etc.)"
5. **Booking link**: "What's your booking/calendar link? (or 'none')"

### Step 3: ICP (Ideal Customer Profile)

```
Now let's define who you want to connect with.
```

Ask:

1. **Target roles**: "What roles/titles are you targeting? (e.g., agency owners, founders, consultants)"
2. **Industries**: "What industries or niches? (e.g., marketing, legal, SaaS)"
3. **Company size**: "Any company size preference? (e.g., 2-50 employees, solopreneurs)"
4. **Pain points**: "What problems do your ideal clients have?"
5. **Skip criteria**: "Who should we always skip? (e.g., job seekers, students)"

### Step 4: Communication Style

```
Let's capture your voice so messages sound like you.
```

Ask:

1. **Tone**: "How would you describe your communication style? (e.g., casual, professional, direct, friendly)"
2. **Key phrases**: "Any phrases or words you commonly use?"
3. **Avoid**: "Anything you'd never say? (e.g., no emojis, no 'just checking in')"
4. **Sample**: "Share an example message you've sent that felt very 'you'"

### Step 5: Automation Mode

```
How much control do you want over each message?
```

Ask:

```
Do you want to approve each message before it's sent, or run fully autonomous?

1. Human-in-the-loop (Recommended) - Review and approve each message before sending
2. Fully autonomous - Send messages automatically without approval

Note: Autonomous mode is faster but you won't see messages before they go out.
```

**If Human-in-the-loop:**
- Show draft message for each prospect
- Wait for approval (Send/Edit/Skip)
- User controls pace and content

**If Fully autonomous:**
- Generate and send messages automatically
- Log all sent messages to tracking.md
- User can review afterward
- Still respects session limits and rate limiting

Store preference in config.md as `automation_mode: human` or `automation_mode: autonomous`

### Step 6: Activity Schedule

```
When do you want to do LinkedIn activities?
```

Ask:

1. **DM new connections**: "When do you want to send initial DMs? (e.g., 'mornings', 'Mon/Wed/Fri', 'daily')"
2. **Answer DMs**: "When do you want to reply to messages?"
3. **Connect with new people**: "When do you want to send connection requests?"
4. **Create posts**: "How often do you want to post? (e.g., 'weekly', '3x/week')"

### Step 7: Create Folder Structure

Create the `linkedin-automator/` folder in the user's working directory with this structure:

```
linkedin-automator/
├── config.md
├── outreach/
│   ├── strategy.md
│   └── tracking.md
├── dms/
│   ├── guidelines.md
│   └── tracking.md
├── connections/
│   └── tracking.md
└── content/
    └── tracking.md
```

Use templates from `templates/` folder, populated with collected info.

### Step 8: Summary

```
Setup complete! Your linkedin-automator folder is ready.

Profile: [Name] - [Business]
ICP: [Summary of targeting]
Voice: [Tone description]
Mode: [Human-in-the-loop / Fully autonomous]

Next steps:
- /dmconnections - Start reaching out to connections
- /answerdm - Reply to unread messages
- /connecticp - Grow your network

Your tracking files are in linkedin-automator/
```

## Config.md Structure

```markdown
# LinkedIn Automator Config

## Profile
- **Name**: {name}
- **Business**: {business}
- **What I do**: {description}

## Links
- Website: {website}
- LinkedIn: {linkedin}
- YouTube: {youtube}
- Booking: {booking_link}

## ICP (Ideal Customer Profile)

### Target
- **Roles**: {roles}
- **Industries**: {industries}
- **Company size**: {company_size}
- **Pain points**: {pain_points}

### Skip Criteria
{skip_criteria}

## Communication Style

### Voice
- **Tone**: {tone}
- **Key phrases**: {phrases}
- **Avoid**: {avoid}

### Sample Message
{sample_message}

## Schedule
- **DM connections**: {dm_schedule}
- **Answer DMs**: {answer_schedule}
- **Connect**: {connect_schedule}
- **Post**: {post_schedule}

## Automation Mode
- **Mode**: {automation_mode}
  - `human` = Review each message before sending
  - `autonomous` = Send automatically, review afterward
```

## Error Handling

- If user wants to skip a section, use sensible defaults
- If Chrome disconnects during setup, save progress and inform user
- If folder already exists, ask: "Config already exists. Update it or start fresh?"
