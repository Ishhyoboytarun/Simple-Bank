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
    $1 int not null
);

SELECT * FROM sessions
WHERE id = $1 LIMIT 1;