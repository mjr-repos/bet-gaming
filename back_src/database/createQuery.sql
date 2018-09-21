CREATE TABLE IF NOT EXISTS casinos (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  name VARCHAR (100) NOT NULL,
  code VARCHAR (10) UNIQUE NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS games (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  name VARCHAR (100) NOT NULL,
  code VARCHAR (10) UNIQUE NOT NULL,
  type INTEGER NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS countries (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  name VARCHAR (100) NOT NULL,
  code VARCHAR (10) UNIQUE NOT NULL,
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS players (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  name VARCHAR (100) NOT NULL,
  email VARCHAR (255) UNIQUE NOT NULL,
  password VARCHAR (255) NOT NULL,
  country_id INTEGER REFERENCES countries (id) NOT NULL,
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS casino_games (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  casino_id INTEGER NOT NULL REFERENCES casinos (id),
  game_id INTEGER NOT NULL REFERENCES games (id),
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS country_games (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  game_id INTEGER NOT NULL REFERENCES games (id),
  country_id INTEGER NOT NULL REFERENCES countries (id),
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS player_favorite_games (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
  game_id INTEGER NOT NULL REFERENCES games (id),
  player_id INTEGER NOT NULL REFERENCES players (id),
  created DATE NOT NULL,
  updated DATE NOT NULL,
  deleted DATE DEFAULT NULL
);