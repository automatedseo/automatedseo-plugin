---
expect:
  workspaceId: "ws-northpeak"
  websiteId: "site-northpeak"
---

{
 "from": "2026-09-10",
 "to": "2026-10-08",
 "summary": {
  "clicks": 1284,
  "impressions": 61420,
  "average_ctr": 0.0209,
  "average_position": 18.6
 },
 "daily": [
  {
   "metric_date": "2026-10-01",
   "clicks": 47,
   "impressions": 2210,
   "ctr": 0.0213,
   "average_position": 17.9
  },
  {
   "metric_date": "2026-10-02",
   "clicks": 41,
   "impressions": 2185,
   "ctr": 0.0188,
   "average_position": 18.4
  },
  {
   "metric_date": "2026-10-03",
   "clicks": 36,
   "impressions": 1990,
   "ctr": 0.0181,
   "average_position": 18.8
  },
  {
   "metric_date": "2026-10-04",
   "clicks": 33,
   "impressions": 1870,
   "ctr": 0.0176,
   "average_position": 19.2
  },
  {
   "metric_date": "2026-10-05",
   "clicks": 38,
   "impressions": 2050,
   "ctr": 0.0185,
   "average_position": 18.7
  },
  {
   "metric_date": "2026-10-06",
   "clicks": 42,
   "impressions": 2240,
   "ctr": 0.0187,
   "average_position": 18.3
  },
  {
   "metric_date": "2026-10-07",
   "clicks": 44,
   "impressions": 2302,
   "ctr": 0.0191,
   "average_position": 18.1
  }
 ],
 "anomalies": [
  {
   "id": "anomaly-npc-cold-brew",
   "anomaly_type": "page_clicks_drop",
   "title": "Clicks to /blog/cold-brew-ratio fell 46%",
   "severity": "warning",
   "status": "open",
   "period_start": "2026-09-24",
   "period_end": "2026-10-07",
   "current_value": 212,
   "baseline_value": 393,
   "change_ratio": -0.46,
   "recommendation": "Check whether the page lost a ranking or snippet for \"cold brew ratio\", then refresh the ratio table and the opening answer."
  }
 ]
}
