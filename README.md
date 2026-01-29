# 🎮 Flood-It! Game Analytics: Optimizing Retention & Monetization (Oct 2018)
Author: [Nguyen Thi Anh Thanh] (Game Data Analyst)

Focus: Decoding player behavior and optimizing revenue through Data-Driven Insights.

Date: Jan 2026

Tools Used: SQL (BigQuery), Power BI (DAX, Data Modeling), Python.
## 🖥️ Dashboard Access
📥 https://app.powerbi.com/groups/me/reports/b28f4dfd-1dc9-4ede-b051-d07d345ffc93/c720208830c9c47d5e4a?experience=power-bi

# 🚀 Executive Summary
This project analyzes player behavior data from the "Flood-It!" game during a 72-hour window (Oct 01, 2018 – Oct 03, 2018). By combining conversion funnel analysis with financial KPIs, the project assists Management in:

Identifying friction points causing users to churn within the first 24 hours.

Analyzing revenue structure across different purchase packages and ARPDAU performance.

Developing operational strategies and "Golden Hour" promotions to maximize revenue.

# 📌 Background & Objectives
## Background:
"Flood-It!" is a strategic puzzle game. Despite a high volume of initial users, the game faces challenges in maintaining Retention and converting free users into paying customers (Conversion), as players tend to churn quickly after installation.

## Four Requirements from the Manager:
User Funnel Analysis: Track the conversion rate from level start to final purchase.

Retention Diagnostics: Analyze churn patterns using Day-diff Cohort analysis.

Revenue Performance: Evaluate revenue contribution by package type and time-series trends.

Strategic Action Plan: Propose data-backed solutions to improve product engagement and monetization.
📂 Dataset Description
Source: Google BigQuery Public Dataset (firebase-public-project.analytics_153293282.events_201810*).

Size: ~15,000+ event records covering a 72-hour window from October 01, 2018, to October 03, 2018.

Format: BigQuery SQL Table / Exported CSV.

Data Schema
<img width="1824" height="718" alt="Screenshot 2026-01-29 184546" src="https://github.com/user-attachments/assets/6b50b798-62ce-4f2f-84d8-9838b0433346" />

The dataset follows a standardized event-driven schema, focusing on the following key attributes identified during the analysis:

user_pseudo_id: A unique, anonymous identifier for each player used to track cross-session behavior.

event_date: The date the event was recorded, used to establish the 3-day analysis window.

event_name: Core player actions including level_start_quickplay, post_score, level_complete_quickplay, level_up, and in_app_purchase.

level: The specific in-game level where the event occurred, categorized into Level Groups (e.g., 1-4, 5-8).

revenue / event_value_in_usd: The financial value generated from purchase events, essential for calculating Total Revenue and ARPDAU.

device_type / country: Categorical data used for demographic and platform-based segmentation.

First_Date & Day_Diff: Derived columns used to calculate Cohort Retention by tracking the days elapsed since a user's first appearance.

Purchase_Type: Classification of transactions into Small, Medium, or Big Packs.

# 📊 Data Processing & Metric Definitions
## SQL Data Processing:
Data Filtering: Extracted event-level data for the specific 3-day window (Oct 01 - Oct 03).

User Segmentation: Identified new users via the first_open event and categorized paying users via purchase events.

## DAX Calculations for KPIs:
Avg DAU: AVERAGEX(VALUES('Date'[Date]), [Total Users]) – Measures the average daily active user base.

ARPDAU: DIVIDE([Total Revenue], [Total Users]) – Average Revenue Per Daily Active User.

Retention Rate %: Calculated based on the difference between the return date and the initial install date (DayDiff).

Purchase CVR %: The percentage of active users who completed a transaction.

## 📊 Key Insights & Visualizations
<img width="1148" height="693" alt="image" src="https://github.com/user-attachments/assets/c0d7194e-0c2d-4531-bcbf-ddc761acceaf" />

## I. User Analysis & Funnel Diagnostics
Funnel Drop-off: The conversion from level_start (732) to level_up (128) is only ~17.5%, indicating a significant difficulty barrier or lack of engagement in the early stages.

Behavioral Shift: In the Level 1-4 group, players focus on core content exploration. From Level 5 onwards, behavior shifts entirely toward "Level Up" and "Purchase" events, suggesting that remaining players are highly committed "Whales".

## II. Retention Analysis: The 24-Hour Crisis
Day 1 Churn: Retention drops from 100% to below 40% after just one day.

Core Stability: Interestingly, users who survive Day 1 show stable retention into Day 2 (~40%), implying that once the onboarding hurdle is cleared, users become highly loyal.

## III. Purchase Analysis: Whale Dominance
Revenue Mix: The "Big Pack" accounts for 70% of total revenue ($7.0K out of $10K).

CVR Growth: While the active user count decreases, the Conversion Rate (CVR) spikes to 0.130 by the end of Day 3, proving the remaining user base is high-quality and high-intent.

Peak Revenue Time: Performance peaks consistently around 12 AM each day.

# 💡 Action Strategies (Recommendations)
Product Balancing:

Lower the difficulty curve for Levels 1-4 to improve the initial onboarding rate.

Introduce advanced challenges from Level 5 onwards to maintain engagement for veteran players.

Monetization Strategy:

Launch "Flash Sales" during the midnight peak (12 AM) to capitalize on high-activity windows.

Develop a VIP Loyalty Program specifically for "Big Pack" purchasers to ensure long-term LTV.




Early-Stage Conversion:

Introduce a low-cost "Starter Pack" to convert free users during their peak engagement window within the first 24 hours.
