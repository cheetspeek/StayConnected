CREATE TABLE account (
    id bigint auto_increment,
	firstname varchar(20) NOT NULL,
	lastname varchar(20) NOT NULL,
	email varchar(50) NOT NULL,
	password char(40) NOT NULL,
	active boolean NOT NULL DEFAULT 0,
	primary key (email)
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
	position varchar(20) NOT NULL,
	job_name varchar(20) NOT NULL,
	job_description varchar(50) NOT NULL,
	job_location varchar(20) NOT NULL,
	active boolean NOT NULL DEFAULT 1,
	primary key (id),
	foreign key (email) references account(email) on delete cascade on update cascade
);


drop table role;
drop table job_listing;
drop table account;
