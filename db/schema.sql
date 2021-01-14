CREATE TABLE users (
  id serial primary key,
  username text not null,
  password text not null,
  token text not null);

INSERT INTO users (username, password, token) VALUES ('density', 'password123', 'mytoken');
