SELECT * FROM users;
SELECT users.user_id, posts.post_id FROM posts INNER JOIN users ON user_id = 100;
SELECT users.user_id, posts.post_id, users.first_name, users.last_name FROM posts INNER JOIN users ON user_id  = 200;
SELECT users.user_id, posts.post_id, users.username, users.first_name, users.last_name FROM posts INNER JOIN users ON users.first_name = 'Norene' AND users.last_name = 'Schmitt';
SELECT users.user_id, posts.post_id, users.username, posts.created_at FROM users INNER JOIN posts ON posts.created_at > '2015-01-01';
SELECT users.user_id, posts.post_id, posts.title, posts.content, users.username FROM posts INNER JOIN users ON users.created_at < '2015-01-01';
SELECT posts.post_id, comments.comment_id,posts.title FROM comments INNER JOIN posts ON comments.comment_id = posts.post_id;
SELECT posts.post_id, comments.comment_id,posts.title, posts.url, comment.body, posts.created_at FROM comments INNER JOIN comments ON posts.created_at > '2015-01-01';
SELECT posts.post_id, comments.comment_id, posts.title, posts.url, comments.body FROM comments INNER JOIN posts ON posts.created_at > '2015-01-01';
SELECT posts.post_id, comments.comment_id, posts.title, posts.url, comments.body FROM comments INNER JOIN posts ON comments.body = LIKE '%USB%';
SELECT users.user_id, posts.post_id, comments.comment_id, posts.title, users.first_name, users.last_name, comments.body, user_id, post_id FROM comments INNER JOIN users ON user_id = post_id  INNER JOIN posts.title ON comments.body = LIKE '%matrix%' 
SELECT users.user_id, posts.post_id, comments.comment_id, user.first_name, user.last_name, comment.body, posts.content FROM users INNER JOIN posts ON user_id = post_id INNER JOIN comments ON comment.body = LIKE '%SSL%' AND post.content = LIKE '%dolorum%'
SELECT users.user_id, posts.post_id, comments.comment_id, users.first_name, users.last_name, posts.title, comments.author_id, comments.body FROM posts INNER JOIN posts ON users.user_id = posts.post_id INNER JOIN comments ON comments.body = LIKE '%SSL' OR comments.body = LIKE '%firewall%' AND posts.content = LIKE '%nemo%'