

create database mobileDB
go


use mobileDB



create table users (
id int  primary key identity ,
username varchar(100) unique  not null,
password varchar(100) not null ,
phone  decimal(10,0) ,
address  nvarchar(100) ,
isAdmin bit default 0,
displayName  nvarchar(100) not null,
createdAt date default getdate(),
updatedAt date default getDate()
)



ALTER TABLE users
ADD avatar varchar(100)



select * from users




create table colors (
id int  primary key identity ,
colorName  varchar(50) not null unique
)

insert into colors (colorName) values  ('white')  ,('black') , ('gray') , ('red') , ('yellow')  

select * from colors


create table phones (
  id int  primary key  ,
  phoneName  nvarchar(300) not null ,
  description  text not null ,
  quantity int not null  ,
  price float not null ,
  category varchar(50) not null  default 'iphone' ,
  image varchar(200) not null,
  status bit default 1 ,
  createdAt date default getdate(),
updatedAt date default getDate()
)
select * from phones
delete  from phones

create table prColors (
  id int  primary key identity ,
  phoneId int FOREIGN KEY REFERENCES phones(id),
  colorId int FOREIGN KEY REFERENCES colors(id)
)
select * from prColors
delete  from prColors


create table carts (
    id int  primary key identity ,
	userId int FOREIGN KEY REFERENCES users(id),
	phoneId int FOREIGN KEY REFERENCES phones(id),
	color varchar(100) not null,
	capacity  varchar(100) not null ,
	createdAt date default getdate(),
	updatedAt date default getDate()
)


create table orders (
    id int  primary key identity ,
	userId int FOREIGN KEY REFERENCES users(id),
	phoneId int FOREIGN KEY REFERENCES phones(id),
	color varchar(100) not null,
	capacity  varchar(100) not null ,
	createdAt date default getdate(),
	updatedAt date default getDate()
)

select * from carts

insert into orders(userId , phoneId , color , capacity) values(1,1,'gray' ,'2/32')



create table capacities(
id int primary key identity ,
rom int not null ,
ram int not null
)


insert into capacities (rom , ram) values (2,32) ,(4,64)
,(4,128) , (6,512) , (8,1024 ) , (16,1024) ,(6,128)

create table phoneCapacity(
	capacityId int FOREIGN KEY REFERENCES capacities(id),
	phoneId int FOREIGN KEY REFERENCES phones(id)
) 

select colors.colorName   , capacities.ram from phoneCapacity 
join phones  on  phoneCapacity.phoneId= phones.id
join capacities  on  phoneCapacity.phoneId= capacities.id
join prColors on prColors.phoneId = phones.id
join colors on prColors.phoneId = colors.id


create function getProduct()
returns table  
as
return  select phones.* , colors.colorName   , capacities.ram , capacities.rom from phoneCapacity 
join phones  on  phoneCapacity.phoneId= phones.id
join capacities  on  phoneCapacity.phoneId= capacities.id
join prColors on prColors.phoneId = phones.id
join colors on prColors.phoneId = colors.id
go
select * from getProduct()

create function getColorOfPhone(@id int)
returns table  
as
return  select colors.* from colors 
join prColors on prColors.colorId = colors.id
join phones  on  prColors.phoneId= phones.id
where phones.id = @id
go
select * from getColorOfPhone(1)

alter function getCapacityOfPhone(@id int)
returns table  
as
return  select capacities.* from capacities 
join phoneCapacity on phoneCapacity.capacityId = capacities.id
join phones  on  phoneCapacity.phoneId= phones.id
where phones.id = @id
go

select * from getCapacityOfPhone(1)

delete from phones

delete from phoneCapacity

delete from prColors


select * from carts

SELECT carts.* , phones.phoneName , phones.price , phones.image  FROM  carts
right join  phones  on carts.phoneId = phones.id
where userId=6


select * from phones where phoneName  like 'i%'