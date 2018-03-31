CREATE USER has_many_user;
CREATE DATABSE IF NOT EXISTS has_many_blogs OWNER has_many-user;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR(90) NULL,
    last_name VARCHAR(90) NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    id INT NOT NULL PRIMARY KEY,
    title VARCHAR(180) NULL DEFAULT NULL,
    url VARCHAR (90) NULL DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    id INT NOT NULL PRIMARY KEY,
    body VARCHAR(510) NULL DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

ALTER TABLE users
ADD CONSTRAINT comments FOREIGN KEY (id) REFERENCES comments;
ALTER TABLE users
ADD CONSTRAINT post_recrd FOREIGN KEY(id) REFERENCES posts;

ALTER TABLE posts
ADD CONSTRAINT author FOREIGN KEY (id) REFERENCES users;
ALTER TABLE posts
ADD CONSTRAINT post_comments FOREIGN KEY (id) REFERENCES comments;

ALTER TABLE comments
ADD CONSTRAINT post_id FOREIGN KEY (id) REFERENCES posts;
ALTER TABLE comments
ADD CONSTRAINT comment_author FOREIGN KEY (id) REFERENCES users;