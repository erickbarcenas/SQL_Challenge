-- Function that consults the product and if it meets the restrictions, 
-- a new record is created in the payment table

CREATE OR REPLACE FUNCTION get_status_product(
	_prod character varying,
	_items_to_buy integer,
	_email character varying
)
RETURNS INTEGER 
AS $$
	DECLARE 
	available boolean;
	total_stock integer;
	user_id integer;
	product_id character varying;
	charge float;
	new_identity integer;
	
	BEGIN
	-- Wondering if the product is available for sale
	 available := (SELECT product.available_for_selling
					FROM food_store.product
					WHERE product LIKE '%' || _prod || '%');
	-- check the total in stock
	total_stock := (SELECT COUNT(product.id) AS total
					FROM food_store.product
					WHERE product LIKE '%' || _prod || '%');
		
		IF available AND total_stock > 0 AND total_stock <= _items_to_buy THEN
		-- if it passes all the restrictions
			user_id := (SELECT id
						FROM food_store.user
						WHERE email = _email);
			product_id := (SELECT product.id
						FROM food_store.product
						WHERE product LIKE '%' || _prod || '%');
						
			charge  := (SELECT product.amount * _items_to_buy
						FROM food_store.product
						WHERE product LIKE '%' || _prod || '%');
		
				
			
            	INSERT INTO food_store.payment (user_id, product_id, amount, created_at) 
				VALUES (user_id::INTEGER, product_id::INTEGER, charge::FLOAT, CURRENT_TIMESTAMP) 
				RETURNING id INTO new_identity;
				RETURN new_identity;
		END IF;

	END;
$$
LANGUAGE 'plpgsql';

-- Example
SELECT get_status_product AS id_payment FROM get_status_product('Lid Coffee Cup 8oz Blk', 1, 'aessexm@symantec.com');


