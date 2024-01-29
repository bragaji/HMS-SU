
use ist659pkgautam
GO

--DOWN

drop table if exists hms_reviews
GO
drop table if exists hms_areas
GO
drop table if exists hms_houses
GO
drop table if exists hms_leasing_agency
GO
drop table if exists hms_landlords
GO
drop table if exists hms_tenants
GO

--UP Metadata

create table hms_landlords(
    landlord_id int identity not null,
    landlord_name varchar(50) not null,
    landlord_address varchar(50) not null,
    landlord_zipcode varchar(10) null,
    landlord_email varchar(50) null,
    landlord_phone_number varchar(10) null,
    constraint pk_hms_landloards_landloard_id primary key(landlord_id),
    constraint u_hms_landloards_landloard_name unique (landlord_name),
    constraint u_hms_landloards_landloard_zipcode unique (landlord_zipcode),
    constraint u_hms_landloards_landloard_email unique (landlord_email),
    constraint u_hms_landloards_landloard_phone_number unique (landlord_phone_number),

)
GO
create table hms_leasing_agency(
    leasing_agency_id int identity not null,
    leasing_agency_name varchar(50) not null,
    leasing_agency_office_address  varchar(50) not null,
    leasing_agency_zipcode varchar(10) null,
    leasing_agency_email varchar(50) null,
    leasing_agency_phone_number varchar(10) null,
    constraint pk_hms_leasing_agency_leasing_agency_id primary key(leasing_agency_id),
    constraint u_hms_leasing_agency_leasing_agency_name unique (leasing_agency_name),
    constraint u_hms_leasing_agency_leasing_agency_zipcode unique (leasing_agency_zipcode),
    constraint u_hms_leasing_agency_leasing_agency_email unique (leasing_agency_email),
    constraint u_hms_leasing_agency_leasing_agency_phone_number unique (leasing_agency_phone_number),

)
GO
create table hms_houses(
    house_id int identity not null,
    house_number varchar(50) not null,
    house_number_of_floors int not null,
    house_number_of_rooms int not null,
    house_price_range varchar(50) not null,
    house_availability varchar(10) not null,
    constraint pk_hms_houses_house_id primary key(house_id),
    constraint ck_hms_houses_house_price_range check (house_price_range>500 AND house_price_range<2500)

)
GO
create table hms_areas(
    area_id int identity not null,
    area_name varchar(50) not null,
    area_zipcode int not null,
    area_total_houses int not null,
    area_population_count int not null,
    area_bus_stops int not null,
    area_distance_from_university decimal not null, 
    constraint pk_hms_areas_area_id primary key(area_id),
    constraint u_hms_areas_area_name unique (area_name),
    constraint u_hms_areas_area_zipcode unique (area_zipcode)

)
GO
create table hms_reviews(
    review_id int identity not null,
    review_apartment_area int not null,
    review_house_number int not null,
    review_leasing_provider int not null,
    review_utility_availability int not null,
    review_facilities_nearby int not null,
    review_safety_level int not null, 
    constraint pk_hms_reviews_review_id primary key(review_id),
    constraint ck_hms_reviews_review_apartment_area check (review_apartment_area>0 AND review_apartment_area<=5),
    constraint ck_hms_reviews_review_house_number check (review_house_number>0 AND review_house_number<=5),
    constraint ck_hms_reviews_review_leasing_provider check (review_leasing_provider>0 AND review_leasing_provider<=5),
    constraint ck_hms_reviews_review_utility_availability check (review_utility_availability>0 AND review_utility_availability<=5),
    constraint ck_hms_reviews_review_facilities_nearby check (review_facilities_nearby>0 AND review_facilities_nearby<=5),
    constraint ck_hms_reviews_review_safety_level check (review_safety_level>0 AND review_safety_level<=5)    

)
GO

CREATE TABLE hms_tenants

(
	tenant_id int NOT NULL,
	tenant_firstname varchar(50) NOT NULL,
	tenant_lastname varchar(50) NOT NULL,
	tenant_email varchar(50) NOT NULL,
	tenant_phone_number varchar(10) NOT NULL,
	tenants_house_id int NULL,
	tenants_leasing_agency_id int NULL,
    CONSTRAINT pk_tenants_tenant_id PRIMARY KEY (tenant_id),
    CONSTRAINT u_tenants_tenant_email UNIQUE (tenant_email)
    CONSTRAINT [u_tenants_tenant_phone_number] UNIQUE (tenant_phone_number)
    
)

CREATE table hms_nationality 
(
    nationality_id int,
    nationality_name varchar(30),
     CONSTRAINT pk_nationality_id PRIMARY KEY (nationality_id)
)

CREATE table hms_furnishing 
(
    furnishing_id int,
    CONSTRAINT pk_furnishing_id PRIMARY KEY (furnishing_id)
)

CREATE table hms_leasing
(
    leasing_id int,
    CONSTRAINT pk_leasing_id PRIMARY KEY (leasing_id)
)

CREATE table hms_preferredby
(
    preferredby_nationality_id int,
    CONSTRAINT pk_preferredby_nationality_id PRIMARY KEY (preferredby_nationality_id)
)

GO

CREATE TABLE hms_tenants_nationality (
    tenants_nationality_tenant_id int,
    tenants_nationality_nationality_id int,
);


CREATE TABLE hms_area_landlord (
    area_landlord_area_id int,
    area_landlord_landlord_id int,
);


CREATE TABLE hms_area_leasing_agency (
    area_leasing_agency_area_id int,
    area_leasing_agency_leasing_agency_id int,
);


CREATE TABLE hms_area_preferredby (
    area_preferredby_area_id int,
    area_preferredby_preferredby_nationality_id int,
);
CREATE TABLE hms_house_furnishing (
    house_furnishing_house_id int,
    house_furnishing_furnishing_id int,
);
CREATE TABLE hms_house_leasing (
    house_leasing_house_id int,
    house_leasing_leasing_id int,
);


--UP Data

SET IDENTITY_INSERT hms_landloards ON 
insert into hms_landlords
    (landloard_name,landloard_address,landloard_zipcode,landloard_email,landloard_phone_number)
    VALUES
    ('Robert Shaw','141 Columbus Street',13210,'Rshaw@gmail.com',6782345678),
    ('Tom Brokway','644 Westcott Street',13211,'Tbrokway@gmail.com',6792325771),
    ('Emily Kimmel','220 Park Avenue',21210,'Ekimmel@gmail.com',4818294568),
    ('Daniel Sadler','937 Olympus hills',13519,'Dsadler@gmail.com',6582345672),
    ('Ernie Davis','781 Marshall Street',13216,'Edavis@gmail.com',4782145978)
    ('Peter Parker', '297 Comstock Avenue', 13212, 'pparker@gmail.com', 6510497359),
    ('Tony Stark', '1531 Genesse Street', 13218, 'tstark@gmail.com', 5614898621),
    ('Dwight Schrute', '331 Wallnut Street', 13219, 'dtheshrute@gmail.com', 1234862109),
    ('Carlie Cooper', '1418 Nob Hills', 13228, 'ccooper@gmail.com', 8670256829),
    ('Bruce Banner', '256 Oakwood Avenue', 13226, 'bbnr@gmail.com', 9878542792),
    ('Wade Winston', '1382 Garfield Ave', 13215, 'wnstn@gmail.com', 6428937254)

GO


update hms_landlords
set landlord_tenant_id = 27
where landlord_zipcode like '%21210';

update hms_landlords
set landlord_tenant_id = 21
where landlord_zipcode like '%13218';

update hms_landlords
set landlord_tenant_id = 22
where landlord_zipcode like '%13228';

alter table hms_landlords
add landlord_tenant_id int

insert into hms_leasing_agency
    (leasing_agency_name,leasing_agency_office_address,leasing_agency_zipcode,leasing_agency_email,leasing_agency_phone_number)
    VALUES
    ('Syracuse Quality Living','241 East Genesee',13210,'sql@gmail.com',4989045678),
    ('University Hill Apartment','444 Westcott Street',13211,'uhl@gmail.com',6092325729),
    ('University Leasing','321 University Avenue',21210,'ul@gmail.com',4410129457),
    ('Wallnut Properties','1937 Wallnut Street',13519,'wp@gmail.com',6982345664),
    ('Cuse Real Estate','112 Comstock Street',13216,'cre@gmail.com',4289345598)
    ('Uphill Apartments', '812 Garfield Ave', 13223, 'garave@gmail.com', 6924862970),
    ('South Campus Apartments', '758 Columbus Street',13228, 'scapt@gmail.com', 4528745280),
    ('Warehouse Apartments','618 Euclid Avenue',13218,'wapartments@gmail.com',8724512790),
    ('Nob Hill Apartments', '1126 Olympus Hills', 13245, 'nha@gmail.com', 8462947280),
    ('South Hill Apartments', '928 Marshall Street', 13266, 'sha@gmail.com', 7492754812);

GO

update hms_leasing_agency
set leasing_agency_area_id = 10
where leasing_agency_zipcode like '%13218';


update hms_leasing_agency
set leasing_agency_area_id = 13
where leasing_agency_zipcode like '%13223'


alter table hms_leasing_agency
add leasing_agency_area_id int


insert into hms_houses
    (house_number,house_number_of_floors,house_number_of_rooms,house_price_range,house_availability)
    VALUES
    ('221 Genesee',3	,8	,1500	,'No'),
    ('222 Genesee',2	,4	,1500	,'Yes'),
    ('505 Wallnut',4	,12	,2400	,'Yes'),
    ('824 Olympus',3	,6	,1900	,'Yes'),
    ('321 Westcott',3,5  ,2300   ,'Yes'),
    ('226 Genesee',2	,3	,1100	,'No'),
    ('1190 Wallnut',3,8	,1710	,'Yes'),
    ('927 Olympus',1	,2	,550	,'Yes'),
    ('229 Genesee',2	,3	,870	,'No'),
    ('130 Comstock',3,7	,1780	,'Yes'),
    ('131 Comstock',2,4	,1500	,'Yes'),
    ('232 Genesee',4,10	,2450	,'Yes'),
    ('771 Marshall',3,5	,1990	,'No')
    ('225 Columbus',2	,6	,1550	,'No', 2),
    ('312 Park Avenue',3	,8	,1600	,'Yes', 4),
    ('535 University Avenue',1	,4	,2000	,'Yes', 8),
    ('760 Euclid Avenue',2	,5	,1850	,'No',10),
    ('411 Nob Hills',1,3  ,1950   ,'No', 11),
    ('314 Oakwood Avenue',2	,4	,1700	,'Yes', 12),
    ('1210 Garfield Ave',3,7	,1750	,'No', 13),
    ('754 Euclid Avenue',2	,4	,1600	,'Yes', 10),
    ('346 Park Avenue',3	,8	,2300	,'Yes', 4),
    ('569 University Avenue',1,3	,1560	,'No', 8),
    ('372 Oakwood Avenue',2 ,5	,1720	,'Yes', 12),
    ('491 Nob Hills',3 ,7 ,2200	,'Yes', 11),
    ('1268 Garfield Ave',2 ,5	,1920	,'Yes', 13)
GO


alter table hms_houses
add houses_landlord_id int null;

alter table hms_houses
add houses_leasing_agency_id int null;

update hms_houses
set house_area_id = 6
where house_number like '%Marshall';

--update house_landlord_id

update hms_houses
set house_landlord_id = 1
where house_number like '%Columbus';

update hms_houses
set house_leasing_agency_id = 9
where house_id= 23;

update hms_houses
set house_landlord_id = 3
where house_number like '%Park Avenue';

update hms_houses
set house_landlord_id = 8
where house_number like '%Wallnut';

update hms_houses
set house_landlord_id = 6
where house_number like '%Comstock';

--update_house_leasing_agency_id
update hms_houses
set house_leasing_agency_id = 5
where house_number like '%Comstock';

update hms_houses
set house_leasing_agency_id = 3
where house_number like '%University Avenue';

update hms_houses
set house_leasing_agency_id = 4
where house_number like '%Wallnut';

update hms_houses
set house_leasing_agency_id = 2
where house_number like '%Westcott';

update hms_houses
set house_leasing_agency_id = 6
where house_number like '%Olympus';

update hms_houses
set house_landlord_id = 16
where house_number like '%Nob Hills'

update hms_houses
set house_landlord_id = 10
where house_number like '%Garfield Ave'

update hms_houses
set house_leasing_agency_id = 10
where house_number like '%Garfield Ave'

alter table hms_houses
add house_landlord_id int


alter table hms_houses
add house_leasing_agency_id int

insert into hms_areas
    (area_id,area_name,area_zipcode,area_total_houses,area_population_count,area_bus_stops,area_distance_from_university)
    VALUES
    ('Genesee Street'	,13210	,84	,1200	,4	,0.2),
    ('Colombus Street'	,13213	,47	,1908	,7	,2),
    ('Westcott Street'	,13211	,120,2546	,2	,2.8),
    ('Park Avenue'	    ,21220	,68	,1992	,2	,2),
    ('Olympus Hills'	    ,13519	,55	,310	,5	,2.5),
    ('Marshall Street'	,13216	,39	,100	,4	,2),
    ('Wallnut Street'	,13217	,84	,1713	,2	,1.5),
    ('University Avenue'	,21211	,29	,250	,1	,0.1),
    ('Comstock Street'	,13215	,39	,1877	,2	,2),
    ('Euclid Avenue'	    ,13909	,332,2871	,3	,3.5)
    ('Nob Hills'	,13205	, 54	,1350	,2	, 2.9),
    ('Oakwood Avenue' ,13212	, 66 , 1670	, 5	, 0.5),
    ('Garfield Ave'	,13209	, 88 , 2000	, 3	, 0.9)
GO

insert into hms_reviews
    (review_id,review_apartment_area,review_house_number,review_leasing_provider,review_utility_availability,review_facilities_nearby,review_safety_level)
    VALUES
    (1,	4,3,4,4,5,2),
    (2,	2,3,4,5,5,3),
    (3,	5,5,5,3,3,4),
    (4,	4,4,5,4,2,5),
    (5,	3,2,3,3,4,4),
    (6,	4,5,2,2,2,3),
    (7,	4,1,4,4,1,2)

GO

alter table hms_reviews
add reviews_house_id int null;

alter table hms_reviews
add reviews_landlord_id int null;

alter table hms_reviews
add reviews_leasing_agency_id int null;

update hms_reviews 
set reviews_leasing_agency_id = 1
where review_id = 1;

insert into hms_tenants
(tenant_id,tenant_firstname,tenant_lastname,tenant_email,tenant_phone_number)
values
 ('Nishanth','Nirav','okgautham@gmail.com',1234567890),
 ('Kushwant','Sai','ksai@gmail.com',9876543221),
 ('Joseph','Crimmer','jcrimmer@gmail.com',1543579732),
 ('Micheal','Fudge','mfudge@gmail.com',2486864279),
 ('Joe','Biden','jbiden@gmail.com',3928329786)
( 'Scott', 'Summers', 'ssummers@gmail.com', 4627946290),
( 'Adam', 'Austin', 'aaustin@gmail.com', 6296429049),
('Robbie', 'Reyes', 'rreyes@gmail.com', 7259248279),
('Barney', 'Barton', 'bbarton@gmail.com', 9270380462),
('Glory', 'Grant', 'ggrant@gmail.com', 6803265020),
('Green', 'Goblin', 'ggoblin@gmail.com', 6479246020),
('James', 'Bond', 'jbond@gmail.com', 8734128057),
('Captain', 'America', 'camerica@gmail.com', 6374287460),
('Black', 'Widow', 'bwidow@gmail.com', 7462879460),
('Iron', 'Man', 'iman@gmail.com', 8628747790),
('Black', 'Panther', 'bpanther@gmail.com', 9846634520),
('Ant', 'Man', 'aman@gmail.com', 7648475290)


update hms_tenants
set tenants_landlord_id = 30
where tenant_lastname like '%Summers';

update hms_tenants
set tenants_leasing_agency_id = 28
where tenant_lastname like '%Austin';

update hms_tenants
set tenants_leasing_agency_id = 19
where tenant_lastname like '%Reyes';

update hms_tenants
set tenants_leasing_agency_id = 22
where tenant_lastname like '%Barton';

update hms_tenants
set tenants_leasing_agency_id = 3
where tenant_lastname like '%Grant';

update hms_tenants
set tenants_leasing_agency_id = 8
where tenant_lastname like '%Goblin';

update hms_tenants
set tenants_leasing_agency_id = 7
where tenant_lastname like '%Blank';

alter table hms_tenants
add tenants_house_id int

alter table hms_tenants
add tenants_leasing_agency_id int

---Foreign keys

alter table hms_tenants
add CONSTRAINT fk_hms_tenants_tenants_house_id 
foreign key (tenants_house_id) references hms_houses(house_id)

alter table hms_tenants
add CONSTRAINT fk_hms_tenants_tenants_leasing_agency_id 
foreign key (tenants_leasing_agency_id) references hms_leasing_agency(leasing_agency_id)

alter table hms_houses
add constraint fk_hms_houses_house_area_id
foreign key(house_area_id) references hms_areas(area_id)


alter table hms_reviews
add constraint fk_hms_reviews_house_id
foreign key(reviews_house_id) references hms_houses(house_id)

alter table hms_reviews
add constraint fk_hms_reviews_landlord_id
foreign key(reviews_landlord_id) references hms_houses(house_id)

alter table hms_reviews
add constraint fk_hms_reviews_leasing_agency_id
foreign key(reviews_leasing_agency_id) references hms_houses(house_id)

alter table hms_houses
add constraint fk_hms_house_landlord_id
foreign key(house_landlord_id) references hms_landlords(landlord_id)

alter table hms_houses
add constraint fk_hms_house_leasing_agency_id
foreign key(house_leasing_agency_id) references hms_leasing_agency(leasing_agency_id)

alter table hms_landlords
add constraint fk_hms_landlord_tenant_id
foreign key(landlord_tenant_id) references hms_tenants(tenant_id)

alter table hms_house_leasing
add constraint fk_hms_house_leasing_house_id
foreign key(house_leasing_house_id) references hms_houses(house_id)

alter table hms_house_leasing
add constraint fk_hms_house_leasing_leasing_id
foreign key(house_leasing_leasing_id) references hms_leasing(leasing_id)

--hms_house_furnishing
alter table hms_house_furnishing
add constraint fk_hms_house_furnishing_house_id
foreign key(house_furnishing_house_id) references hms_houses(house_id)

alter table hms_house_furnishing
add constraint fk_hms_house_furnishing_furnishing_id
foreign key(house_furnishing_furnishing_id) references hms_furnishing(furnishing_id)

--hms_tenants_nationality
alter table hms_tenants_nationality
add constraint fk_hms_tenants_nationality_tenant_id
foreign key(tenants_nationality_tenant_id) references hms_tenants(tenant_id)

alter table hms_tenants_nationality
add constraint fk_hms_tenants_nationality_nationality_id
foreign key(tenants_nationality_nationality_id) references hms_nationality(nationality_id)

--hms_area_preferredby
alter table hms_area_preferredby
add constraint fk_hms_area_preferredby_area_id
foreign key(area_preferredby_area_id) references hms_areas(area_id)

alter table hms_area_preferredby
add constraint fk_hms_area_preferredby_preferredby_nationality_id
foreign key(area_preferredby_preferredby_nationality_id) references hms_preferredby(preferredby_nationality_id)

--hms_area_landlord
alter table hms_area_landlord
add constraint fk_hms_area_landlord_area_id
foreign key(area_landlord_area_id) references hms_areas(area_id)

alter table hms_area_landlord
add constraint fk_hms_area_landlord_landlord_id
foreign key(area_landlord_landlord_id) references hms_landlords(landlord_id)

--hms_area_leasing_agency

alter table hms_area_leasing_agency
add constraint fk_hms_area_leasing_agency_area_id
foreign key(area_leasing_agency_area_id) references hms_areas(area_id)

alter table hms_area_leasing_agency
add constraint fk_hms_area_leasing_agency_leasing_agency_id
foreign key(area_leasing_agency_leasing_agency_id) references hms_leasing_agency(leasing_agency_id)


alter table hms_leasing_agency
add CONSTRAINT fk_hms_leasing_agency_leasing_agency_area_id 
foreign key (leasing_agency_area_id) references hms_areas(area_id)



GO

--Verify

Select * from hms_landlords
Select * from hms_leasing_agency
select * from hms_houses
select * from hms_areas
select * from hms_reviews
select * from hms_tenants


--views---

CREATE VIEW hms_house_landloard  AS
SELECT * from hms_houses h INNER JOIN
hms_landlords l ON h.house_landlord_id = l.landlord_id;


CREATE VIEW hms_tenant_house_landloard  AS
SELECT * from hms_houses h JOIN
hms_landlords l ON h.house_landlord_id = l.landlord_id
JOIN hms_tenants t ON t.tenants_landlord_id = l.landlord_id

CREATE VIEW hms_house_leasing_agency  AS
SELECT * from hms_houses h INNER JOIN
hms_leasing_agency la ON h.house_leasing_agency_id = la.leasing_agency_id;


CREATE VIEW hms_tenant_house_leasing_agency  AS
SELECT * from hms_houses h JOIN
hms_leasing_agency la ON h.house_leasing_agency_id = la.leasing_agency_id
JOIN hms_tenants t ON t.tenants_leasing_agency_id = la.leasing_agency_id;
























