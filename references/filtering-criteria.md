# Filtering Criteria

Rules for evaluating LinkedIn prospects against ICP criteria.

## Rating System

### Strong Fit
High-confidence match. Prioritize these.

**Signals:**
- Title contains: Owner, Founder, CEO, President, Partner, Director
- Industry matches user's ICP exactly
- Has company with 2-100 employees (decision-making power)
- Headline mentions specific business/service
- Recent posts about business challenges
- Mutual connections with other ideal clients

### Worth a Shot
Partial match. Message if session has capacity.

**Signals:**
- Title contains: Consultant, Advisor, Manager, Head of
- Adjacent industry (e.g., targeting "marketing" and they're in "sales")
- Freelancer or solopreneur
- Headline is business-focused but vague
- Some activity but not highly engaged

### Skip
Don't message. Move on.

**Signals:**
- Entry-level titles: Associate, Assistant, Intern, Junior
- Job seeking indicators: "Open to work", "Seeking opportunities", "Looking for"
- Student or recent graduate
- Employee at large corporation (no decision power)
- Vague/aspirational titles: "Visionary", "Thought Leader", "Dreamer"
- Profile looks inactive (no photo, sparse info)
- Already in tracking.md as messaged recently

---

## Quick Reference Table

| Signal | Rating | Reason |
|--------|--------|--------|
| "Founder @ [Company]" | Strong | Decision maker, owns business |
| "CEO" | Strong | Top decision maker |
| "Agency Owner" | Strong | Runs service business |
| "Consultant" | Worth a shot | May have clients, influence |
| "Freelance [skill]" | Worth a shot | Solopreneur, may need help |
| "Director of Marketing" | Worth a shot | Has budget, but employee |
| "Sales Manager" | Skip (usually) | Employee, limited scope |
| "Open to work" | Skip | Job seeking, not buying |
| "Student" | Skip | No budget or authority |
| "Aspiring Entrepreneur" | Skip | Not there yet |

---

## Role-Based Filtering

### Always Reach Out
- Founder / Co-Founder
- Owner
- CEO / President
- Managing Partner
- Principal

### Usually Reach Out
- Director (if at small company)
- VP (if at small company)
- Consultant
- Advisor
- Fractional [Role]

### Context-Dependent
- Manager (depends on company size)
- Head of (depends on company size)
- Lead (technical lead might have influence)

### Usually Skip
- Associate
- Coordinator
- Specialist
- Analyst
- Representative

### Always Skip
- Intern
- Student
- Entry-level
- Assistant (unless Executive Assistant)
- Job seeking / Open to work

---

## Industry Signals

### Strong Business Indicators
- Runs an agency (any type)
- Has a company name in headline
- Mentions revenue, clients, or team size
- "Helping [target] achieve [result]"
- Specific service offering mentioned

### Weak/Skip Indicators
- Generic corporate title at Fortune 500
- Academic or non-profit (unless targeting)
- Government employee
- Retired / Former
- "Exploring" or "Transitioning"

---

## Engagement Signals

### Positive
- Posts regularly about business topics
- Comments on industry discussions
- Shares insights or case studies
- Has recommendations/endorsements
- Active in relevant groups

### Neutral
- Occasional activity
- Mostly reshares vs. original content
- Profile complete but passive

### Negative
- No activity in 6+ months
- Profile incomplete
- No photo
- Generic "I help people" with no specifics

---

## Duplicate Prevention

Before messaging, check `tracking.md` for:
- Name + Company match
- Profile URL match
- Messaged within last 30 days

If found in tracking as "Sent" → Skip
If found as "No reply" (14+ days) → Consider follow-up instead of new message

---

## Override Rules

User's explicit ICP criteria in `config.md` always takes precedence:
- If user targets "teachers", don't auto-skip teachers
- If user targets "enterprise", don't skip corporate titles
- If user excludes "consultants", skip even if they look like a fit

Always defer to user configuration over default rules.
