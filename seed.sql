INSERT INTO stats (name, value, icon, change_percent) VALUES
  ('סה"כ הכנסות', 248500, 'revenue', 12.5),
  ('הזמנות חדשות', 1284, 'orders', 8.2),
  ('לקוחות פעילים', 3621, 'users', 5.7),
  ('שיעור המרה', 3.24, 'conversion', -1.3)
ON CONFLICT DO NOTHING;

INSERT INTO recent_orders (customer_name, product, amount, status, created_at) VALUES
  ('אחמד חמאד', 'מנוי Pro', 299, 'completed', NOW() - INTERVAL '2 hours'),
  ('שרה כהן', 'מנוי Basic', 99, 'completed', NOW() - INTERVAL '4 hours'),
  ('יוסף אבו רמי', 'מנוי Enterprise', 999, 'pending', NOW() - INTERVAL '6 hours'),
  ('מיכל לוי', 'מנוי Pro', 299, 'completed', NOW() - INTERVAL '8 hours'),
  ('דוד ישראלי', 'מנוי Basic', 99, 'cancelled', NOW() - INTERVAL '12 hours'),
  ('נאדיה סאלח', 'מנוי Enterprise', 999, 'completed', NOW() - INTERVAL '1 day'),
  ('רון כהן', 'מנוי Pro', 299, 'pending', NOW() - INTERVAL '1 day 4 hours')
ON CONFLICT DO NOTHING;

INSERT INTO monthly_revenue (month, year, revenue, orders) VALUES
  ('ינואר', 2026, 18200, 89),
  ('פברואר', 2026, 21500, 104),
  ('מרץ', 2026, 19800, 97),
  ('אפריל', 2026, 24100, 118),
  ('מאי', 2026, 22700, 111),
  ('יוני', 2026, 28500, 139)
ON CONFLICT DO NOTHING;
