CREATE TABLE IF NOT EXISTS stats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  value NUMERIC NOT NULL,
  icon TEXT,
  change_percent NUMERIC,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS recent_orders (
  id SERIAL PRIMARY KEY,
  customer_name TEXT NOT NULL,
  product TEXT NOT NULL,
  amount NUMERIC NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('completed', 'pending', 'cancelled')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS monthly_revenue (
  id SERIAL PRIMARY KEY,
  month TEXT NOT NULL,
  year INTEGER NOT NULL,
  revenue NUMERIC NOT NULL,
  orders INTEGER NOT NULL
);

ALTER TABLE stats ENABLE ROW LEVEL SECURITY;
ALTER TABLE recent_orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE monthly_revenue ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_read_stats" ON stats FOR SELECT TO anon USING (true);
CREATE POLICY "allow_read_orders" ON recent_orders FOR SELECT TO anon USING (true);
CREATE POLICY "allow_read_revenue" ON monthly_revenue FOR SELECT TO anon USING (true);

GRANT SELECT ON stats TO anon;
GRANT SELECT ON recent_orders TO anon;
GRANT SELECT ON monthly_revenue TO anon;
