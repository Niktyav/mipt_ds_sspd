---Вывести распределение (количество) клиентов по сферам деятельности, отсортировав результат по убыванию количества.

select job_industry_category, count(*) as client_cnt 
		from  customer_20240101 c 
		group by job_industry_category 
		order by client_cnt;



--Найти сумму транзакций за каждый месяц по сферам деятельности, отсортировав по месяцам и по сфере деятельности. — (1 балл)
select date_trunc('month', t.transaction_date::date) AS txn_month,c.job_industry_category , sum(t.list_price)  as transact_sum  
		from transaction_20240101 t 
		left join customer_20240101 c 
			on t.customer_id = c.customer_id 
		group by txn_month,c.job_industry_category 
		order by txn_month , c.job_industry_category  ;
	
	
--Вывести количество онлайн-заказов для всех брендов в рамках подтвержденных заказов клиентов из сферы IT. — (1 балл)
select t.brand, count(*) 
		from 	transaction_20240101 t 
		join customer_20240101 c 
			on t.customer_id = c.customer_id 
		where  t.online_order = 'True' and c.job_industry_category = 'IT'
		group by t.brand;
		
	
--Найти по всем клиентам сумму всех транзакций (list_price), максимум, минимум и количество транзакций, 
--отсортировав результат по убыванию суммы транзакций и количества клиентов. 
--Выполните двумя способами: используя только group by и используя только оконные функции. Сравните результат. — (2 балла)
select t.customer_id, sum(t.list_price) as tsum ,max(t.list_price) as tmax ,min(t.list_price) as tmin,count(t.list_price) as tcnt  
		from 	transaction_20240101 t 
		group by t.customer_id 
		order by tsum desc, tcnt desc  
	
select  t.customer_id, 
        sum(t.list_price) over (partition by customer_id) as tsum 
        ,max(t.list_price) over (partition by customer_id) as tmax 
        ,min(t.list_price) over (partition by customer_id) as tmin
        ,count(t.list_price) over (partition by customer_id) as tcnt  
		from 	transaction_20240101 t 
		order by tsum desc, tcnt desc  
	
	
--Найти имена и фамилии клиентов с минимальной/максимальной суммой транзакций за весь период (сумма транзакций не может быть null). Напишите отдельные запросы для минимальной и максимальной суммы. — (2 балла)
select t.customer_id, c.first_name ,c.last_name , sum(t.list_price) as tsum
		from 	transaction_20240101 t 
		join customer_20240101 c 
			on t.customer_id = c.customer_id 
		group by t.customer_id,c.first_name ,c.last_name 
		order by tsum
		limit 1
		
select t.customer_id, c.first_name ,c.last_name , sum(t.list_price) as tsum
		from 	transaction_20240101 t 
		join customer_20240101 c 
			on t.customer_id = c.customer_id 
		group by t.customer_id,c.first_name ,c.last_name 
		order by tsum desc 
		limit 1		

--Вывести только самые первые транзакции клиентов. Решить с помощью оконных функций. — (1 балл)
select  t.customer_id
        ,first_value (t.list_price) over (partition by customer_id) as tfirst 
        ,first_value (t.transaction_date) over (partition by customer_id) as dfirst 
        ,t.transaction_date
		from 	transaction_20240101 t 
		
		
--Вывести имена, фамилии и профессии клиентов, между транзакциями которых был максимальный интервал (интервал вычисляется в днях) — (2 балла).
drop view trans_interval;

create view  trans_interval as  
	select t.customer_id, c.first_name ,c.last_name, c.job_title
		, last_value(t.transaction_date::date) over (partition by t.customer_id order by t.transaction_date::date range between current row and unbounded following) as last_t
		,first_value (t.transaction_date::date)  over (partition by t.customer_id order by t.transaction_date::date) as first_t
		,t.transaction_date
		from 	transaction_20240101 t 
		join customer_20240101 c 
			on t.customer_id = c.customer_id 

select   *, last_t::date -first_t::date as t_interv  from  trans_interval order by t_interv desc;