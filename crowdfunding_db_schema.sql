--Create the tables in the correct order
--Campaign table last, will have foreign keys from the other tables

Create Table category(
	category_id VARCHAR(10) PRIMARY KEY NOT NULL,
	category VARCHAR(50)
);

Create Table subcategory(
	subcategory_id VARCHAR(10) PRIMARY KEY NOT NULL,
	subcategory VARCHAR(50)
);

Create Table contacts(
	contact_id INT PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50)
);

CREATE TABLE campaign(
	cf_id INT PRIMARY KEY NOT NULL,
	contact_id INT,
	company_name VARCHAR(50),
	description VARCHAR(50),
	goal INT,
	pledged INT,
	outcome VARCHAR(20),
	backers_count INT,
	country VARCHAR(5),
	currency VARCHAR(5),
	launch_date DATE,
	end_date DATE,
	category VARCHAR(50),
	subcategory VARCHAR(50),
	category_id VARCHAR(10),
	subcategory_id VARCHAR(10),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- Code to for ERD generation in Lucid
SET enable_nestloop=0;SELECT 'postgresql' AS dbms,t.table_catalog,t.table_schema,t.table_name,c.column_name,c.ordinal_position,c.data_type,c.character_maximum_length,n.constraint_type,k2.table_schema,k2.table_name,k2.column_name FROM information_schema.tables t NATURAL LEFT JOIN information_schema.columns c LEFT JOIN(information_schema.key_column_usage k NATURAL JOIN information_schema.table_constraints n NATURAL LEFT JOIN information_schema.referential_constraints r)ON c.table_catalog=k.table_catalog AND c.table_schema=k.table_schema AND c.table_name=k.table_name AND c.column_name=k.column_name LEFT JOIN information_schema.key_column_usage k2 ON k.position_in_unique_constraint=k2.ordinal_position AND r.unique_constraint_catalog=k2.constraint_catalog AND r.unique_constraint_schema=k2.constraint_schema AND r.unique_constraint_name=k2.constraint_name WHERE t.TABLE_TYPE='BASE TABLE' AND t.table_schema NOT IN('information_schema','pg_catalog');