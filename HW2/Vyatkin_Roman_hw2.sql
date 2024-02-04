create  table customers( 
customer_id  integer PRIMARY KEY,
first_name text,
last_name text,
gender text,
DOB varchar(10),
job_title text,
job_industry_category text,
wealth_segment text,
deceased_indicator text, 
owns_car text,
address text,
postcode integer,
state text,
country text,
property_valuation integer
);


create  table transactions( 
transaction_id integer PRIMARY KEY,
product_id integer,
customer_id integer,
transaction_date varchar(10),
online_order bool,
order_status text,
brand text,
product_line text,
product_class text,
product_size text,
list_price float(4),
standard_cost float(4)
);

--Вывести все уникальные бренды, у которых стандартная стоимость выше 1500 долларов.
select distinct  brand from transactions where  standard_cost>1500;

-- Вывести все подтвержденные транзакции за период '2017-04-01' по '2017-04-09' включительно.
select * from transactions where  (transaction_date::date >= '2017-04-01'::date and transaction_date::date  <=  '2017-04-09'::date) and order_status = 'Approved';

--Вывести все профессии у клиентов из сферы IT или Financial Services, которые начинаются с фразы 'Senior'.
select distinct  job_title from customers where (job_title like 'Senior%') and (job_industry_category = 'IT' or job_industry_category = 'Financial Services')

--Вывести все бренды, которые закупают клиенты, работающие в сфере Financial Services
select distinct t.brand, c.job_industry_category  from  transactions t   inner join customers c on c.customer_id = t.customer_id where c.job_industry_category = 'Financial Services' and t.brand like '_%';

-- Вывести 10 клиентов, которые оформили онлайн-заказ продукции из брендов 'Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles'.
select  c.customer_id ,c.first_name,c.last_name, c.job_title,t.transaction_date,t.brand,t.online_order  from  transactions t   FULL OUTER JOIN 
      customers c on c.customer_id = t.customer_id where t.brand in  ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')  and t.online_order  limit 10;

-- Вывести всех клиентов, у которых нет транзакций.
select  c.customer_id ,c.first_name,c.last_name, c.job_title,t.transaction_date  from  transactions t   FULL OUTER JOIN customers c on c.customer_id = t.customer_id where t.transaction_id is null;

--Вывести всех клиентов из IT, у которых транзакции с максимальной стандартной стоимостью.
select distinct  c.customer_id ,c.first_name,c.last_name, c.job_title,c.job_industry_category ,t.standard_cost  from  transactions t   LEFT JOIN customers c on c.customer_id = t.customer_id 
                 where c.job_industry_category = 'IT' and t.standard_cost = (select max(standard_cost) from transactions);

--Вывести всех клиентов из сферы IT и Health, у которых есть подтвержденные транзакции за период '2017-07-07' по '2017-07-17'.
select  c.customer_id ,c.first_name,c.last_name, c.job_title,t.transaction_date,t.brand,t.online_order,t.transaction_id  from  transactions t   FULL OUTER JOIN 
      customers c on c.customer_id = t.customer_id where c.job_industry_category  in  ('IT', 'Health')  and t.order_status = 'Approved' and 
     (t.transaction_date::date >= '2017-07-07'::date and t.transaction_date::date  <  '2017-07-17'::date);
