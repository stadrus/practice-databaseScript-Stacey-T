START TRANSACTION;

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS images;
DROP TABLE IF EXISTS users;

#practice during lesson
CREATE TABLE users (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL DEFAULT 'N/A',
  email VARCHAR(100) NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
#practice during lesson
CREATE TABLE posts (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL REFERENCES users(id),
  title VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
#created images table using data from the posts table. 
CREATE TABLE images (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL REFERENCES users(id),
  title VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (id, username, email, password) VALUES 
(1,'alice', 'alice@test.com', 'password123'),
(2, 'bob', 'bob@test.com', 'password456'),
(3, 'charlie', 'charlie@test.com', 'password789');

INSERT INTO posts (user_id, title, content) VALUES
(1, 'First Post', 'This is the content of the first post'),
(2, 'Second Post', 'This is the content of the second post'),
(3, 'Third Post', 'This is the content of the third post'),
(1, 'Fourth Post', 'This is the content of the fourth post'),
(2, 'Fifth Post', 'This is the content of the fifth post');
#added to complete lesson practice 
INSERT INTO images (user_id, title, content) VALUES
(1, 'First Image', 'This is the content of the first image'),
(2, 'Second Image', 'This is the content of the second image'),
(3, 'Third Image', 'This is the content of the third image'),
(1, 'Fourth Image', 'This is the content of the fourth image'),
(2, 'Fifth Image', 'This is the content of the fifth image');
#used rollback to test the data then commit with no errors
COMMIT;