Create Table category(
	category_id VARCHAR(10) PRIMARY KEY NOT NULL,
	category VARCHAR(50)
);

Select * from category;

Create Table subcategory(
	subcategory_id VARCHAR(10) PRIMARY KEY NOT NULL,
	subcategory VARCHAR(50)
);

Select * from subcategory;

Create Table contacts(
	contact_id INT PRIMARY KEY NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50)
);

Select * from contacts;

CREATE TABLE campaign(
	cf_id INT PRIMARY KEY NOT NULL,
	contact_id INT,
	company_name VARCHAR(50),
	description VARCHAR(255),
	goal FLOAT,
	pledged FLOAT,
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

Select * from campaign;