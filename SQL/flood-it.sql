SELECT 
  user_pseudo_id,
  event_date,
  event_name,
  -- Đoạn code "mở hộp" để lấy level:
  (SELECT value.int_value 
   FROM UNNEST(event_params) 
   WHERE key = 'level') as level,
  
  -- Đoạn code "mở hộp" để lấy revenue:
  (SELECT value.double_value 
   FROM UNNEST(event_params) 
   WHERE key = 'value') as revenue,
  device.category as device_type,
  geo.country as country
FROM `firebase-public-project.analytics_153293282.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20181001' AND '20181007'
  -- Chỉ lấy các sự kiện có khả năng chứa Level để dữ liệu gọn hơn
  AND event_name IN ('level_complete_quickplay', 'level_start_quickplay', 'level_up', 'post_score', 'in_app_purchase')