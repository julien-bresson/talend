SELECT
service.service_id as ID_LOCALISATION,
sales.invoice_date as ID_JOUR,
sales.cust_id as ID_CLIENT,
customer.sales_id as ID_COMMERCIAL,
1 as TYPE,
age_group.age_group_id as ID_TRANCHE,
NOW() as DATE_MVT,
invoice_line.days as NB_JOURS,
invoice_line.nb_guests as NB_INVITES,
service.price*invoice_line.days*invoice_line.nb_guests as PRIX
FROM
customer 
INNER JOIN sales ON customer.cust_id = sales.cust_id
INNER JOIN invoice_line ON sales.inv_id = invoice_line.inv_id
INNER JOIN service ON invoice_line.service_id = service.service_id
INNER JOIN age_group ON customer.age between age_min AND age_max
UNION
SELECT
service.service_id as ID_LOCALISATION,
reservations.res_date as ID_JOUR,
reservations.cust_id as ID_CLIENT,
customer.sales_id as ID_COMMERCIAL,
0 as TYPE,
age_group.age_group_id as ID_TRANCHE,
NOW() as DATE_MVT,
reservation_line.res_days as NB_JOURS,
reservation_line.future_guests as NB_INVITES,
service.price*reservation_line.res_days*reservation_line.future_guests as PRIX
FROM
customer 
INNER JOIN reservations ON customer.cust_id = reservations.cust_id
INNER JOIN reservation_line ON reservations.res_id = reservation_line.res_id
INNER JOIN service ON reservation_line.service_id = service.service_id
INNER JOIN age_group ON customer.age between age_min AND age_max
