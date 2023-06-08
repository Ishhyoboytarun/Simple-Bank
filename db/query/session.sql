-- name: CreateSession :one
INSERT INTO sessions (
    id,
    username,
    refresh_token,
    user_agent,
    client_ip,
    is_blocked,
    expires_at
) VALUES (
             $1, $2, $3, $4, $5, $6, $7
         ) RETURNING *;

-- name: GetSession :one
create table sessions
(
    id int not null,
    $1 int not null,
    username varchar,
    $2 int not null,
    refresh_token varchar,
    $3 int not null,
    user_agent varchar,
    $4 int not null,
    client_ip varchar,
    $5 int not null,
    is_blocked bool,
    $6 int not null,
    expires_at timestamp,
    $7 int not null
);

SELECT * FROM sessions
WHERE id = $1 LIMIT 1;