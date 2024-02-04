# Задание
Дано два csv-файла с данными о клиентах [customer.csv](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/customer.csv) и их транзакциях [transaction.csv](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/transaction.csv).  
Необходимо выполнить следующее:  
Создать таблицы со следующими структурами и загрузить данные из csv-файлов. Детали приведены ниже.  
Выполнить следующие запросы:  
(1 балл) Вывести все уникальные бренды, у которых стандартная стоимость выше 1500 долларов.  
(1 балл) Вывести все подтвержденные транзакции за период '2017-04-01' по '2017-04-09' включительно.  
(1 балл) Вывести все профессии у клиентов из сферы IT или Financial Services, которые начинаются с фразы 'Senior'.  
(1 балл) Вывести все бренды, которые закупают клиенты, работающие в сфере Financial Services  
(1 балл) Вывести 10 клиентов, которые оформили онлайн-заказ продукции из брендов 'Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles'.  
(1 балл) Вывести всех клиентов, у которых нет транзакций.  
(2 балла) Вывести всех клиентов из IT, у которых транзакции с максимальной стандартной стоимостью.  
(2 балла) Вывести всех клиентов из сферы IT и Health, у которых есть подтвержденные транзакции за период '2017-07-07' по '2017-07-17'.  

# Решение

Скрипт решения [Vyatkin_Roman_hw2.sql](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/Vyatkin_Roman_hw2.sql)  
* Вывести все уникальные бренды, у которых стандартная стоимость выше 1500 долларов.  
![plot]('https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/unique_brand.JPG?raw=true)  
* Вывести все подтвержденные транзакции за период '2017-04-01' по '2017-04-09' включительно.  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/approved_betwen_date.JPG)  
* Вывести все профессии у клиентов из сферы IT или Financial Services, которые начинаются с фразы 'Senior'.  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/seniors.JPG)   
* Вывести все бренды, которые закупают клиенты, работающие в сфере Financial Services  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/financial_brand.JPG)  
* Вывести 10 клиентов, которые оформили онлайн-заказ продукции из брендов 'Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles'.  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/ten_online.JPG)  
* Вывести всех клиентов, у которых нет транзакций.  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/without_transaction.JPG)  
* Вывести всех клиентов из IT, у которых транзакции с максимальной стандартной стоимостью.  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/IT_max_cost_trans.JPG)  
* Вывести всех клиентов из сферы IT и Health, у которых есть подтвержденные транзакции за период '2017-07-07' по '2017-07-17'.  
![plot](https://github.com/Niktyav/mipt_ds_sspd/tree/main/HW2/IT_health_with_transaction.JPG)  





       



    



