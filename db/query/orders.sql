-- name: CreateOrder :one 
INSERT INTO  orders (
    total,
    subtotal,
    taxes,
    paid
) VALUES (
    $1, $2, $3, $4
) RETURNING *;

-- name: GetOrder :one
SELECT  * FROM orders
WHERE id = $1 LIMIT 1;

-- name: ListOrder :many
SELECT * FROM orders
ORDER BY id
LIMIT $1;

DELETE FROM orders
WHERE id = $1;  
