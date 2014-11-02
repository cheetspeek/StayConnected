CREATE TABLE account (
	id bigint auto_increment,
	firstname varchar(20) NOT NULL,
	lastname varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	password char(40) NOT NULL,
	primary key (id)
);

CREATE TABLE role (
	id bigint auto_increment,
	account_id bigint,
	role varchar(20) NOT NULL,
	primary key (id),
	foreign key (account_id) references account(id) 
		on delete cascade on update cascade
);

CREATE TABLE job_listing (
	id bigint auto_increment,
	account_id bigint,
	position varchar(20) NOT NULL,
	job_name varchar(20) NOT NULL,
	job_description varchar(50) NOT NULL,
	job_location varchar(20) NOT NULL,
	primary key (id),
	foreign key (account_id) references account(id) 
		on delete cascade on update cascade
);


drop table role;
drop table job_listing;
drop table account;
