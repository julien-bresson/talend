select distinct
invoice_date,
DAYNAME(invoice_date) as nom_jour,
DAYOFMONTH(invoice_date) as numero_jour,
MONTHNAME(invoice_date) as mois,
MONTH(invoice_date) as numero_mois,
FLOOR((QUARTER(invoice_date)+1)/2) as semestre,
YEAR(invoice_date) as annee
FROM club.sales
UNION
select distinct
res_date,
DAYNAME(res_date) as nom_jour,
DAYOFMONTH(res_date) as numero_jour,
MONTHNAME(res_date) as mois,
MONTH(res_date) as numero_mois,
FLOOR((QUARTER(res_date)+1)/2) as semestre,
YEAR(res_date) as annee
FROM club.reservations;