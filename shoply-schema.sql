CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  password TEXT NOT NULL,
  email TEXT NOT NULL
     CHECK (position('@' IN email) > 1)
);

-- table holds our available quotes
-- to render a quote - "quotes.quote + "--" + "quotes.author"
CREATE TABLE quotes (
  id SERIAL PRIMARY KEY,
  quote TEXT NOT NULL,
  -- author TEXT NOT NULL,
  category TEXT NOT NULL
);

-- table holds which quotes were ordered by which users
CREATE TABLE user_quotes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER
    REFERENCES users ON DELETE CASCADE,
  quote_id INTEGER
    REFERENCES quotes ON DELETE CASCADE
);
