# LinkedIn Post

Generate LinkedIn posts from proven templates using your voice and expertise.

## Prerequisites

- Setup completed (`/linkedinoutreach`)
- `linkedin-automator/config.md` exists

## Behavior

### Step 1: Verify Setup

Check for `linkedin-automator/config.md`. If missing:

```
Setup not found. Run /linkedinoutreach first to configure your profile.
```

Load config for voice settings and expertise areas.

### Step 2: Choose Template

```
What type of post do you want to create?

1. Listicle - "X things I stopped doing..."
2. Story - Personal experience with lesson
3. Value bomb - Quick actionable tip
4. Engagement - Question to spark discussion
5. Behind the scenes - Show your process/work
```

### Step 3: Gather Context

Based on template chosen, ask for topic/context:

**Listicle:**
```
What's the topic? (e.g., "client onboarding", "hiring", "sales calls")
How many items? (3-7 works best)
```

**Story:**
```
What happened? (Brief description of the situation)
What did you learn?
```

**Value bomb:**
```
What's the tip or insight?
Who is it for?
```

**Engagement:**
```
What do you want to discuss?
What's your take on it?
```

**Behind the scenes:**
```
What are you working on?
What's interesting about it?
```

### Step 4: Generate Post

Using templates from `references/post-templates.md` and user's voice:

**Post structure:**
- Hook (first line that stops the scroll)
- Body (value, story, or list)
- Closer (reframe or insight)
- CTA (question for engagement)

Present draft:

```
Here's your post draft:

---
[Generated post content]
---

Character count: X/3000

[Post via Chrome] [Copy to clipboard] [Edit] [Try different angle]
```

### Step 5: Handle User Response

- **Post via Chrome**: Navigate to LinkedIn, create post, paste content
- **Copy to clipboard**: Copy text for manual posting
- **Edit**: Let user modify, then repeat options
- **Try different angle**: Generate alternative version

### Step 6: Track Post

After posting or copying, log to `linkedin-automator/content/tracking.md`:

```markdown
## [Date]

### [Post title/topic]
- **Template**: [Type used]
- **Status**: Posted / Drafted
- **Content**:
  ```
  [The post text]
  ```
- **Engagement**: [Update later with likes/comments]
```

## Template: Listicle ("X things I stopped doing")

### Structure
```
[Credibility hook] + [Number] things I stopped doing as a [role]:

1. [Old behavior]
→ Now I [new behavior]
[Why this matters]

2. [Old behavior]
→ Now I [new behavior]
[Why this matters]

[Continue for each item...]

The shift? [Reframe the overall change]

What's one thing you stopped doing that changed everything?
```

### Example
```
After 12 years building businesses, here are 5 things I stopped doing:

1. Saying yes to every opportunity
→ Now I filter ruthlessly against my ICP
Result: 3x revenue, half the stress

2. Building before validating
→ Now I sell first, build second
Result: No more wasted months on ideas nobody wants

[...]

The shift? I stopped optimizing for busy. Started optimizing for leverage.

What's one thing you stopped doing that changed your business?
```

## Template: Story

### Structure
```
[Attention-grabbing opening line]

[Set the scene - what was happening]

[The problem or challenge]

[What you tried / the turning point]

[The result]

[The lesson]

[Question for engagement]
```

## Template: Value Bomb

### Structure
```
[Bold claim or hook]

Here's how:

[Step 1]
[Step 2]
[Step 3]

That's it. [Reinforcing statement]

[Question or CTA]
```

## Template: Engagement

### Structure
```
[Provocative question or statement]

[Your brief take - 1-2 sentences]

[Acknowledge other perspectives]

[Genuine question to spark discussion]
```

## Chrome Posting Flow

```
1. Navigate to https://www.linkedin.com/feed/
2. Click "Start a post" button
3. Wait for compose modal
4. Paste post content
5. Click "Post" button
6. Confirm success
```

## Error Handling

- **Chrome not available**: Default to copy-to-clipboard
- **Post fails**: Save draft locally, retry or copy
- **Character limit exceeded**: Suggest cuts, regenerate shorter version
