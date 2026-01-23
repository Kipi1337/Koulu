# DA&ML Basics -  Assignment 3.1

## CRISP-DM Phase 2 - Business Understanding (3 points)

The goal of this assignment is to understand what problem the analysis is trying to solve and what the business benefit is.

Note! If you are unfamiliar with the football game, watch a football match or study the statistics before starting the task. Most problems are less familiar to data analysts, so it is always worth familiarizing yourself with the context beyond the assignment.

**Questions** that can help you write a plan:

* Define the main goal of the analysis: Do you want to predict match results, analyze player performance, study betting profitability, focus on just one football league or something else?
* Identify stakeholders: Who benefit from the analysis (coaches, players, bettors, clubs, spectators, fans)?
* What kind of analyses do different stakeholders want from the data?
* Define target metrics: E.g. accuracy of win predictions, measuring player efficiency in certain areas.
* List the most important variables: E.g. goals, assists, player attributes, betting odds.
* Define the target group or groups for the next phase (coaches, players, bettors, clubs, spectators, fans). It is not advisable to choose a target group that is too broad.
* Consider whether the data needs to be supplemented for future analysis.

Business Understanding can be written in either a **Markdown** file or a **Jupyter Notebook** file. No code should be written for this task. This is just a plan and analysis of the problem from a business perspective.


1. Define the main goal of the analysis: Do you want to predict match results, analyze player performance, study betting profitability, focus on just one football league or something else?

The main goal of this analysis is to analyze and predict football match outcomes within a single top-level football league, such as the English Premier League or another major European league. The analysis focuses on understanding the factors that influence match results, including team performance indicators and match context variables. The purpose is not limited to predicting whether a team wins, draws, or loses, but also to explain why certain outcomes occur.

From a business perspective, the objective is to support data-driven decision-making in football organizations. By identifying performance drivers and patterns, the analysis can help teams improve competitiveness and strategic planning over the course of a season.

2. Identify stakeholders: Who benefit from the analysis (coaches, players, bettors, clubs, spectators, fans)?

The primary stakeholders of this analysis are football coaches and team analysts. These stakeholders are directly responsible for match preparation, tactical decisions, and performance evaluation, and therefore benefit the most from analytical insights.

Secondary stakeholders include club management, players, fans, spectators, and bettors. Club management can use the results for long-term planning and performance evaluation. Players can gain insights into their strengths and weaknesses. Fans and spectators may gain a deeper understanding of match dynamics, while bettors may use predictive insights to assess match probabilities.

3. What kind of analyses do different stakeholders want from the data?

Coaches and team analysts are interested in understanding which factors contribute most strongly to winning matches. They want analyses that compare team performance, identify strengths and weaknesses, and evaluate differences between home and away matches. These insights can support tactical planning and opponent analysis.

Club management is interested in high-level performance indicators, such as overall team efficiency during a season, consistency of results, and comparisons with other teams in the league. These analyses support strategic and financial decision-making.

Secondary stakeholders, such as fans and bettors, are primarily interested in match outcome probabilities, team form trends, and performance comparisons.

4. Define target metrics: E.g. accuracy of win predictions, measuring player efficiency in certain areas.

The success of the analysis is evaluated using both predictive and descriptive metrics. One important metric is the accuracy of match outcome predictions, measured by how often the predicted result matches the actual match result. In addition, precision and recall for win predictions can be used to assess model reliability.

From a performance perspective, important team-level metrics include average goals scored per match, average goals conceded per match, goal difference, and points per match. These metrics help quantify team efficiency and competitive strength.

5. List the most important variables: E.g. goals, assists, player attributes, betting odds.

The most important variables for this analysis are expected to be match-level statistics that directly influence outcomes. These include goals scored, goals conceded, final match result, and whether the team is playing at home or away. Team form, measured by recent match results, is also an important explanatory variable.

Additional relevant variables include shots on target, possession percentage, number of fouls, and disciplinary actions such as yellow and red cards. If available, advanced variables such as expected goals, player availability due to injuries or suspensions, and betting odds can further improve the quality of the analysis.

6. Define the target group or groups for the next phase (coaches, players, bettors, clubs, spectators, fans). It is not advisable to choose a target group that is too broad.

The primary target group for the next phase of the CRISP-DM process is football coaches and team analysts. This group has clearly defined analytical needs and can directly apply the results of the analysis in practical decision-making. Limiting the target group helps ensure that the analysis remains focused and relevant.

7. Consider whether the data needs to be supplemented for future analysis.

The available dataset may be limited to team-level match statistics. While this data is sufficient for basic outcome prediction and performance analysis, it may not fully capture tactical or individual player contributions.

For future analysis, the dataset could be supplemented with player-level statistics, injury and suspension information, advanced metrics such as expected goals, and contextual factors such as weather conditions and match scheduling. Including additional data sources would improve both predictive accuracy and the depth of performance insights.

Overall, the analysis helps football organizations use data as a strategic resource, leading to improved performance, better planning, and a potential competitive advantage within the league.

