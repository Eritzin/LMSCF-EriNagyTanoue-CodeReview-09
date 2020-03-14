1. Report:

How many packages/mails were registered ?

SELECT COUNT(*) AS number_of_registration 
FROM registration 
WHERE registration.registration_id

Result:

number_of_registration
3


2. Report:

Who work at which post office branch ?

SELECT employee.first_name,employee.last_name,branch_name
FROM employee
INNER JOIN post_office_branch on employee.fk_branch_id=post_office_branch.branch_id;

Result:

first_name last_name branch_name
Melissa    Banks     postoffice_center
Anna       Morales   postoffice_meidling
Vincent    Martinez  postoffice_south
Jerry      Morales   postoffice_center
Joan       Gardner   postoffice_meidling
Larry      Kelley    postoffice_south
Kathryn    Gilbert   postoffice_center


3. Report:

Who received items? 

SELECT package_mail.item_id,employee.first_name,employee.last_name
FROM package_mail
INNER JOIN registration on package_mail.item_id =registration.fk_item
INNER JOIN employee on registration.fk_reg_emp_id=employee.emp_id;

Result:
item_id first_name last_name
1       Melissa    Banks
2       Melissa    Banks
3       Melissa    Banks





4. Report:

Which packages will be delivered to JAPAN ?

SELECT package_mail.item_id
FROM package_mail 
WHERE fk_recipient_id IN 
(SELECT recipient_id 
 FROM recipient 
 WHERE fk_post_code IN 
 (SELECT post_code 
  FROM post_code 
  WHERE fk_country_code IN
  (SELECT country.country_code
  FROM country WHERE country.country_code="JP")
  ));


Result:

item_id
3
1


5. Report:

How many packages will be derivered to postcode 1030 ?

SELECT COUNT(*)AS number_of_packages_1030
FROM package_mail
WHERE fk_recipient_id IN
(SELECT recipient_id 
 FROM recipient WHERE recipient.fk_post_code="1030");

Result :
number_of_packages_1030
4


6. Report:
How many items were registerd on "2020-03-14" and got delivered on"2020-03-14"?

SELECT COUNT(*) AS "number_of_delivered_package_on_2020-03-14"
FROM registration
WHERE DATE(registration.deposit_timedate)="2020-03-14" 
 AND registration.fk_item IN
(SELECT delivery.fk_item_id
FROM delivery WHERE DATE(delivery.delivery_timedate)="2020-03-14" )

Result:

number_of_delivered_package_on_2020-03-14
1