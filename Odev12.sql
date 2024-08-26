
--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT count(*) as film_sayısı FROM film
where length > ALL 
(
  SELECT AVG(length) as AVGLEN FROM film
);
--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*) AS film_sayisi FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) as max_rental FROM film); 
--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT title,rental_rate,replacement_cost FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) AS min_r FROM film )
AND replacement_cost = (SELECT MIN(replacement_cost) AS min_c FROM film);

--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT payment.customer_id, first_name,last_name,amount
FROM payment 
INNER JOIN customer ON customer.customer_id = payment.customer_id
where amount = (SELECT MAX(amount) as AMOUNT FROM payment);

