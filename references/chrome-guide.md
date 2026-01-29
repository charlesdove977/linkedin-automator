# Chrome Automation Guide

Tips and patterns for browser automation with Claude-in-Chrome.

---

## Setup

### Install Claude-in-Chrome

1. Install the Claude-in-Chrome browser extension
2. Enable it in Chrome extensions settings
3. Ensure it's running when you want to use automation

### Launch Claude Code with Chrome

Always start Claude Code with the `--chrome` flag:

```bash
claude --chrome
```

This enables the Chrome MCP tools.

### Verify Connection

Test the connection:
```
Use mcp__claude-in-chrome__tabs_context_mcp to check current tabs
```

If it works, you'll see a list of your open Chrome tabs.
If it fails, check that the extension is installed and enabled.

---

## Key Tools

### Tab Management

**Get current tabs:**
```
mcp__claude-in-chrome__tabs_context_mcp
```
Always call this first to understand the browser state.

**Create new tab:**
```
mcp__claude-in-chrome__tabs_create_mcp
```

### Navigation

**Go to URL:**
```
mcp__claude-in-chrome__navigate
url: "https://www.linkedin.com/..."
```

### Reading Pages

**Get page content:**
```
mcp__claude-in-chrome__read_page
```
Returns the page text/content for analysis.

**Get page snapshot:**
```
mcp__claude-in-chrome__browser_snapshot
```
Returns structured information about the page.

### Interactions

**Click element:**
```
mcp__claude-in-chrome__computer
action: click
target: [description of element]
```

**Type text:**
```
mcp__claude-in-chrome__form_input
```

**Find element:**
```
mcp__claude-in-chrome__find
```

---

## LinkedIn-Specific Patterns

### Logging In

LinkedIn requires manual login. If you see a login page:
```
Please log into LinkedIn in your browser, then let me know when you're ready to continue.
```

Never attempt to automate login or handle credentials.

### Connections Page

**URL:** `https://www.linkedin.com/mynetwork/invite-connect/connections/`

**Elements:**
- Connection cards with name, headline, profile link
- "Message" button next to each connection
- Scroll to load more connections

### Messaging

**URL:** `https://www.linkedin.com/messaging/`

**Elements:**
- Conversation list on left
- Unread indicators (dot or bold)
- Message compose area
- Send button

**Opening compose:**
- From connections page: Click "Message" button
- From profile: Click "Message" button
- From messaging: Click on conversation

### Posting

**URL:** `https://www.linkedin.com/feed/`

**Flow:**
1. Click "Start a post" button
2. Wait for compose modal
3. Click in text area
4. Type/paste content
5. Click "Post" button

### Connection Requests

**URL:** `https://www.linkedin.com/mynetwork/`

**Elements:**
- Suggestion cards with "Connect" button
- Optional "Add a note" in the modal
- 300 character limit for notes

---

## Common Issues & Solutions

### Tab Detachment

**Problem:** Tab becomes unresponsive or detaches
**Solution:**
1. Call `tabs_context_mcp` to get fresh state
2. Switch to the correct tab
3. Continue from there

### Element Not Found

**Problem:** Can't find button/element to click
**Solution:**
1. Use `read_page` to see current page content
2. Verify you're on the correct page
3. Try scrolling to load more content
4. Use `find` tool with different description

### Modal Not Opening

**Problem:** Click happens but modal doesn't appear
**Solution:**
1. Wait a moment (LinkedIn can be slow)
2. Try clicking again
3. Refresh page and retry
4. Navigate directly to alternative (e.g., profile page instead)

### Rate Limiting

**Problem:** LinkedIn shows warnings or blocks actions
**Solution:**
1. Stop immediately
2. Wait 24-48 hours
3. Reduce session sizes
4. Space out actions (2-3 seconds between)

### Logged Out

**Problem:** Redirected to login page
**Solution:**
1. Inform user to log in manually
2. Wait for confirmation
3. Resume from where you left off

---

## Best Practices

### Pacing

- Wait 2-3 seconds between actions
- Don't send more than 20-30 messages per session
- Space out connection requests throughout the day
- Take breaks between sessions

### Error Recovery

- Always save progress to tracking files
- If something fails, note it and move on
- Don't retry the same action more than twice
- Inform user of failures

### Session Management

- Get fresh tab context at start of each command
- Don't assume tab state persists
- Handle page loads explicitly
- Verify successful actions before logging

### User Communication

- Show what you're about to do before doing it
- Confirm success after actions
- Report errors clearly
- Provide options when things go wrong

---

## Troubleshooting Checklist

If Chrome automation isn't working:

1. [ ] Claude-in-Chrome extension installed?
2. [ ] Extension enabled in Chrome?
3. [ ] Claude Code launched with `--chrome` flag?
4. [ ] `tabs_context_mcp` returns results?
5. [ ] Correct tab selected/focused?
6. [ ] LinkedIn is logged in?
7. [ ] No rate limiting warnings?

If all else fails:
```
Let's try a manual approach. I'll tell you what to do and you perform the actions, then let me know when ready to continue.
```
