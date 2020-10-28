CREATE TABLE comments(
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments(content)
VALUES
("NCJDVNISLKV");

CREATE TABLE comments2(
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comments2(content)
VALUES
("NCJDVNISLKV");

UPDATE comments2 SET content="cmkevm" WHERE content="NCJDVNISLKV";