create database Restaurant_Management_System
use Restaurant_Management_System
----Table 1
create table Restaurant(RestaurantName varchar(100) primary key,Address varchar(100),phone varchar(50))
insert into Restaurant values('Karachi Fast Food','Bahria Town Link, Phase 2 Gulrez Housing Scheme, Rawalpindi, Punjab','+923428194200')
insert into Restaurant values('Tipu Karachi Fast Food Branch#3','Jalal Arcade, Block A Police Foundation, Islamabad, Punjab','+923055173970')
insert into Restaurant values('KARACHI CRISPY','Baghbanpura, Lahore, Punjab 54000','+923094528005')
select * from Restaurant

----Table 2
create table Employee(EmployeeID int primary key, EmployeeName varchar(30),address varchar(100),phone varchar(30),PositionID int,
foreign key(PositionID) references Positions(PositionID),salary int)
insert into Employee values(900,'amad','uqaili','+92321671890',1,200000)
insert into Employee values(903,'furkan','steel town','+9272656890',3,20000)
insert into Employee values(904,'aneesh','gulshan','+9272656890',3,10000)
insert into Employee values(905,'sooraj','nippa','+9272656890',3,12000)
insert into Employee values(901,'arsalan','gora bari','+92321671890',1,30000)
insert into Employee values(902,'hassam','germon chahai','+92451787890',2,10000000)
insert into Employee values(906,'ashan','saddar','+92327671890',4,30000)
insert into Employee values(909,'saif','lalkoti','+923215217890',6,15000)
insert into Employee values(910,'usman','quaidabad','+924315677890',6,15000)
insert into Employee values(907,'mariyam','qazi','+92321675690',5,15000)
insert into Employee values(908,'mahnoor','chapphai','+923209677890',6,15000)
insert into Employee values(911,'mohsin','defence','+923521871890',7,20000)
insert into Employee values(912,'moiz','islampur','+923521631890',7,20000)
insert into Employee values(913,'amir','nathia gali','+923521551890',7,20000)
select * from Employee
--select those employees whose name starts with letter 'a' or 'm'
select * from Employee where EmployeeName like 'a%' or EmployeeName like 'm%'
--display all the waiters
select * from Employee where PositionID = 3
--- Table 3
create table Positions(PositionID int identity(1,1) primary key,Positiontitle varchar(30))
insert into Positions values ('chef')
insert into Positions values ('manager')
insert into Positions values ('waiter')
insert into Positions values ('accountant')
insert into Positions values ('sweeper')
insert into Positions values ('Utensils Cleaner')
insert into Positions values ('delivery boy')
select * from Positions
drop table Positions
--simple join
select * from Positions p
join Employee e
on p.PositionID = e.PositionID

--Table 4
create table MenuItems(MenuID int identity(1,1) primary key,ItemName varchar(30))
insert into MenuItems values('karahi')
insert into MenuItems values('biryani')
insert into MenuItems values('tikka')
select * from MenuItems

--apply joins
select mi.MenuID,mi.ItemName,od.MenuID,od.amount*od.ItemQuantity as amount,
od.OrderID,od.ItemQuantity from MenuItems mi
join OrdersDetails od
on mi.MenuID=od.MenuID
--apply views 

create view Menucard as 
select mi.ItemName,od.MenuID,od.amount*od.ItemQuantity as amount,
od.OrderID,od.ItemQuantity from MenuItems mi
join OrdersDetails od
on mi.MenuID=od.MenuID
select * from Menucard

--Table 5
 create  table DiningTableStatus(statusID int primary key, status varchar(30))
 insert into DiningTableStatus values(1,'Available')
 insert into DiningTableStatus values(2,'Not available')
 select * from DiningTableStatus
 drop table DiningTableStatus
 --apply joins
 select * from DiningTableStatus dts
 join DiningTable dt
 on dts.statusID=dt.statusID

 --Table 6
create table DiningTable(DiningTableID int primary key,chairs int,statusID int,
foreign key(statusID) references DiningTableStatus(statusID))
 --trigger on row1:
 insert into DiningTable values(5,25,2)
 insert into DiningTable values(1,5,1)
 insert into DiningTable values(2,5,1)
 insert into DiningTable values(3,4,1)
 --displays total no of chairs on all dining tables
 select sum(chairs) as totalchairs from DiningTable
 select * from DiningTable
 drop table DiningTable
 --insert trigger
 CREATE TRIGGER t1
ON DiningTable
FOR INSERT
AS
IF (SELECT chairs From inserted) > 20
BEGIN
PRINT 'No more chairs can be added..'
ROLLBACK TRANSACTION
END
 
-----Table 7
create table OrdersDetails(MenuID int,foreign key(MenuID) references MenuItems(MenuID),
ItemQuantity int,
amount int,
OrderID int
foreign key(OrderID) references Orders(OrderID)
)
insert into OrdersDetails values(1,3,1800,1)
insert into OrdersDetails values(2,3,300,2)
insert into OrdersDetails values(3,3,250,3)
insert into OrdersDetails values(1,2,1800,4)
insert into OrdersDetails values(1,1,300,5)
insert into OrdersDetails values(2,6,250,6)
insert into OrdersDetails values(3,3,1800,7)
insert into OrdersDetails values(2,2,300,8)
insert into OrdersDetails values(3,1,250,9)
insert into OrdersDetails values(3,7,1800,10)
insert into OrdersDetails values(1,9,300,11)
insert into OrdersDetails values(1,3,250,12)
insert into OrdersDetails values(2,12,1800,13)
insert into OrdersDetails values(2,5,300,14)
select MenuID,ItemQuantity,amount*ItemQuantity as amount,OrderID from OrdersDetails 
drop table OrdersDetails
---Table 8
create table Orders(OrderID int identity(1,1) primary key,OrderDate DateTime,OrderTypeID int ,
foreign key(OrderTypeID) references OrdersType(OrderTypeID))
insert into Orders values(GETDATE(),1)
insert into Orders values(GETDATE(),1)
insert into Orders values(getdate(),1)
insert into Orders values(GETDATE(),2)
insert into Orders values(GETDATE(),2)
insert into Orders values(getdate(),2)
insert into Orders values(GETDATE(),3)
insert into Orders values(GETDATE(),3)
insert into Orders values(getdate(),3)
insert into Orders values(GETDATE(),4)
insert into Orders values(GETDATE(),4)
insert into Orders values(getdate(),4)
insert into Orders values(GETDATE(),5)
insert into Orders values(GETDATE(),5)
select *  from Orders
drop table Orders
--apply joins
 select od.ItemQuantity,od.amount*od.ItemQuantity as amount,o.OrderDate from Orders o
 join OrdersDetails od
 on o.OrderID=od.OrderID

--Table 9
create table OrdersType(OrderTypeID int primary key,OrderTypeName varchar(30))
insert into OrdersType values(1,'Barbeque')
insert into OrdersType values(2,'Fast Food')
insert into OrdersType values(3,'Chinese')
insert into OrdersType values(4,'Sea Food')
insert into OrdersType values(5,'Pakistani Food')
select * from OrdersType
drop table OrdersType
--arrange orderType name in ascending order
select * from OrdersType order by OrderTypeName
--apply joins
 select * from OrdersType ot
 join Orders os
 on ot.OrderTypeID=os.OrderTypeID

--Table 10
create table Customers(customerID int primary key,customerName varchar(30),address varchar(30),phone varchar(30),
MenuID int,foreign key(MenuID) references MenuItems(MenuID))
select * from Customers  
drop table Customers
--join
select * from MenuItems mi
join Customers cu
on mi.MenuID=cu.MenuID

drop table Customers
--count the total no of customers
select count(customerID) as totalCustomers from Customers
--arrange the customers in ascending order
select * from Customers order by CustomerName
--apply join
select * from Customers c
join Reservation r
on c.customerID=r.customerID

--apply views
create view Customer as
select c.customerID,MenuID,DiningTableID from Customers c
join Reservation r
on c.customerID=r.customerID
select * from Customer

--Table 11
create table Reservation(ReservationID int,
ReservationDate datetime,
customerID int,
foreign key (customerID) references Customers(customerID),
DiningTableID int,
foreign key (DiningTableID) references DiningTable(DiningTableID)
)
insert into Reservation values (1,GETDATE(),1,1)
insert into Reservation values (1,GETDATE(),2,1)
insert into Reservation values (1,GETDATE(),3,1)
insert into Reservation values (1,GETDATE(),4,1)
insert into Reservation values (1,GETDATE(),5,1)
insert into Reservation values (2,GETDATE(),6,2)
insert into Reservation values (2,GETDATE(),7,2)
insert into Reservation values (2,GETDATE(),8,2)
insert into Reservation values (2,GETDATE(),9,2)
insert into Reservation values (2,GETDATE(),10,2)
insert into Reservation values (3,GETDATE(),11,3)
insert into Reservation values (3,GETDATE(),12,3)
insert into Reservation values (3,GETDATE(),13,3)
insert into Reservation values (3,GETDATE(),14,3)
select * from Reservation
drop table Reservation
--display all customers on dining table 1 and 3
select * from Reservation where DiningTableID IN(1,3)
--delete trigger
delete from Reservation where customerID=11

CREATE TRIGGER t2
ON Reservation
FOR DELETE
AS
IF 11 IN (SELECT customerID FROM deleted)
BEGIN
PRINT 'Reserved customer!!!,user cannot cancel this booking'
ROLLBACK TRANSACTION
END
drop trigger t2

--Table 12
create table DeliveryTrack(serial int primary key,estimatedTime datetime,
customerID int,
foreign key (customerID) references Customers(customerID),
BillID int
)
insert into DeliveryTrack values(1,GETDATE(),1,1)
insert into DeliveryTrack values(2,GETDATE(),2,2)
insert into DeliveryTrack values(3,GETDATE(),3,3)
insert into DeliveryTrack values(4,GETDATE(),4,4)
insert into DeliveryTrack values(5,GETDATE(),5,5)
insert into DeliveryTrack values(6,GETDATE(),6,6)
insert into DeliveryTrack values(7,GETDATE(),7,7)
insert into DeliveryTrack values(8,GETDATE(),8,8)
insert into DeliveryTrack values(9,GETDATE(),9,9)
insert into DeliveryTrack values(10,GETDATE(),10,10)
insert into DeliveryTrack values(11,GETDATE(),11,11)
insert into DeliveryTrack values(12,GETDATE(),12,12)
insert into DeliveryTrack values(13,GETDATE(),13,13)
insert into DeliveryTrack values(14,GETDATE(),14,14)
select * from DeliveryTrack
drop table DeliveryTrack

--Table 13
create table Bills(BillID int,
OrderID int,
foreign key(OrderID) references Orders(OrderID),
BillDate datetime,
amount int,
discount float
)
insert into Bills VALUES(1,1,GETDATE(),2700,0.1)
insert into Bills VALUES(1,2,GETDATE(),240,0.1)
insert into Bills VALUES(1,3,GETDATE(),300,0.1)
insert into Bills VALUES(1,4,GETDATE(),1800,0.1)
insert into Bills VALUES(1,5,GETDATE(),80,0.1)
insert into Bills VALUES(2,6,GETDATE(),600,0.1)
insert into Bills VALUES(2,7,GETDATE(),2700,0.1)
insert into Bills VALUES(2,8,GETDATE(),160,0.1)
insert into Bills VALUES(2,9,GETDATE(),100,0.1)
insert into Bills VALUES(2,10,GETDATE(),6300,0.1)
insert into Bills VALUES(3,11,GETDATE(),720,0.1)
insert into Bills VALUES(3,12,GETDATE(),300,0.1)
insert into Bills VALUES(3,13,GETDATE(),10800,0.1)
insert into Bills VALUES(3,14,GETDATE(),400,0.1)
select count(BillID) as NoOfBills,count(OrderID) as NoOfOrders,max(BillDate) as bill_date,
sum(amount) as amount,sum(amount*discount) as discount from Bills where OrderID between 1 and 5
UNION All
select count(BillID) as NoOfBills,count(OrderID) as NoOfOrders,max(BillDate) as bill_date,
sum(amount) as amount,sum(amount*discount) as discount from Bills where OrderID between 6 and 10
UNION All
select count(BillID) as NoOfBills,count(OrderID) as NoOfOrders,max(BillDate) as bill_date,
sum(amount) as amount,sum(amount*discount) as discount from Bills where OrderID between 11 and 14
--display the highest and lowest bill paid
select MAX(amount)as highest,MIN(amount) as lowest from Bills
drop table Bills
--update trigger
update Bills set BillDate='12/04/2020' where OrderID=7
select * from Bills

CREATE TRIGGER t3 
ON Bills
FOR UPDATE
AS
if(select BillDate from inserted) != GETDATE()
begin
print 'This bill is not generated on current date'
rollback
end
drop trigger t3

--apply on visual
use Restaurant_Management_System
SELECT * FROM Customers      --viewing rows inserted at visual studio