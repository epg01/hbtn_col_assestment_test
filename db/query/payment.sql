-- name: CreatePayment :one 
INSERT INTO  payment (
    type,
    txn_id,
    total
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetPayment :one
SELECT  * FROM payment
WHERE id = $1 LIMIT 1;

-- name: ListPpayment :many
SELECT * FROM payment
ORDER BY id
LIMIT $1;

DELETE FROM payment
WHERE id = $1;  
