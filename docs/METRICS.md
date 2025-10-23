[Link to the ClearPath Feedback HEART Framework](https://docs.google.com/presentation/d/1Wgth3IXVBtckmzxzq_Leqbo4NOyEtu56pyo5mpKY8GA/edit?usp=sharing)

Happiness Metrics:
- NPS (Net Promoter Score):
  - Collected through a short in-app survey shown after a user submits feedback or after completing the Golden Path (submission).
  - Users rate on a 0–10 scale (“How likely are you to recommend ClearPath Feedback to a friend or colleague?”).
  - Responses are stored in Firestore under each user’s document in a feedback_metrics collection.
  - Aggregate NPS is computed via a Cloud Function that calculates (Promoters - Detractors) / Total Respondents daily.
- Average Feedback Satisfaction Rating (1–5 scale):
  - After submitting or upvoting feedback, users can rate the ease of using the feedback tool (e.g., “How easy was it to share your feedback?”).
  - Stored in Firestore under the feedback post document (field: user_satisfaction_rating).
  - Firebase Analytics logs a custom event feedback_satisfaction_submit to track completion rate of this optional rating.

Engagement Metrics:
- DAU (Daily Active Users):
  - Automatically tracked via Firebase Analytics.
  - A user is considered “active” if they perform any core event (e.g., login, feedback_submit, feedback_upvote, feedback_comment) within a 24-hour window.
  - Reported via Firebase’s built-in DAU metric and verified through daily event counts in the Firebase dashboard.
- Average Session Duration:
  - Collected automatically by Firebase Analytics, which measures time between app open and close events.
  - Can be further refined by logging a custom event (session_end) when a user returns to the home or logout screen to ensure accuracy.
- Average Number of Feedback Posts Interacted With per Session:
  - Requires a custom event feedback_interaction logged every time a user views, upvotes, or comments on a feedback post.
  - Firebase Analytics aggregates the count of these events per user session.
  - A Cloud Function runs nightly to compute the mean value across all users who logged in that day.

Adoption Metrics:
- New User Sign-ups per Week:
  - Automatically tracked via Firebase Analytics using the built-in first_open event.
  - This metric reflects how many new users begin using ClearPath Feedback each week.
  - Developers can view the trend in the Firebase dashboard or export it to BigQuery for detailed cohort analysis.
- Onboarding Completion Rate:
  - Calculated as (users who finish onboarding ÷ total new sign-ups).
  - A custom event onboarding_complete is logged once users upload a profile picture and fill in basic details.
  - A Cloud Function aggregates weekly completion percentages to track onboarding effectiveness over time.

Retention Metrics:
- Metric 1:

Task Success Metrics:
- Metric 1: 
