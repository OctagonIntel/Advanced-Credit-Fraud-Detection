#How many transactions?

SELECT
  COUNT(*) AS total_transactions,
  COUNTIF(Actual = 1) AS total_frauds,
  ROUND(COUNTIF(Actual = 1) * 100.0 / COUNT(*), 4) AS fraud_rate_percentage
FROM `tough-history-464818-s4.Fraud_Analytics.Fraud Analysis Table`;

#Total and Average amount per Class.

SELECT
  Actual,
  COUNT(*) AS num_transactions,
  ROUND(SUM(Amount), 2) AS total_amount,
  ROUND(AVG(Amount), 2) AS avg_amount,
  ROUND(MAX(Amount), 2) AS max_amount
FROM `tough-history-464818-s4.Fraud_Analytics.Fraud Analysis Table`
GROUP BY Actual;

#Fraud Time Segments

SELECT
  FLOOR(Time / 3600) AS hour_of_day,
  COUNT(*) AS total_transactions,
  COUNTIF(Actual = 1) AS total_frauds,
  ROUND(COUNTIF(Actual = 1) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM `tough-history-464818-s4.Fraud_Analytics.Fraud Analysis Table`
GROUP BY hour_of_day
ORDER BY hour_of_day;

#Actual vs Predicted

SELECT
  Actual,
  Predicted,
  Count(*) AS count
FROM `tough-history-464818-s4.Fraud_Analytics.Fraud Analysis Table`
GROUP BY Actual, Predicted
ORDER BY Actual, Predicted;