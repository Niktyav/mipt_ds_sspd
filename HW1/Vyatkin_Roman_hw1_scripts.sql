create database customer_and_transaction;

CREATE TABLE "Transactions" (
  "id" integer PRIMARY KEY,
  "product_id" integer not null,
  "customer_id" integer not null,
  "transaction_date" varchar(10) not null,
  "online_order" boolean,
  "order_status_id" integer not null
);

CREATE TABLE "Products" (
  "id" integer PRIMARY KEY,
  "prodict_id" integer,
  "brand_id" integer,
  "product_line_id" integer,
  "product_class_id" integer,
  "product_size_id" integer,
  "list_price" float(4) not null,
  "standard_cost" float(4)
);

CREATE TABLE "Customers" (
  "id" integer PRIMARY KEY,
  "first_name" text,
  "last_name" text,
  "gender" varchar(10),
  "DOB" varchar(10),
  "job_title" text,
  "job_industry_category_id" integer not null,
  "wealth_segment_id" integer not null,
  "deceased_indicator" bool not null,
  "owns_car" bool not null,
  "property_valuation" integer,
  "address" text not null,
  "postcode" integer not null,
  "state_id" integer not null,
  "country_id" integer not null
);

CREATE TABLE "order_statuses" (
  "id" integer PRIMARY KEY,
  "name" text
);

insert into order_statuses values (1,'Approved'), (2,'Cancelled');

CREATE TABLE "job_industry_categories" (
  "id" integer PRIMARY KEY,
  "name" text
);
insert into job_industry_categories values (1,'Argiculture'), (2,'Entertainment'),
 			(3,'Financial Services'), (4,'Health'), (5,'IT'), (6,'Manufacturing'),
 			(7,'n/a'), (8,'Property'), (9,'Retail'), (10,'Telecommunications');

CREATE TABLE "wealth_segments" (
  "id" integer PRIMARY KEY,
  "name" text
);
insert into wealth_segments values (1,'Affluent Customer'), (2,'High Net Worth'),
 			(3,'Mass Customer'); 

CREATE TABLE "states" (
  "id" integer PRIMARY KEY,
  "name" text
);
insert into states values (1,'New South Wales'), (2,'NSW'),
 			(3,'QLD'), (4,'VIC'), (5,'Victoria');
 			
 			
 			
CREATE TABLE "countries" (
  "id" integer PRIMARY KEY,
  "name" text
);

insert into countries values (1,'Australia');
 			
CREATE TABLE "brands" (
  "id" integer PRIMARY KEY,
  "name" text
);

insert into brands values (1,'Giant Bicycles'), (2,'Norco Bicycles'),
 			(3,'OHM Cycles'), (4,'Solex'), (5,'Trek Bicycles'),
 			(6,'va'),(7,'WeareA2B');
 			
CREATE TABLE "product_lines" (
  "id" integer PRIMARY KEY,
  "name" text
);
insert into product_lines values (1,'Mountain'), (2,'Road'),
 			(3,'Standard'), (4,'Touring');

CREATE TABLE "product_classes" (
  "id" integer PRIMARY KEY,
  "name" text
);

insert into product_classes values (1,'high'), (2,'low'),
 			(3,'medium');

CREATE TABLE "product_sizes" (
  "id" integer PRIMARY KEY,
  "name" text
);

insert into product_sizes values (1,'large'), (2,'medium'),
 			(3,'small');
 			
ALTER TABLE "Transactions" ADD FOREIGN KEY ("order_status_id") REFERENCES "order_statuses" ("id");

ALTER TABLE "Customers" ADD FOREIGN KEY ("wealth_segment_id") REFERENCES "wealth_segments" ("id");

ALTER TABLE "Customers" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "Products" ADD FOREIGN KEY ("brand_id") REFERENCES "brands" ("id");

ALTER TABLE "Products" ADD FOREIGN KEY ("product_line_id") REFERENCES "product_lines" ("id");

ALTER TABLE "Products" ADD FOREIGN KEY ("product_size_id") REFERENCES "product_sizes" ("id");

ALTER TABLE "Products" ADD FOREIGN KEY ("product_class_id") REFERENCES "product_classes" ("id");

ALTER TABLE "Customers" ADD FOREIGN KEY ("state_id") REFERENCES "states" ("id");

ALTER TABLE "Transactions" ADD FOREIGN KEY ("customer_id") REFERENCES "Customers" ("id");

ALTER TABLE "Customers" ADD FOREIGN KEY ("job_industry_category_id") REFERENCES "job_industry_categories" ("id");

ALTER TABLE "Transactions" ADD FOREIGN KEY ("product_id") REFERENCES "Products" ("id");




insert into "Customers"  values 
   (648,'Gardiner','Nutley','Male','1978-06-04','Accountant II',3,3,false,	true,3,'36360 Coleman Trail',	3850, 5,1),
   (628,'Mallissa','Gillespie','Female','24.10.1981','Actuary',3,3,false,false,	8,'725 Cordelia Junction',	3028, 5, 1);

insert into "Products"  values 
   (104,92,2,3,3,3,1415.01,1259.36),
   (105,28,2,3,3,3,1216.14,1082.36),
   (106,42,3,2,3,3,1810,1610.90);

insert into "Transactions"  values 
   (152,104,648,'16.10.2017',false,1),
   (5107,104,648,'29.08.2017',false,1),
   (3131,105,628,'06.03.2017',true,1),
   (16501,106,628,'06.11.2017',true,1);