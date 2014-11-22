CREATE TABLE account (
	id bigint auto_increment,
	firstname varchar(50) NOT NULL,
	lastname varchar(50) NOT NULL,
	address varchar(250),
	city varchar(50),
	country varchar(50),
	state varchar(50),
	phone varchar(50),
	email varchar(100) NOT NULL UNIQUE,
	password char(60) NOT NULL,
	active boolean NOT NULL DEFAULT 0,
	visible boolean NOT NULL DEFAULT 1,
	primary key (id)
);

CREATE TABLE authority (
	id bigint auto_increment,
	email varchar(50),
	role varchar(20) NOT NULL,
	primary key (id),
	foreign key (email) references account(email) on delete cascade on update cascade
);

CREATE TABLE job_listing (
	id bigint auto_increment,
	email varchar(50),
	position varchar(50) NOT NULL,
	company_name varchar(50) NOT NULL,
	job_description varchar(2000) NOT NULL,
	job_location varchar(50) NOT NULL,
	posted_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	active boolean NOT NULL DEFAULT 1,
	primary key (id),
	foreign key (email) references account(email) on delete cascade on update cascade
);

create table persistent_logins (
	username varchar(50) NOT NULL, 
	series varchar(64) primary key, 
	token varchar(64) not null, 
	last_used timestamp not null
);

drop table persistent_logins;
drop table job_listing;
drop table auhority;
drop table account;
