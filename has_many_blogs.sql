CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER has_many_user;

DROP TABLE IF EXISTS users CASCADE ;
CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR(90) NULL,
    last_name VARCHAR(90) NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts (
    post_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(180) NULL DEFAULT NULL,
    url VARCHAR (90) NULL DEFAULT NULL,
    content TEXT NULL DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
    comment_id INT NOT NULL PRIMARY KEY,
    body VARCHAR(510) NULL DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now()
);


ALTER TABLE posts ADD COLUMN author_id INTEGER;
ALTER TABLE comments ADD COLUMN post_id INTEGER;
ALTER TABLE comments ADD COLUMN author_id INTEGER;



ALTER TABLE comments
ADD CONSTRAINT post_id FOREIGN KEY (post_id) REFERENCES posts;
ALTER TABLE comments
ADD CONSTRAINT comment_author FOREIGN KEY (author_id) REFERENCES users;

ALTER TABLE posts
ADD CONSTRAINT post_comments FOREIGN KEY (author_id) REFERENCES users;