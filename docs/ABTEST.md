# A/B Test 1 (James Dartt): Signup/Login 1 screen or 2 screens
- User Story: US 1, US2
- Metric(s): Adoption (signup completion rate for new accounts created / sign-up flow starts), Task Success (time-to-complete signup; error rate during signup), Engagement (percent of new users who complete onboarding and perform a Golden Path event within 7 days), Happiness (post-signup satisfaction with a short NPS or 1–5 satisfaction rating prompt shown after first submission or after onboarding).
- Hypothesis: If we reduce navigational friction by combining sign-up and sign-in onto a single screen (Variation A), then more users will complete account creation (higher Adoption) and finish onboarding, because fewer taps and fewer context switches reduce drop-off during initial authentication.
- Experiment: Use Firebase Remote Config + Firebase A/B Testing to deliver the two UI variations. Remote Config flags the client to render either the single-screen flow or the two-screen flow. Firebase A/B Testing will manage traffic allocation and report on significance.
- Variations: Version A: One unified screen shows both “Sign in” and “Create account” options in a combined layout. Version B: Clear separation: landing screen has two clear CTA buttons: Sign In and Create Account.

# A/B Test 2 (Rafael Lacerda): Profile Screen
- User Story: US 3
- Metric(s): Adoption (rate of distinct profile pictures for new accounts), Task Success (percentage of users setting or not setting a profile picture), Engagement (For group B, the percentage of new accounts that don't have the default profile picture), Happiness (rate of users who engage with changing profile pictures after account creation)
- Hypothesis: If users have unique profile pictures to them, it will allow companies to better identify users who better interact with the platform and link them to their feedback.
- Experiment: Using the Firebase Remote Config and A/B Testing we will push out the two versions of the app. Using a profile picture change metric, Firebase A/B testing will collect amount of users who change their profile picture upon account creation for Version B.
- Variations: Version A: Users will be required to set a profile picture upon account creation. Version B: Users will not be required to change their profile picture, setting their account with the default image.

# A/B Test 3 (Kevin Walker): 
- User Story: 
- Metric(s): 
- Hypothesis: 
- Experiment: 
- Variations:

# A/B Test 4 (Badhan Hasan): 
- User Story: US 3
- Metric(s):
  - Adoption: Profile setup completion rate = (users who finish setup ÷ total who start).
  - Engagement: Percentage of users who fill out the bio field.
- Hypothesis: Adding a short optional bio field helps users personalize their profiles and feel more connected, increasing completion rates and engagement.
- Experiment: Using Firebase A/B Testing, half of new users see a bio text box during profile setup, while the other half don’t. Firebase tracks completion rate and bio usage for each group.
- Variations:
  - Version A (With Bio): Profile setup includes an optional “About Me” field.
  - Version B (No Bio): Profile setup has no bio field.
