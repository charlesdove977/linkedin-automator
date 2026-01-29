# LinkedIn Automator - PRD

**Plugin Name:** linkedin-automator
**Repo:** charlieautomates/linkedin-automator
**Description:** Automated LinkedIn outreach for Claude Code. Warm DM connections, reply to messages, build relationships, and grow your network — all through natural conversation, not spam.

---

## User Stories

### Setup & Configuration

- [x] **US-1: Interactive Setup Wizard**
  As a user, I want to run `/linkedinoutreach` to configure my profile so the plugin knows my identity, ICP, voice, and preferences.

  **Acceptance Criteria:**
  - Prompts for name, business name, what I do
  - Prompts for ICP (ideal customer profile) with detailed targeting criteria
  - Prompts for communication style/voice
  - Prompts for social links (website, YouTube, LinkedIn, etc.)
  - Prompts for booking link
  - Creates `linkedin-automator/` folder with config.md and subfolders

- [x] **US-2: Scheduling Preferences**
  As a user, I want to set when I want to perform different LinkedIn activities so I can build a routine.

  **Acceptance Criteria:**
  - Asks "When do you want to send initial DMs to new connections?"
  - Asks "When do you want to answer existing DMs?"
  - Asks "When do you want to connect with new people?"
  - Asks "When do you want to create new posts?"
  - Stores preferences in config.md

- [x] **US-3: Chrome Setup Instructions**
  As a user, I want clear instructions on setting up Claude-in-Chrome so I can use browser automation.

  **Acceptance Criteria:**
  - Instructions to install Claude-in-Chrome extension
  - Instructions to launch with `claude --chrome`
  - Option to verify Chrome connection works
  - Troubleshooting guidance if connection fails

---

### DM Connections (Outreach)

- [x] **US-4: DM Existing Connections**
  As a user, I want to run `/dmconnections` to send personalized DMs to my LinkedIn connections so I can start conversations.

  **Acceptance Criteria:**
  - Verifies config exists (redirects to setup if not)
  - Navigates to LinkedIn connections page via Chrome
  - Asks session size (5/10/20 messages or manual)
  - For each connection: reads profile, evaluates fit, generates opener
  - Shows draft message for approval before sending
  - Updates outreach/tracking.md after each message

- [x] **US-5: Prospect Filtering**
  As a user, I want connections filtered against my ICP so I only message relevant people.

  **Acceptance Criteria:**
  - Evaluates headline, role, business signal
  - Categorizes as "Strong fit", "Worth a shot", or "Skip"
  - Skips: under 25, employees without influence, job seekers, vague profiles
  - Shows why each prospect was categorized

- [x] **US-6: Personalized Openers**
  As a user, I want openers that reference something specific about each person so my messages feel genuine.

  **Acceptance Criteria:**
  - 2-3 sentences max
  - References their business, role, or headline
  - Ends with open-ended question
  - Never pitches in first message
  - Uses my configured voice/tone

- [x] **US-7: Session Learnings**
  As a user, I want to save what I learned from each outreach session so I can improve over time.

  **Acceptance Criteria:**
  - At session end, asks if I want to save learnings
  - Appends patterns to outreach/strategy.md
  - Tracks what segments responded best

---

### Answer DMs (Replies)

- [x] **US-8: Reply to Unread DMs**
  As a user, I want to run `/answerdm` to reply to unread LinkedIn messages so I can maintain conversations.

  **Acceptance Criteria:**
  - Navigates to LinkedIn messaging via Chrome
  - Identifies unread conversations
  - Reads full conversation history for context
  - Generates response per guidelines
  - Shows draft for approval before sending
  - Updates dms/tracking.md

- [x] **US-9: Conversation Classification**
  As a user, I want conversations classified so responses are contextually appropriate.

  **Acceptance Criteria:**
  - Classifies: first response, ongoing, booking request, cold pitch to us
  - Adjusts response style based on classification
  - Skips cold pitches to us (or marks as read)

- [x] **US-10: Response Guidelines**
  As a user, I want responses that follow my communication style and keep conversations flowing.

  **Acceptance Criteria:**
  - Every response ends with open-ended question
  - Acknowledges what they said specifically
  - Shares something personal/relatable
  - Soft booking mention when they show pain points
  - Uses my configured voice and key phrases

- [x] **US-11: Auto-Cleanup Stale Conversations**
  As a user, I want stale conversations archived so tracking doesn't get bloated.

  **Acceptance Criteria:**
  - Identifies conversations with no reply in 14+ days
  - Prompts to archive stale conversations
  - Moves to Completed/Archived in tracking
  - Shows count of archived conversations

- [x] **US-12: Update Guidelines from Session**
  As a user, I want to save response patterns that worked so guidelines improve over time.

  **Acceptance Criteria:**
  - At session end, asks if I want to save patterns
  - Appends to dms/guidelines.md Learning Log
  - Notes phrases that got good engagement

---

### LinkedIn Posts (Content)

- [x] **US-13: Generate Content from Templates**
  As a user, I want to run `/linkedinpost` to create LinkedIn posts from templates so I can maintain content consistency.

  **Acceptance Criteria:**
  - Shows template options (listicle, story, value, engagement)
  - Asks for topic/context
  - Generates post using template + my voice from config
  - Shows draft for approval/editing

- [x] **US-14: Lessons Learned Listicle Template**
  As a user, I want a "5 things I stopped doing" listicle template so I can share learnings.

  **Acceptance Criteria:**
  - Hook: [credibility] + [number] things I stopped doing
  - Body: numbered list with before/after for each
  - Closer: reframe the overall shift
  - CTA: open-ended question for comments
  - Personalized to my domain/expertise

- [x] **US-15: Post via Chrome or Copy**
  As a user, I want to post directly or copy to clipboard so I have flexibility.

  **Acceptance Criteria:**
  - Option to post directly via Chrome automation
  - Option to copy to clipboard
  - Tracks post in content/tracking.md

---

### Connect with ICP (Network Growth)

- [x] **US-16: Auto-Connect with ICP Matches**
  As a user, I want to run `/connecticp` to send connection requests to people matching my ICP so I can grow my network strategically.

  **Acceptance Criteria:**
  - Navigates to LinkedIn search or "People you may know"
  - Asks session size (10/25/50 or "max weekly limit")
  - Evaluates each profile against ICP criteria
  - Shows profile for approval before connecting
  - Sends connection request (with optional note)
  - Updates connections/tracking.md

- [x] **US-17: Weekly Limit Tracking**
  As a user, I want connection requests tracked against LinkedIn's weekly limit so I don't get restricted.

  **Acceptance Criteria:**
  - Tracks weekly sends in connections/tracking.md
  - Warns when approaching limit (~100-200/week)
  - Shows remaining quota in session summary
  - Resets count weekly

- [x] **US-18: Connection Notes**
  As a user, I want to optionally add personalized notes to connection requests so they stand out.

  **Acceptance Criteria:**
  - Option to add note or send without
  - Note references their profile/work
  - Keeps note under LinkedIn character limit

---

### Plugin Infrastructure

- [x] **US-19: SKILL.md Manifest**
  As a plugin distributor, I want a proper SKILL.md so users can discover and install the plugin.

  **Acceptance Criteria:**
  - Name: linkedin-automator
  - Description: clear value prop
  - Tags: linkedin, outreach, automation, chrome
  - Lists all 5 commands with descriptions
  - Documents prerequisites (Claude-in-Chrome)

- [x] **US-20: README with Installation**
  As a user, I want clear installation instructions so I can get started quickly.

  **Acceptance Criteria:**
  - Installation command: `npx skills add charlieautomates/linkedin-automator -g`
  - Prerequisites listed
  - Quick start guide
  - Command reference table

- [x] **US-21: Reference Documentation**
  As a command author, I want reference docs so commands have consistent guidelines to follow.

  **Acceptance Criteria:**
  - filtering-criteria.md - prospect evaluation rules
  - opener-patterns.md - message templates
  - dm-guidelines.md - response patterns
  - post-templates.md - content templates
  - chrome-guide.md - automation tips

- [x] **US-22: User Folder Templates**
  As a setup wizard, I want templates for all user files so setup creates consistent structure.

  **Acceptance Criteria:**
  - config.md - user profile + preferences
  - outreach/tracking.md - DM outreach log
  - dms/tracking.md - conversation tracking
  - connections/tracking.md - connection requests
  - content/tracking.md - posts created

---

## Folder Structure (Plugin Repo)

```
charlieautomates/linkedin-automator/
├── SKILL.md
├── README.md
├── LICENSE
├── commands/
│   ├── linkedinoutreach.md
│   ├── dmconnections.md
│   ├── answerdm.md
│   ├── linkedinpost.md
│   └── connecticp.md
├── references/
│   ├── filtering-criteria.md
│   ├── opener-patterns.md
│   ├── dm-guidelines.md
│   ├── post-templates.md
│   └── chrome-guide.md
└── templates/
    ├── config.md
    ├── outreach-tracking.md
    ├── dm-tracking.md
    ├── connections-tracking.md
    └── content-tracking.md
```

## User Folder Structure (Created by Setup)

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
    ├── templates.md
    └── tracking.md
```

---

## Progress Log

_Learnings and notes from each iteration go here._
