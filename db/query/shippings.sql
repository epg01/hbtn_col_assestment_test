-- name: CreateShipping :one 
INSERT INTO  shippings (
    address,
    city,
    state,
    country,
    cost
) VALUES (
    $1, $2, $3, $4, $5
) RETURNING *;

-- name: GetShipping :one
SELECT  * FROM shippings
WHERE id = $1 LIMIT 1;

-- name: ListShipping :many
SELECT * FROM shippings
ORDER BY id
LIMIT $1;

-- name: UpdateShipping :one
UPDATE shippings
SET city = $2
WHERE id = $1
RETURNING *;

DELETE FROM shippings
WHERE id = $1;  
