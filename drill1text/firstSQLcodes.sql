USE DB_ZOO
	/* drill 1 */
select * from tbl_habitat

	/* drill 2*/

select species_name from tbl_species where species_order = 3;

    /* drill 3*/

select nutrition_type from tbl_nutrition where nutrition_cost <= 600;

	/* drill 4 */

select 
	a1.species_name, a2.nutrition_id
	from tbl_species a1
	inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition
	where nutrition_id between 2202 and 2206;

		/* drill 5 */

select 
	a1.species_name, a2.nutrition_type
	from tbl_species a1
	inner join tbl_nutrition a2 on a2.nutrition_id = a1.species_nutrition;

		/* drill 6 */

select
	a2.specialist_fname, a2.specialist_lname, a2.specialist_contact
	from tbl_species a1
	inner join tbl_care a3 on a3.care_id = a1.species_care
	inner join tbl_specialist a2 on a2.specialist_id = a3.care_specialist
	where a1.species_name = 'penguin'

	/* drill 7 */



	create database db_sqldrill
	use db_sqldrill

	create table tbl_info (
		info_id int not null primary key,
		info_number varchar(50)	not null,
		info_address varchar(50) not null
		);

	CREATE TABLE tbl_customer (
		customer_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		customer_info_id int not null constraint fk_info_id foreign key references tbl_info(info_id) on update cascade on delete cascade,
		customer_fname VARCHAR(50) NOT NULL,
		customer_lname VARCHAR(50) NOT NULL
	);

	insert into tbl_info
		(info_id, info_number, info_address)
		values
		(1, '555-555-1212', '123 elm st portland, or 12345' ),
		(2, '555-555-1234', '789 maple ave seattle,wa 98765' ),
		(3, '555-555-8888', '456 pine ave spokane, wa 22446')
	;

	insert into tbl_customer 
		(customer_fname, customer_lname, customer_info_id)
		values
		('bob', 'smith', 1),
		('mary', 'jones', 2),
		('jim', 'johnson', 3)
	;
	

	select * from tbl_info
	select * from tbl_customer



	select customer_fname as 'First Name', customer_lname as 'Last Name', info_number as 'Phone', info_address as 'Address'
	
	from tbl_info
		INNER JOIN tbl_customer ON tbl_customer.customer_info_id = tbl_info.info_id
		
		