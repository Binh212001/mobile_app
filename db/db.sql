

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
  iamge varchar(200) not null,
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
	color varchar(50) not null,
	count int not null,
	createdAt date default getdate(),
	updatedAt date default getDate()
)


create table orders (
    id int  primary key identity ,
	userId int FOREIGN KEY REFERENCES users(id),
	phoneId int FOREIGN KEY REFERENCES phones(id),
	count int not null,
	color varchar(50) not null,
	createdAt date default getdate(),
	updatedAt date default getDate()
)

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


alter function getProduct()
returns table  
as
return  select phones.* , colors.colorName   , capacities.ram , capacities.rom from phoneCapacity 
join phones  on  phoneCapacity.phoneId= phones.id
join capacities  on  phoneCapacity.phoneId= capacities.id
join prColors on prColors.phoneId = phones.id
join colors on prColors.phoneId = colors.id
go
select * from getProduct()

