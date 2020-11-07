-- 1	Counting all packages coming from Vienna (Vienna has office id = 1). Why use office address as source address? -> the sender had to go to the office to send the package, but can live somewhere else. Purpose of sender address is in case it has to be returned.

SELECT COUNT(package_id)
AS 'Packages from Vienna'
FROM package
WHERE package.fk_office_id = 1

-- 2	Selecting all packages on specified date (2020-11-06), displaying name and family name from sender using a join

SELECT sender.first_name, sender.last_name, sending_date
FROM `package` 
INNER JOIN sender
ON sender.sender_id = fk_sender_id
WHERE sending_date = '2020-11-06'

-- 3	Selecting all packages with a price higher than 1000, displaying name of sender (from sender table), price (from measures table) and receiving_date (from package table) and receiver name/family name from its respective table (4 tables in total)

SELECT sender.first_name AS 'Sender name', sender.last_name AS 'family name', measures.price, receiving_date, receiver.first_name AS 'Receiver name' , receiver.last_name  AS 'Receiver family name' 
FROM (((`package` 
	INNER JOIN sender
	ON sender.sender_id = fk_sender_id)
	INNER JOIN measures
	ON measures.measures_id = fk_measures_id)
    INNER JOIN receiver
    ON receiver.receiver_id = fk_receiver_id)
WHERE measures.price > 1000

-- 4	Displaying how many packages have been processed in total (lazy query)

SELECT COUNT(*) FROM package

-- 5	Displaying packages received by Alejandro that have been sent from Vienna (using data from 4 tables)

SELECT receiver.first_name, address.city, sending_date
FROM (((package
      INNER JOIN receiver
      ON receiver.receiver_id = fk_receiver_id)
      INNER JOIN office
      ON office.office_id = fk_office_id)
      INNER JOIN address
      ON office.fk_address_id = address.address_id)
WHERE office.office_id = 1 AND receiver.receiver_id = 1
       
-- 6	Displaying how many packages have been sent between 2020-11-01 and 2020-11-25 (basically this month until 25th)

SELECT COUNT(*)
FROM package
WHERE package.sending_date 
BETWEEN CAST('2020-11-01' AS DATE) AND CAST('2020-11-25' AS DATE);
