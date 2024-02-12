use testdatabase;

CREATE TABLE board(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(5),
    content VARCHAR(10),
    likes INT CHECK(likes BETWEEN 1 AND 100),
    img CHAR(1) DEFAULT 'c',
    created DATE,
    user_id INT,
    FOREIGN KEY (user_id) references user(id)
);