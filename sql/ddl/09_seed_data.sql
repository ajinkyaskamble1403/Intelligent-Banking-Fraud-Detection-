/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 09_seed_data.sql
Description : Inserts sample data for project demonstration.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- LOOKUP DATA
-- ============================================================================

INSERT INTO account_status
(status_name, description)

VALUES
('ACTIVE', 'Account is active'),
('INACTIVE', 'Account is inactive'),
('BLOCKED', 'Account is blocked'),
('CLOSED', 'Account is permanently closed')

ON CONFLICT (status_name) DO NOTHING;


INSERT INTO merchant_category
(merchant_category_name, description)

VALUES
('RETAIL', 'Retail stores'),
('GROCERY', 'Supermarkets and grocery stores'),
('RESTAURANT', 'Restaurants and cafes'),
('FUEL', 'Fuel stations'),
('HOSPITAL', 'Hospitals and healthcare'),
('TRAVEL', 'Travel and tourism'),
('ECOMMERCE', 'Online shopping'),
('ENTERTAINMENT', 'Movies and entertainment'),
('EDUCATION', 'Educational institutions'),
('UTILITY', 'Utility bill payments')

ON CONFLICT (merchant_category_name) DO NOTHING;


INSERT INTO fraud_rule
(rule_name, risk_level, description)

VALUES
('HIGH_VALUE_TRANSACTION',
 'HIGH',
 'Transaction amount exceeds threshold'),

('MULTIPLE_ONLINE_TRANSACTIONS',
 'MEDIUM',
 'Frequent online transactions'),

('BLACKLISTED_MERCHANT',
 'CRITICAL',
 'Merchant is blacklisted'),

('MULTIPLE_FAILED_TRANSACTIONS',
 'HIGH',
 'Repeated failed transactions'),

('UNUSUAL_LOCATION',
 'MEDIUM',
 'Transaction from unusual location')

ON CONFLICT (rule_name) DO NOTHING;

-- ============================================================================
-- BRANCH DATA
-- ============================================================================

INSERT INTO branch
(
    branch_code,
    branch_name,
    address_line,
    city,
    state,
    postal_code,
    phone_number,
    email,
    is_active
)

VALUES

('MUM001',
 'Mumbai Central Branch',
 '12 MG Road',
 'Mumbai',
 'Maharashtra',
 '400001',
 '02240001001',
 'mumbai.central@bank.com',
 TRUE),

('PUN001',
 'Pune Main Branch',
 '45 FC Road',
 'Pune',
 'Maharashtra',
 '411001',
 '02040001002',
 'pune.main@bank.com',
 TRUE),

('NAS001',
 'Nashik Branch',
 '21 College Road',
 'Nashik',
 'Maharashtra',
 '422001',
 '025340001003',
 'nashik@bank.com',
 TRUE),

('NGP001',
 'Nagpur Branch',
 '88 Sitabuldi',
 'Nagpur',
 'Maharashtra',
 '440001',
 '071240001004',
 'nagpur@bank.com',
 TRUE),

('KOL001',
 'Kolkata Branch',
 '101 Park Street',
 'Kolkata',
 'West Bengal',
 '700001',
 '03340001005',
 'kolkata@bank.com',
 TRUE),

('DEL001',
 'New Delhi Branch',
 '15 Connaught Place',
 'New Delhi',
 'Delhi',
 '110001',
 '01140001006',
 'delhi@bank.com',
 TRUE),

('BLR001',
 'Bengaluru Branch',
 '77 MG Road',
 'Bengaluru',
 'Karnataka',
 '560001',
 '08040001007',
 'bengaluru@bank.com',
 TRUE),

('CHE001',
 'Chennai Branch',
 '9 Anna Salai',
 'Chennai',
 'Tamil Nadu',
 '600001',
 '04440001008',
 'chennai@bank.com',
 TRUE),

('HYD001',
 'Hyderabad Branch',
 '32 Banjara Hills',
 'Hyderabad',
 'Telangana',
 '500001',
 '04040001009',
 'hyderabad@bank.com',
 TRUE),

('AHM001',
 'Ahmedabad Branch',
 '18 Ashram Road',
 'Ahmedabad',
 'Gujarat',
 '380001',
 '07940001010',
 'ahmedabad@bank.com',
 TRUE)

ON CONFLICT (branch_code) DO NOTHING;

-- ============================================================================
-- END OF PART 1
-- ============================================================================
-- ============================================================================
-- CUSTOMER DATA (1–25)
-- ============================================================================

INSERT INTO customer
(
    first_name,
    last_name,
    date_of_birth,
    gender,
    email,
    phone_number,
    address_line,
    city,
    state,
    postal_code,
    national_id,
    created_at,
    updated_at
)

VALUES

('Rahul','Sharma','1990-05-12','MALE','rahul.sharma@bankdemo.com','9876500001','12 MG Road','Mumbai','Maharashtra','400001','PAN000000001',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Priya','Patel','1993-08-21','FEMALE','priya.patel@bankdemo.com','9876500002','45 FC Road','Pune','Maharashtra','411001','PAN000000002',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Amit','Verma','1988-01-18','MALE','amit.verma@bankdemo.com','9876500003','21 Ring Road','Nagpur','Maharashtra','440001','PAN000000003',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Sneha','Kulkarni','1995-03-25','FEMALE','sneha.kulkarni@bankdemo.com','9876500004','9 JM Road','Pune','Maharashtra','411004','PAN000000004',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Rohan','Joshi','1992-10-09','MALE','rohan.joshi@bankdemo.com','9876500005','88 MG Road','Nashik','Maharashtra','422001','PAN000000005',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Anjali','Mehta','1991-12-15','FEMALE','anjali.mehta@bankdemo.com','9876500006','15 Park Street','Kolkata','West Bengal','700001','PAN000000006',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Vikas','Singh','1989-06-28','MALE','vikas.singh@bankdemo.com','9876500007','11 Civil Lines','Delhi','Delhi','110001','PAN000000007',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Neha','Gupta','1994-04-17','FEMALE','neha.gupta@bankdemo.com','9876500008','77 Residency Road','Bengaluru','Karnataka','560001','PAN000000008',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Arjun','Nair','1990-09-11','MALE','arjun.nair@bankdemo.com','9876500009','19 Marine Drive','Mumbai','Maharashtra','400002','PAN000000009',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Pooja','Rao','1996-07-05','FEMALE','pooja.rao@bankdemo.com','9876500010','2 Anna Salai','Chennai','Tamil Nadu','600001','PAN000000010',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Karan','Malhotra','1987-11-20','MALE','karan.malhotra@bankdemo.com','9876500011','6 MG Road','Bengaluru','Karnataka','560002','PAN000000011',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Aisha','Khan','1998-02-14','FEMALE','aisha.khan@bankdemo.com','9876500012','17 Banjara Hills','Hyderabad','Telangana','500001','PAN000000012',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Suresh','Iyer','1985-09-03','MALE','suresh.iyer@bankdemo.com','9876500013','29 T Nagar','Chennai','Tamil Nadu','600017','PAN000000013',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Meera','Desai','1997-01-30','FEMALE','meera.desai@bankdemo.com','9876500014','5 Ashram Road','Ahmedabad','Gujarat','380001','PAN000000014',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Nikhil','Pawar','1993-05-27','MALE','nikhil.pawar@bankdemo.com','9876500015','10 College Road','Nashik','Maharashtra','422005','PAN000000015',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Kavita','Chopra','1991-08-19','FEMALE','kavita.chopra@bankdemo.com','9876500016','25 Connaught Place','Delhi','Delhi','110002','PAN000000016',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Aditya','Kulshrestha','1988-12-08','MALE','aditya.kulshrestha@bankdemo.com','9876500017','90 FC Road','Pune','Maharashtra','411005','PAN000000017',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Ritika','Shah','1995-06-16','FEMALE','ritika.shah@bankdemo.com','9876500018','8 CG Road','Ahmedabad','Gujarat','380009','PAN000000018',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Manish','Yadav','1990-03-07','MALE','manish.yadav@bankdemo.com','9876500019','13 Sitabuldi','Nagpur','Maharashtra','440010','PAN000000019',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Divya','Menon','1996-10-24','FEMALE','divya.menon@bankdemo.com','9876500020','40 Brigade Road','Bengaluru','Karnataka','560025','PAN000000020',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Harsh','Agarwal','1989-04-09','MALE','harsh.agarwal@bankdemo.com','9876500021','16 Ring Road','Delhi','Delhi','110003','PAN000000021',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Shreya','Bose','1994-07-18','FEMALE','shreya.bose@bankdemo.com','9876500022','44 Salt Lake','Kolkata','West Bengal','700091','PAN000000022',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Akash','Patil','1992-02-11','MALE','akash.patil@bankdemo.com','9876500023','7 JM Road','Pune','Maharashtra','411007','PAN000000023',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Nisha','Reddy','1997-09-29','FEMALE','nisha.reddy@bankdemo.com','9876500024','81 Jubilee Hills','Hyderabad','Telangana','500033','PAN000000024',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Sameer','Kapoor','1986-01-22','MALE','sameer.kapoor@bankdemo.com','9876500025','22 Marine Lines','Mumbai','Maharashtra','400020','PAN000000025',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Aniket','Deshmukh','1991-03-15','MALE','aniket.deshmukh@bankdemo.com','9876500026','15 Shivaji Nagar','Pune','Maharashtra','411005','PAN000000026',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Sakshi','Jain','1995-08-27','FEMALE','sakshi.jain@bankdemo.com','9876500027','18 Civil Lines','Nagpur','Maharashtra','440001','PAN000000027',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Rakesh','Mishra','1988-12-09','MALE','rakesh.mishra@bankdemo.com','9876500028','33 Park Street','Kolkata','West Bengal','700016','PAN000000028',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Deepa','Naik','1994-04-19','FEMALE','deepa.naik@bankdemo.com','9876500029','42 MG Road','Bengaluru','Karnataka','560001','PAN000000029',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Yash','Chavan','1993-06-02','MALE','yash.chavan@bankdemo.com','9876500030','25 Camp Area','Pune','Maharashtra','411040','PAN000000030',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Bhavana','Shetty','1992-09-21','FEMALE','bhavana.shetty@bankdemo.com','9876500031','14 Residency Road','Bengaluru','Karnataka','560025','PAN000000031',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Abhishek','Roy','1989-01-18','MALE','abhishek.roy@bankdemo.com','9876500032','11 Lake Town','Kolkata','West Bengal','700089','PAN000000032',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Komal','Patwardhan','1996-07-11','FEMALE','komal.patwardhan@bankdemo.com','9876500033','9 Tilak Road','Pune','Maharashtra','411030','PAN000000033',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Nitin','Kulkarni','1987-05-24','MALE','nitin.kulkarni@bankdemo.com','9876500034','61 College Road','Nashik','Maharashtra','422005','PAN000000034',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Shruti','Saxena','1998-02-13','FEMALE','shruti.saxena@bankdemo.com','9876500035','28 Connaught Place','New Delhi','Delhi','110001','PAN000000035',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Prakash','Gowda','1990-10-07','MALE','prakash.gowda@bankdemo.com','9876500036','88 Indiranagar','Bengaluru','Karnataka','560038','PAN000000036',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Ishita','Sen','1995-11-29','FEMALE','ishita.sen@bankdemo.com','9876500037','77 Ballygunge','Kolkata','West Bengal','700019','PAN000000037',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Ajay','Thakur','1986-08-30','MALE','ajay.thakur@bankdemo.com','9876500038','5 Sector 17','New Delhi','Delhi','110017','PAN000000038',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Monika','Pillai','1993-01-05','FEMALE','monika.pillai@bankdemo.com','9876500039','18 Adyar','Chennai','Tamil Nadu','600020','PAN000000039',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Vivek','Pandey','1991-06-17','MALE','vivek.pandey@bankdemo.com','9876500040','20 Gomti Nagar','Lucknow','Uttar Pradesh','226010','PAN000000040',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Rekha','Bhat','1997-03-26','FEMALE','rekha.bhat@bankdemo.com','9876500041','45 JP Nagar','Bengaluru','Karnataka','560078','PAN000000041',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Sandeep','Chaudhary','1988-09-14','MALE','sandeep.chaudhary@bankdemo.com','9876500042','19 Ashram Road','Ahmedabad','Gujarat','380009','PAN000000042',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Payal','Mukherjee','1994-12-20','FEMALE','payal.mukherjee@bankdemo.com','9876500043','10 Howrah Road','Kolkata','West Bengal','700002','PAN000000043',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Rohit','Bhosale','1992-04-08','MALE','rohit.bhosale@bankdemo.com','9876500044','56 Satara Road','Pune','Maharashtra','411043','PAN000000044',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Ananya','Tripathi','1996-07-23','FEMALE','ananya.tripathi@bankdemo.com','9876500045','13 Aliganj','Lucknow','Uttar Pradesh','226024','PAN000000045',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Kishore','Menon','1989-02-16','MALE','kishore.menon@bankdemo.com','9876500046','12 Marine Drive','Kochi','Kerala','682001','PAN000000046',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Swati','Joshi','1993-05-10','FEMALE','swati.joshi@bankdemo.com','9876500047','32 Shivaji Nagar','Pune','Maharashtra','411016','PAN000000047',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Hemant','Rana','1990-11-12','MALE','hemant.rana@bankdemo.com','9876500048','90 Rajpur Road','Dehradun','Uttarakhand','248001','PAN000000048',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Tanvi','Kadam','1998-01-31','FEMALE','tanvi.kadam@bankdemo.com','9876500049','22 Kothrud','Pune','Maharashtra','411038','PAN000000049',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),

('Mohit','Arora','1991-09-18','MALE','mohit.arora@bankdemo.com','9876500050','55 Karol Bagh','New Delhi','Delhi','110005','PAN000000050',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- ============================================================================
-- END OF PART 2
-- ============================================================================

-- ============================================================================
-- EMPLOYEE DATA (1–15)
-- ============================================================================

INSERT INTO employee
(
    branch_id,
    first_name,
    last_name,
    designation,
    email,
    phone_number,
    hire_date,
    salary
)

VALUES

(1,'Amit','Sharma','Branch Manager','amit.sharma@bankdemo.com','9000000001','2018-04-10',85000.00),

(1,'Priya','Patil','Relationship Manager','priya.patil@bankdemo.com','9000000002','2019-06-15',62000.00),

(1,'Rohit','Joshi','Cashier','rohit.joshi@bankdemo.com','9000000003','2021-01-08',38000.00),

(2,'Sneha','Kulkarni','Branch Manager','sneha.kulkarni@bankdemo.com','9000000004','2017-08-12',86000.00),

(2,'Vikas','Singh','Loan Officer','vikas.singh@bankdemo.com','9000000005','2020-03-18',56000.00),

(2,'Neha','Gupta','Cashier','neha.gupta@bankdemo.com','9000000006','2022-02-14',37000.00),

(3,'Arjun','Nair','Branch Manager','arjun.nair@bankdemo.com','9000000007','2016-09-20',87000.00),

(3,'Pooja','Rao','Customer Service Executive','pooja.rao@bankdemo.com','9000000008','2021-07-05',41000.00),

(3,'Karan','Malhotra','Cashier','karan.malhotra@bankdemo.com','9000000009','2023-01-10',36000.00),

(4,'Aisha','Khan','Branch Manager','aisha.khan@bankdemo.com','9000000010','2018-11-01',85500.00),

(4,'Suresh','Iyer','Relationship Manager','suresh.iyer@bankdemo.com','9000000011','2020-05-25',61000.00),

(4,'Meera','Desai','Cashier','meera.desai@bankdemo.com','9000000012','2022-10-16',36500.00),

(5,'Nikhil','Pawar','Branch Manager','nikhil.pawar@bankdemo.com','9000000013','2017-02-13',86500.00),

(5,'Kavita','Chopra','Loan Officer','kavita.chopra@bankdemo.com','9000000014','2019-09-09',57500.00),

(5,'Aditya','Kulshrestha','Cashier','aditya.kulshrestha@bankdemo.com','9000000015','2023-03-22',35500.00),

(6,'Ritika','Shah','Branch Manager','ritika.shah@bankdemo.com','9000000016','2018-01-17',86000.00),

(6,'Manish','Yadav','Relationship Manager','manish.yadav@bankdemo.com','9000000017','2020-04-28',61500.00),

(6,'Divya','Menon','Cashier','divya.menon@bankdemo.com','9000000018','2022-08-19',36500.00),

(7,'Harsh','Agarwal','Branch Manager','harsh.agarwal@bankdemo.com','9000000019','2017-06-21',87500.00),

(7,'Shreya','Bose','Loan Officer','shreya.bose@bankdemo.com','9000000020','2019-11-14',58000.00),

(7,'Akash','Patil','Cashier','akash.patil@bankdemo.com','9000000021','2023-02-07',36000.00),

(8,'Nisha','Reddy','Branch Manager','nisha.reddy@bankdemo.com','9000000022','2018-09-12',86500.00),

(8,'Sameer','Kapoor','Customer Service Executive','sameer.kapoor@bankdemo.com','9000000023','2021-05-30',42000.00),

(8,'Aniket','Deshmukh','Cashier','aniket.deshmukh@bankdemo.com','9000000024','2022-12-11',37000.00),

(9,'Sakshi','Jain','Branch Manager','sakshi.jain@bankdemo.com','9000000025','2016-10-05',88500.00),

(9,'Rakesh','Mishra','Relationship Manager','rakesh.mishra@bankdemo.com','9000000026','2020-01-16',62500.00),

(9,'Deepa','Naik','Cashier','deepa.naik@bankdemo.com','9000000027','2023-04-18',36500.00),

(10,'Yash','Chavan','Branch Manager','yash.chavan@bankdemo.com','9000000028','2018-03-09',87000.00),

(10,'Bhavana','Shetty','Loan Officer','bhavana.shetty@bankdemo.com','9000000029','2019-08-26',58500.00),

(10,'Abhishek','Roy','Cashier','abhishek.roy@bankdemo.com','9000000030','2022-06-13',36000.00);

-- ============================================================================
-- END OF PART 3
-- ============================================================================

INSERT INTO account
(
    customer_id,
    branch_id,
    account_type_id,
    account_status_id,
    account_number,
    balance,
    opened_date
)

VALUES

(1, 1, 1, 1, '100000000001', 125000.50, '2022-01-15'),
(2, 2, 2, 1, '100000000002', 45250.00, '2022-02-10'),
(3, 3, 1, 1, '100000000003', 78000.75, '2021-12-05'),
(4, 2, 1, 1, '100000000004', 15320.20, '2023-03-18'),
(5, 3, 2, 1, '100000000005', 98500.00, '2020-09-22'),
(6, 5, 1, 1, '100000000006', 235000.00, '2019-11-12'),
(7, 6, 2, 1, '100000000007', 18250.75, '2024-01-08'),
(8, 7, 1, 1, '100000000008', 64000.40, '2021-06-14'),
(9, 1, 2, 1, '100000000009', 8700.00, '2024-04-05'),
(10, 8, 1, 1, '100000000010', 312500.80, '2018-08-30'),
(11, 8, 2, 1, '100000000011', 154800.25, '2021-05-18'),
(12, 9, 1, 1, '100000000012', 68250.00, '2022-07-09'),
(13, 8, 1, 1, '100000000013', 482500.90, '2019-03-27'),
(14, 10, 2, 1, '100000000014', 91320.45, '2020-10-11'),
(15, 3, 1, 1, '100000000015', 24560.75, '2023-01-20'),
(16, 6, 2, 1, '100000000016', 178950.00, '2021-08-16'),
(17, 2, 1, 1, '100000000017', 38940.60, '2022-04-13'),
(18, 10, 1, 1, '100000000018', 128750.30, '2020-06-29'),
(19, 4, 2, 1, '100000000019', 76540.10, '2021-11-08'),
(20, 7, 1, 1, '100000000020', 221300.00, '2018-12-17'),
(21, 5, 2, 1, '100000000021', 59680.45, '2022-09-14'),
(22, 9, 1, 1, '100000000022', 118950.00, '2021-01-19'),
(23, 4, 1, 1, '100000000023', 27340.80, '2023-06-07'),
(24, 8, 2, 1, '100000000024', 209875.35, '2020-04-22'),
(25, 10, 1, 1, '100000000025', 74520.90, '2021-10-13'),
(26, 6, 2, 1, '100000000026', 186430.00, '2019-12-04'),
(27, 3, 1, 1, '100000000027', 41250.75, '2022-02-28'),
(28, 7, 2, 1, '100000000028', 267980.60, '2018-11-30'),
(29, 2, 1, 1, '100000000029', 35890.25, '2023-08-16'),
(30, 1, 2, 1, '100000000030', 140275.50, '2020-07-09'),
(31, 5, 1, 1, '100000000031', 89540.30, '2021-03-12'),
(32, 4, 2, 1, '100000000032', 312780.00, '2019-09-18'),
(33, 8, 1, 1, '100000000033', 52860.45, '2022-05-24'),
(34, 9, 2, 1, '100000000034', 174250.90, '2020-08-07'),
(35, 10, 1, 1, '100000000035', 24680.15, '2023-02-27'),
(36, 1, 2, 1, '100000000036', 456930.50, '2018-06-15'),
(37, 7, 1, 1, '100000000037', 98750.25, '2021-11-29'),
(38, 2, 2, 1, '100000000038', 135420.60, '2020-01-13'),
(39, 6, 1, 1, '100000000039', 38495.80, '2022-10-05'),
(40, 3, 2, 1, '100000000040', 219875.40, '2019-04-21'),
(41, 4, 1, 1, '100000000041', 68740.55, '2021-07-14'),
(42, 9, 2, 1, '100000000042', 295860.00, '2018-12-03'),
(43, 5, 1, 1, '100000000043', 47235.20, '2023-01-25'),
(44, 8, 2, 1, '100000000044', 168945.75, '2020-09-17'),
(45, 10, 1, 1, '100000000045', 53980.40, '2022-04-11'),
(46, 6, 2, 1, '100000000046', 387420.90, '2019-08-06'),
(47, 1, 1, 1, '100000000047', 82560.15, '2021-12-20'),
(48, 7, 2, 1, '100000000048', 143780.65, '2020-03-30'),
(49, 2, 1, 1, '100000000049', 31995.90, '2023-05-08'),
(50, 3, 2, 1, '100000000050', 251640.35, '2019-10-27'),
(1, 4, 1, 1, '100000000051', 176850.40, '2022-06-18'),
(2, 6, 2, 1, '100000000052', 92435.75, '2020-11-09'),
(3, 9, 1, 1, '100000000053', 284760.20, '2018-05-14'),
(4, 5, 2, 1, '100000000054', 63120.90, '2023-02-08'),
(5, 8, 1, 1, '100000000055', 119580.35, '2021-09-21'),
(6, 10, 2, 1, '100000000056', 357940.60, '2019-01-16'),
(7, 2, 1, 1, '100000000057', 44890.15, '2022-08-29'),
(8, 3, 2, 1, '100000000058', 208675.80, '2020-04-12'),
(9, 7, 1, 1, '100000000059', 58230.45, '2021-11-03'),
(10, 1, 2, 1, '100000000060', 493520.10, '2018-10-25'),
(11, 4, 1, 1, '100000000061', 214680.75, '2021-02-17'),
(12, 6, 2, 1, '100000000062', 76840.20, '2020-07-28'),
(13, 1, 1, 1, '100000000063', 345920.40, '2019-11-06'),
(14, 9, 2, 1, '100000000064', 58975.10, '2023-03-14'),
(15, 5, 1, 1, '100000000065', 127360.85, '2022-01-09'),
(16, 8, 2, 1, '100000000066', 402185.60, '2018-08-22'),
(17, 10, 1, 1, '100000000067', 69540.35, '2021-10-05'),
(18, 7, 2, 1, '100000000068', 183275.90, '2020-05-19'),
(19, 3, 1, 1, '100000000069', 91860.45, '2022-12-01'),
(20, 2, 2, 1, '100000000070', 276430.15, '2019-04-26');

INSERT INTO card
(
    account_id,
    card_number,
    card_type,
    card_network,
    expiry_date,
    cvv_hash,
    card_status
)

VALUES

(1, '4111111111110001', 'DEBIT', 'VISA', '2029-01-31', 'HASH_CVV_0001', 'ACTIVE'),
(2, '5555555555550002', 'CREDIT', 'MASTERCARD', '2029-02-28', 'HASH_CVV_0002', 'ACTIVE'),
(3, '5085000000000003', 'DEBIT', 'RUPAY', '2029-03-31', 'HASH_CVV_0003', 'ACTIVE'),
(4, '371449635398004', 'CREDIT', 'AMEX', '2029-04-30', 'HASH_CVV_0004', 'ACTIVE'),
(5, '4111111111110005', 'DEBIT', 'VISA', '2029-05-31', 'HASH_CVV_0005', 'ACTIVE'),
(6, '5555555555550006', 'CREDIT', 'MASTERCARD', '2029-06-30', 'HASH_CVV_0006', 'ACTIVE'),
(7, '5085000000000007', 'DEBIT', 'RUPAY', '2029-07-31', 'HASH_CVV_0007', 'ACTIVE'),
(8, '371449635398008', 'CREDIT', 'AMEX', '2029-08-31', 'HASH_CVV_0008', 'ACTIVE'),
(9, '4111111111110009', 'DEBIT', 'VISA', '2029-09-30', 'HASH_CVV_0009', 'ACTIVE'),
(10, '5555555555550010', 'CREDIT', 'MASTERCARD', '2029-10-31', 'HASH_CVV_0010', 'ACTIVE'),
(11, '5085000000000011', 'DEBIT', 'RUPAY', '2029-11-30', 'HASH_CVV_0011', 'ACTIVE'),
(12, '371449635398012', 'CREDIT', 'AMEX', '2029-12-31', 'HASH_CVV_0012', 'ACTIVE'),
(13, '4111111111110013', 'DEBIT', 'VISA', '2030-01-31', 'HASH_CVV_0013', 'ACTIVE'),
(14, '5555555555550014', 'CREDIT', 'MASTERCARD', '2030-02-28', 'HASH_CVV_0014', 'ACTIVE'),
(15, '5085000000000015', 'DEBIT', 'RUPAY', '2030-03-31', 'HASH_CVV_0015', 'ACTIVE'),
(16, '371449635398016', 'CREDIT', 'AMEX', '2030-04-30', 'HASH_CVV_0016', 'ACTIVE'),
(17, '4111111111110017', 'DEBIT', 'VISA', '2030-05-31', 'HASH_CVV_0017', 'ACTIVE'),
(18, '5555555555550018', 'CREDIT', 'MASTERCARD', '2030-06-30', 'HASH_CVV_0018', 'ACTIVE'),
(19, '5085000000000019', 'DEBIT', 'RUPAY', '2030-07-31', 'HASH_CVV_0019', 'ACTIVE'),
(20, '371449635398020', 'CREDIT', 'AMEX', '2030-08-31', 'HASH_CVV_0020', 'ACTIVE'),
(31, '5085000000000031', 'DEBIT', 'RUPAY', '2031-07-31', 'HASH_CVV_0031', 'ACTIVE'),
(32, '371449635398032', 'CREDIT', 'AMEX', '2031-08-31', 'HASH_CVV_0032', 'ACTIVE'),
(33, '4111111111110033', 'DEBIT', 'VISA', '2031-09-30', 'HASH_CVV_0033', 'ACTIVE'),
(34, '5555555555550034', 'CREDIT', 'MASTERCARD', '2031-10-31', 'HASH_CVV_0034', 'ACTIVE'),
(35, '5085000000000035', 'DEBIT', 'RUPAY', '2031-11-30', 'HASH_CVV_0035', 'ACTIVE'),
(36, '371449635398036', 'CREDIT', 'AMEX', '2031-12-31', 'HASH_CVV_0036', 'ACTIVE'),
(37, '4111111111110037', 'DEBIT', 'VISA', '2032-01-31', 'HASH_CVV_0037', 'ACTIVE'),
(38, '5555555555550038', 'CREDIT', 'MASTERCARD', '2032-02-29', 'HASH_CVV_0038', 'ACTIVE'),
(39, '5085000000000039', 'DEBIT', 'RUPAY', '2032-03-31', 'HASH_CVV_0039', 'ACTIVE'),
(40, '371449635398040', 'CREDIT', 'AMEX', '2032-04-30', 'HASH_CVV_0040', 'ACTIVE'),
(41, '4111111111110041', 'DEBIT', 'VISA', '2032-05-31', 'HASH_CVV_0041', 'ACTIVE'),
(42, '5555555555550042', 'CREDIT', 'MASTERCARD', '2032-06-30', 'HASH_CVV_0042', 'ACTIVE'),
(43, '5085000000000043', 'DEBIT', 'RUPAY', '2032-07-31', 'HASH_CVV_0043', 'ACTIVE'),
(44, '371449635398044', 'CREDIT', 'AMEX', '2032-08-31', 'HASH_CVV_0044', 'ACTIVE'),
(45, '4111111111110045', 'DEBIT', 'VISA', '2032-09-30', 'HASH_CVV_0045', 'ACTIVE'),
(46, '5555555555550046', 'CREDIT', 'MASTERCARD', '2032-10-31', 'HASH_CVV_0046', 'ACTIVE'),
(47, '5085000000000047', 'DEBIT', 'RUPAY', '2032-11-30', 'HASH_CVV_0047', 'ACTIVE'),
(48, '371449635398048', 'CREDIT', 'AMEX', '2032-12-31', 'HASH_CVV_0048', 'ACTIVE'),
(49, '4111111111110049', 'DEBIT', 'VISA', '2033-01-31', 'HASH_CVV_0049', 'ACTIVE'),
(50, '5555555555550050', 'CREDIT', 'MASTERCARD', '2033-02-28', 'HASH_CVV_0050', 'ACTIVE'),
(51, '5085000000000051', 'DEBIT', 'RUPAY', '2033-03-31', 'HASH_CVV_0051', 'ACTIVE'),
(52, '371449635398052', 'CREDIT', 'AMEX', '2033-04-30', 'HASH_CVV_0052', 'ACTIVE'),
(53, '4111111111110053', 'DEBIT', 'VISA', '2033-05-31', 'HASH_CVV_0053', 'ACTIVE'),
(54, '5555555555550054', 'CREDIT', 'MASTERCARD', '2033-06-30', 'HASH_CVV_0054', 'ACTIVE'),
(55, '5085000000000055', 'DEBIT', 'RUPAY', '2033-07-31', 'HASH_CVV_0055', 'ACTIVE'),
(56, '371449635398056', 'CREDIT', 'AMEX', '2033-08-31', 'HASH_CVV_0056', 'ACTIVE'),
(57, '4111111111110057', 'DEBIT', 'VISA', '2033-09-30', 'HASH_CVV_0057', 'ACTIVE'),
(58, '5555555555550058', 'CREDIT', 'MASTERCARD', '2033-10-31', 'HASH_CVV_0058', 'ACTIVE'),
(59, '5085000000000059', 'DEBIT', 'RUPAY', '2033-11-30', 'HASH_CVV_0059', 'ACTIVE'),
(60, '371449635398060', 'CREDIT', 'AMEX', '2033-12-31', 'HASH_CVV_0060', 'ACTIVE'),
(61, '4111111111110061', 'DEBIT', 'VISA', '2034-01-31', 'HASH_CVV_0061', 'ACTIVE'),
(62, '5555555555550062', 'CREDIT', 'MASTERCARD', '2034-02-28', 'HASH_CVV_0062', 'ACTIVE'),
(63, '5085000000000063', 'DEBIT', 'RUPAY', '2034-03-31', 'HASH_CVV_0063', 'ACTIVE'),
(64, '371449635398064', 'CREDIT', 'AMEX', '2034-04-30', 'HASH_CVV_0064', 'ACTIVE'),
(65, '4111111111110065', 'DEBIT', 'VISA', '2034-05-31', 'HASH_CVV_0065', 'ACTIVE'),
(66, '5555555555550066', 'CREDIT', 'MASTERCARD', '2034-06-30', 'HASH_CVV_0066', 'ACTIVE'),
(67, '5085000000000067', 'DEBIT', 'RUPAY', '2034-07-31', 'HASH_CVV_0067', 'ACTIVE'),
(68, '371449635398068', 'CREDIT', 'AMEX', '2034-08-31', 'HASH_CVV_0068', 'ACTIVE'),
(69, '4111111111110069', 'DEBIT', 'VISA', '2034-09-30', 'HASH_CVV_0069', 'ACTIVE'),
(70, '5555555555550070', 'CREDIT', 'MASTERCARD', '2034-10-31', 'HASH_CVV_0070', 'ACTIVE');

INSERT INTO loan
(
    customer_id,
    branch_id,
    loan_type,
    loan_amount,
    interest_rate,
    loan_status,
    start_date,
    end_date
)

VALUES

(2, 2, 'HOME_LOAN', 3500000.00, 8.25, 'ACTIVE', '2022-01-15', '2042-01-15'),
(5, 3, 'PERSONAL_LOAN', 450000.00, 11.50, 'ACTIVE', '2023-03-10', '2028-03-10'),
(7, 6, 'VEHICLE_LOAN', 950000.00, 9.20, 'ACTIVE', '2021-08-22', '2028-08-22'),
(9, 1, 'EDUCATION_LOAN', 1200000.00, 7.80, 'ACTIVE', '2020-06-01', '2030-06-01'),
(12, 9, 'BUSINESS_LOAN', 5000000.00, 10.75, 'ACTIVE', '2019-11-18', '2029-11-18'),
(15, 3, 'HOME_LOAN', 2800000.00, 8.40, 'ACTIVE', '2021-02-08', '2041-02-08'),
(18, 10, 'PERSONAL_LOAN', 300000.00, 12.10, 'CLOSED', '2018-07-12', '2023-07-12'),
(21, 5, 'VEHICLE_LOAN', 780000.00, 9.00, 'ACTIVE', '2022-05-30', '2029-05-30'),
(24, 8, 'BUSINESS_LOAN', 4200000.00, 10.25, 'ACTIVE', '2020-09-14', '2030-09-14'),
(27, 3, 'EDUCATION_LOAN', 850000.00, 7.60, 'CLOSED', '2017-06-20', '2025-06-20'),
(30, 1, 'HOME_LOAN', 4100000.00, 8.10, 'ACTIVE', '2021-01-11', '2041-01-11'),
(33, 8, 'PERSONAL_LOAN', 600000.00, 11.75, 'ACTIVE', '2023-04-05', '2028-04-05'),
(35, 10, 'VEHICLE_LOAN', 1250000.00, 9.35, 'ACTIVE', '2022-10-19', '2029-10-19'),
(38, 2, 'BUSINESS_LOAN', 6500000.00, 10.50, 'ACTIVE', '2020-02-28', '2030-02-28'),
(40, 3, 'HOME_LOAN', 3200000.00, 8.45, 'ACTIVE', '2019-08-16', '2039-08-16'),
(42, 9, 'EDUCATION_LOAN', 1500000.00, 7.95, 'ACTIVE', '2021-07-26', '2031-07-26'),
(44, 8, 'PERSONAL_LOAN', 550000.00, 12.00, 'CLOSED', '2018-05-14', '2023-05-14'),
(46, 6, 'BUSINESS_LOAN', 7200000.00, 10.90, 'ACTIVE', '2022-03-09', '2032-03-09'),
(48, 7, 'VEHICLE_LOAN', 980000.00, 9.15, 'ACTIVE', '2023-09-01', '2030-09-01'),
(50, 3, 'HOME_LOAN', 2750000.00, 8.30, 'ACTIVE', '2020-12-07', '2040-12-07');

INSERT INTO merchant
(
    merchant_category_id,
    merchant_name,
    contact_email,
    contact_number,
    city,
    state,
    country
)

VALUES

(1, 'FreshMart Supermarket', 'contact@freshmart.in', '9876500001', 'Mumbai', 'Maharashtra', 'India'),
(1, 'DailyNeeds Grocery', 'support@dailyneeds.in', '9876500002', 'Pune', 'Maharashtra', 'India'),
(1, 'GreenBasket Store', 'help@greenbasket.in', '9876500003', 'Bengaluru', 'Karnataka', 'India'),
(1, 'City Grocery Hub', 'info@citygrocery.in', '9876500004', 'Hyderabad', 'Telangana', 'India'),
(2, 'Spice Garden Restaurant', 'contact@spicegarden.in', '9876500005', 'Mumbai', 'Maharashtra', 'India'),
(2, 'Royal Tandoor', 'info@royaltandoor.in', '9876500006', 'Delhi', 'Delhi', 'India'),
(2, 'Ocean View Cafe', 'support@oceanview.in', '9876500007', 'Goa', 'Goa', 'India'),
(2, 'Urban Bites', 'hello@urbanbites.in', '9876500008', 'Pune', 'Maharashtra', 'India'),
(3, 'SpeedFuel Station', 'care@speedfuel.in', '9876500009', 'Nagpur', 'Maharashtra', 'India'),
(3, 'Highway Fuel Centre', 'support@highwayfuel.in', '9876500010', 'Nashik', 'Maharashtra', 'India'),
(3, 'Prime Petroleum', 'contact@primepetroleum.in', '9876500011', 'Ahmedabad', 'Gujarat', 'India'),
(4, 'MediCare Pharmacy', 'support@medicare.in', '9876500012', 'Mumbai', 'Maharashtra', 'India'),
(4, 'HealthPlus Pharmacy', 'care@healthplus.in', '9876500013', 'Bengaluru', 'Karnataka', 'India'),
(5, 'TechZone Electronics', 'info@techzone.in', '9876500014', 'Hyderabad', 'Telangana', 'India'),
(5, 'Digital World', 'support@digitalworld.in', '9876500015', 'Chennai', 'Tamil Nadu', 'India'),
(6, 'Fashion Street', 'contact@fashionstreet.in', '9876500016', 'Pune', 'Maharashtra', 'India'),
(6, 'Style Hub', 'hello@stylehub.in', '9876500017', 'Jaipur', 'Rajasthan', 'India'),
(7, 'ShopEasy Online', 'support@shopeasy.in', '9876500018', 'Bengaluru', 'Karnataka', 'India'),
(7, 'MegaKart', 'care@megakart.in', '9876500019', 'Gurugram', 'Haryana', 'India'),
(7, 'QuickBuy', 'contact@quickbuy.in', '9876500020', 'Noida', 'Uttar Pradesh', 'India'),
(8, 'CityCare Hospital', 'info@citycare.in', '9876500021', 'Mumbai', 'Maharashtra', 'India'),
(8, 'LifeLine Hospital', 'contact@lifeline.in', '9876500022', 'Hyderabad', 'Telangana', 'India'),
(9, 'Grand Palace Hotel', 'reservations@grandpalace.in', '9876500023', 'Jaipur', 'Rajasthan', 'India'),
(10, 'SkyWing Travels', 'support@skywing.in', '9876500024', 'Delhi', 'Delhi', 'India'),
(10, 'Journey Makers', 'contact@journeymakers.in', '9876500025', 'Bengaluru', 'Karnataka', 'India');

INSERT INTO bank_transaction
(
    account_id,
    merchant_id,
    employee_id,
    transaction_type_id,
    transaction_reference,
    transaction_amount,
    transaction_timestamp,
    transaction_status,
    transaction_channel,
    device_ip,
    device_location,
    is_suspicious
)

VALUES
(1, 1, 1, 1, 'TXN2026000001', 237.45, '2025-01-01 08:07:00', 'SUCCESS', 'ATM', NULL, 'City1', FALSE),
(2, 2, 2, 2, 'TXN2026000002', 374.90, '2025-02-02 09:14:00', 'SUCCESS', 'POS', NULL, 'City2', FALSE),
(3, 3, 3, 3, 'TXN2026000003', 512.35, '2025-03-03 10:21:00', 'SUCCESS', 'ONLINE', '192.168.3.9', 'City3', FALSE),
(4, 4, NULL, 4, 'TXN2026000004', 649.80, '2025-04-04 11:28:00', 'PENDING', 'MOBILE', '192.168.4.12', 'City4', FALSE),
(5, 5, 5, 1, 'TXN2026000005', 787.25, '2025-05-05 12:35:00', 'FAILED', 'UPI', '192.168.5.15', 'City5', FALSE),
(6, 6, 6, 2, 'TXN2026000006', 924.70, '2025-06-06 13:42:00', 'REVERSED', 'NEFT', '192.168.6.18', NULL, FALSE),
(7, 7, 7, 3, 'TXN2026000007', 1062.15, '2025-07-07 14:49:00', 'SUCCESS', 'RTGS', '192.168.7.21', 'City7', FALSE),
(8, 8, NULL, 4, 'TXN2026000008', 1199.60, '2025-08-08 15:56:00', 'SUCCESS', 'IMPS', '192.168.8.24', 'City8', FALSE),
(9, NULL, 9, 1, 'TXN2026000009', 1337.05, '2025-09-09 16:03:00', 'SUCCESS', 'ATM', NULL, 'City9', FALSE),
(10, 10, 10, 2, 'TXN2026000010', 1474.50, '2025-10-10 17:10:00', 'PENDING', 'POS', NULL, 'City10', FALSE),
(11, 11, 11, 3, 'TXN2026000011', 1611.95, '2025-11-11 08:17:00', 'FAILED', 'ONLINE', '192.168.11.33', 'City1', TRUE),
(12, 12, NULL, 4, 'TXN2026000012', 1749.40, '2025-12-12 09:24:00', 'REVERSED', 'MOBILE', '192.168.12.36', 'City2', FALSE),
(13, 13, 13, 1, 'TXN2026000013', 1886.85, '2025-01-13 10:31:00', 'SUCCESS', 'UPI', '192.168.13.39', 'City3', FALSE),
(14, 14, 14, 2, 'TXN2026000014', 2024.30, '2025-02-14 11:38:00', 'SUCCESS', 'NEFT', '192.168.14.42', NULL, FALSE),
(15, 15, 15, 3, 'TXN2026000015', 2161.75, '2025-03-15 12:45:00', 'SUCCESS', 'RTGS', '192.168.15.45', 'City5', FALSE),
(16, 16, NULL, 4, 'TXN2026000016', 2299.20, '2025-04-16 13:52:00', 'PENDING', 'IMPS', '192.168.16.48', 'City6', FALSE),
(17, 17, 17, 1, 'TXN2026000017', 2436.65, '2025-05-17 14:59:00', 'FAILED', 'ATM', NULL, 'City7', FALSE),
(18, NULL, 18, 2, 'TXN2026000018', 2574.10, '2025-06-18 15:06:00', 'REVERSED', 'POS', NULL, 'City8', FALSE),
(19, 19, 19, 3, 'TXN2026000019', 2711.55, '2025-07-19 16:13:00', 'SUCCESS', 'ONLINE', '192.168.19.57', 'City9', FALSE),
(20, 20, NULL, 4, 'TXN2026000020', 2849.00, '2025-08-20 17:20:00', 'SUCCESS', 'MOBILE', '192.168.20.60', 'City10', FALSE),
(21, 21, 21, 1, 'TXN2026000021', 2986.45, '2025-09-21 08:27:00', 'SUCCESS', 'UPI', '192.168.21.63', 'City1', FALSE),
(22, 22, 22, 2, 'TXN2026000022', 3123.90, '2025-10-22 09:34:00', 'PENDING', 'NEFT', '192.168.22.66', NULL, TRUE),
(23, 23, 23, 3, 'TXN2026000023', 3261.35, '2025-11-23 10:41:00', 'FAILED', 'RTGS', '192.168.23.69', 'City3', FALSE),
(24, 24, NULL, 4, 'TXN2026000024', 3398.80, '2025-12-24 11:48:00', 'REVERSED', 'IMPS', '192.168.24.72', 'City4', FALSE),
(25, 25, 25, 1, 'TXN2026000025', 3536.25, '2025-01-25 12:55:00', 'SUCCESS', 'ATM', NULL, 'City5', FALSE),
(26, 1, 26, 2, 'TXN2026000026', 3673.70, '2025-02-26 13:02:00', 'SUCCESS', 'POS', NULL, 'City6', FALSE),
(27, NULL, 27, 3, 'TXN2026000027', 3811.15, '2025-03-27 14:09:00', 'SUCCESS', 'ONLINE', '192.168.27.81', 'City7', FALSE),
(28, 3, NULL, 4, 'TXN2026000028', 3948.60, '2025-04-28 15:16:00', 'PENDING', 'MOBILE', '192.168.28.84', 'City8', FALSE),
(29, 4, 29, 1, 'TXN2026000029', 4086.05, '2025-05-01 16:23:00', 'FAILED', 'UPI', '192.168.29.87', 'City9', FALSE),
(30, 5, 30, 2, 'TXN2026000030', 4223.50, '2025-06-02 17:30:00', 'REVERSED', 'NEFT', '192.168.30.90', NULL, FALSE),
(31, 6, 1, 3, 'TXN2026000031', 4360.95, '2025-07-03 08:37:00', 'SUCCESS', 'RTGS', '192.168.31.93', 'City1', FALSE),
(32, 7, NULL, 4, 'TXN2026000032', 4498.40, '2025-08-04 09:44:00', 'SUCCESS', 'IMPS', '192.168.32.96', 'City2', FALSE),
(33, 8, 3, 1, 'TXN2026000033', 4635.85, '2025-09-05 10:51:00', 'SUCCESS', 'ATM', NULL, 'City3', TRUE),
(34, 9, 4, 2, 'TXN2026000034', 4773.30, '2025-10-06 11:58:00', 'PENDING', 'POS', NULL, 'City4', FALSE),
(35, 10, 5, 3, 'TXN2026000035', 4910.75, '2025-11-07 12:05:00', 'FAILED', 'ONLINE', '192.168.35.105', 'City5', FALSE),
(36, NULL, NULL, 4, 'TXN2026000036', 5048.20, '2025-12-08 13:12:00', 'REVERSED', 'MOBILE', '192.168.36.108', 'City6', FALSE),
(37, 12, 7, 1, 'TXN2026000037', 5185.65, '2025-01-09 14:19:00', 'SUCCESS', 'UPI', '192.168.37.111', 'City7', FALSE),
(38, 13, 8, 2, 'TXN2026000038', 5323.10, '2025-02-10 15:26:00', 'SUCCESS', 'NEFT', '192.168.38.114', NULL, FALSE),
(39, 14, 9, 3, 'TXN2026000039', 5460.55, '2025-03-11 16:33:00', 'SUCCESS', 'RTGS', '192.168.39.117', 'City9', FALSE),
(40, 15, NULL, 4, 'TXN2026000040', 5598.00, '2025-04-12 17:40:00', 'PENDING', 'IMPS', '192.168.40.120', 'City10', FALSE),
(41, 16, 11, 1, 'TXN2026000041', 5735.45, '2025-05-13 08:47:00', 'FAILED', 'ATM', NULL, 'City1', FALSE),
(42, 17, 12, 2, 'TXN2026000042', 5872.90, '2025-06-14 09:54:00', 'REVERSED', 'POS', NULL, 'City2', FALSE),
(43, 18, 13, 3, 'TXN2026000043', 6010.35, '2025-07-15 10:01:00', 'SUCCESS', 'ONLINE', '192.168.43.129', 'City3', FALSE),
(44, 19, NULL, 4, 'TXN2026000044', 6147.80, '2025-08-16 11:08:00', 'SUCCESS', 'MOBILE', '192.168.44.132', 'City4', TRUE),
(45, NULL, 15, 1, 'TXN2026000045', 6285.25, '2025-09-17 12:15:00', 'SUCCESS', 'UPI', '192.168.45.135', 'City5', FALSE),
(46, 21, 16, 2, 'TXN2026000046', 6422.70, '2025-10-18 13:22:00', 'PENDING', 'NEFT', '192.168.46.138', NULL, FALSE),
(47, 22, 17, 3, 'TXN2026000047', 6560.15, '2025-11-19 14:29:00', 'FAILED', 'RTGS', '192.168.47.141', 'City7', FALSE),
(48, 23, NULL, 4, 'TXN2026000048', 6697.60, '2025-12-20 15:36:00', 'REVERSED', 'IMPS', '192.168.48.144', 'City8', FALSE),
(49, 24, 19, 1, 'TXN2026000049', 6835.05, '2025-01-21 16:43:00', 'SUCCESS', 'ATM', NULL, 'City9', FALSE),
(50, 25, 20, 2, 'TXN2026000050', 6972.50, '2025-02-22 17:50:00', 'SUCCESS', 'POS', NULL, 'City10', FALSE),
(51, 1, 21, 3, 'TXN2026000051', 7109.95, '2025-03-23 08:57:00', 'SUCCESS', 'ONLINE', '192.168.51.153', 'City1', FALSE),
(52, 2, NULL, 4, 'TXN2026000052', 7247.40, '2025-04-24 09:04:00', 'PENDING', 'MOBILE', '192.168.52.156', 'City2', FALSE),
(53, 3, 23, 1, 'TXN2026000053', 7384.85, '2025-05-25 10:11:00', 'FAILED', 'UPI', '192.168.53.159', 'City3', FALSE),
(54, NULL, 24, 2, 'TXN2026000054', 7522.30, '2025-06-26 11:18:00', 'REVERSED', 'NEFT', '192.168.54.162', NULL, FALSE),
(55, 5, 25, 3, 'TXN2026000055', 7659.75, '2025-07-27 12:25:00', 'SUCCESS', 'RTGS', '192.168.55.165', 'City5', TRUE),
(56, 6, NULL, 4, 'TXN2026000056', 7797.20, '2025-08-28 13:32:00', 'SUCCESS', 'IMPS', '192.168.56.168', 'City6', FALSE),
(57, 7, 27, 1, 'TXN2026000057', 7934.65, '2025-09-01 14:39:00', 'SUCCESS', 'ATM', NULL, 'City7', FALSE),
(58, 8, 28, 2, 'TXN2026000058', 8072.10, '2025-10-02 15:46:00', 'PENDING', 'POS', NULL, 'City8', FALSE),
(59, 9, 29, 3, 'TXN2026000059', 8209.55, '2025-11-03 16:53:00', 'FAILED', 'ONLINE', '192.168.59.177', 'City9', FALSE),
(60, 10, NULL, 4, 'TXN2026000060', 8347.00, '2025-12-04 17:00:00', 'REVERSED', 'MOBILE', '192.168.60.180', 'City10', FALSE),
(61, 11, 1, 1, 'TXN2026000061', 8484.45, '2025-01-05 08:07:00', 'SUCCESS', 'UPI', '192.168.61.183', 'City1', FALSE),
(62, 12, 2, 2, 'TXN2026000062', 8621.90, '2025-02-06 09:14:00', 'SUCCESS', 'NEFT', '192.168.62.186', NULL, FALSE),
(63, NULL, 3, 3, 'TXN2026000063', 8759.35, '2025-03-07 10:21:00', 'SUCCESS', 'RTGS', '192.168.63.189', 'City3', FALSE),
(64, 14, NULL, 4, 'TXN2026000064', 8896.80, '2025-04-08 11:28:00', 'PENDING', 'IMPS', '192.168.64.192', 'City4', FALSE),
(65, 15, 5, 1, 'TXN2026000065', 9034.25, '2025-05-09 12:35:00', 'FAILED', 'ATM', NULL, 'City5', FALSE),
(66, 16, 6, 2, 'TXN2026000066', 9171.70, '2025-06-10 13:42:00', 'REVERSED', 'POS', NULL, 'City6', TRUE),
(67, 17, 7, 3, 'TXN2026000067', 9309.15, '2025-07-11 14:49:00', 'SUCCESS', 'ONLINE', '192.168.67.201', 'City7', FALSE),
(68, 18, NULL, 4, 'TXN2026000068', 9446.60, '2025-08-12 15:56:00', 'SUCCESS', 'MOBILE', '192.168.68.204', 'City8', FALSE),
(69, 19, 9, 1, 'TXN2026000069', 9584.05, '2025-09-13 16:03:00', 'SUCCESS', 'UPI', '192.168.69.207', 'City9', FALSE),
(70, 20, 10, 2, 'TXN2026000070', 9721.50, '2025-10-14 17:10:00', 'PENDING', 'NEFT', '192.168.70.210', NULL, FALSE),
(1, 21, 11, 3, 'TXN2026000071', 9858.95, '2025-11-15 08:17:00', 'FAILED', 'RTGS', '192.168.71.213', 'City1', FALSE),
(2, NULL, NULL, 4, 'TXN2026000072', 9996.40, '2025-12-16 09:24:00', 'REVERSED', 'IMPS', '192.168.72.216', 'City2', FALSE),
(3, 23, 13, 1, 'TXN2026000073', 10133.85, '2025-01-17 10:31:00', 'SUCCESS', 'ATM', NULL, 'City3', FALSE),
(4, 24, 14, 2, 'TXN2026000074', 10271.30, '2025-02-18 11:38:00', 'SUCCESS', 'POS', NULL, 'City4', FALSE),
(5, 25, 15, 3, 'TXN2026000075', 10408.75, '2025-03-19 12:45:00', 'SUCCESS', 'ONLINE', '192.168.75.225', 'City5', FALSE),
(6, 1, NULL, 4, 'TXN2026000076', 10546.20, '2025-04-20 13:52:00', 'PENDING', 'MOBILE', '192.168.76.228', 'City6', FALSE),
(7, 2, 17, 1, 'TXN2026000077', 10683.65, '2025-05-21 14:59:00', 'FAILED', 'UPI', '192.168.77.231', 'City7', TRUE),
(8, 3, 18, 2, 'TXN2026000078', 10821.10, '2025-06-22 15:06:00', 'REVERSED', 'NEFT', '192.168.78.234', NULL, FALSE),
(9, 4, 19, 3, 'TXN2026000079', 10958.55, '2025-07-23 16:13:00', 'SUCCESS', 'RTGS', '192.168.79.237', 'City9', FALSE),
(10, 5, NULL, 4, 'TXN2026000080', 11096.00, '2025-08-24 17:20:00', 'SUCCESS', 'IMPS', '192.168.80.240', 'City10', FALSE),
(11, NULL, 21, 1, 'TXN2026000081', 11233.45, '2025-09-25 08:27:00', 'SUCCESS', 'ATM', NULL, 'City1', FALSE),
(12, 7, 22, 2, 'TXN2026000082', 11370.90, '2025-10-26 09:34:00', 'PENDING', 'POS', NULL, 'City2', FALSE),
(13, 8, 23, 3, 'TXN2026000083', 11508.35, '2025-11-27 10:41:00', 'FAILED', 'ONLINE', '192.168.83.249', 'City3', FALSE),
(14, 9, NULL, 4, 'TXN2026000084', 11645.80, '2025-12-28 11:48:00', 'REVERSED', 'MOBILE', '192.168.84.252', 'City4', FALSE),
(15, 10, 25, 1, 'TXN2026000085', 11783.25, '2025-01-01 12:55:00', 'SUCCESS', 'UPI', '192.168.85.0', 'City5', FALSE),
(16, 11, 26, 2, 'TXN2026000086', 11920.70, '2025-02-02 13:02:00', 'SUCCESS', 'NEFT', '192.168.86.3', NULL, FALSE),
(17, 12, 27, 3, 'TXN2026000087', 12058.15, '2025-03-03 14:09:00', 'SUCCESS', 'RTGS', '192.168.87.6', 'City7', FALSE),
(18, 13, NULL, 4, 'TXN2026000088', 12195.60, '2025-04-04 15:16:00', 'PENDING', 'IMPS', '192.168.88.9', 'City8', TRUE),
(19, 14, 29, 1, 'TXN2026000089', 12333.05, '2025-05-05 16:23:00', 'FAILED', 'ATM', NULL, 'City9', FALSE),
(20, NULL, 30, 2, 'TXN2026000090', 12470.50, '2025-06-06 17:30:00', 'REVERSED', 'POS', NULL, 'City10', FALSE),
(21, 16, 1, 3, 'TXN2026000091', 12607.95, '2025-07-07 08:37:00', 'SUCCESS', 'ONLINE', '192.168.91.18', 'City1', FALSE),
(22, 17, NULL, 4, 'TXN2026000092', 12745.40, '2025-08-08 09:44:00', 'SUCCESS', 'MOBILE', '192.168.92.21', 'City2', FALSE),
(23, 18, 3, 1, 'TXN2026000093', 12882.85, '2025-09-09 10:51:00', 'SUCCESS', 'UPI', '192.168.93.24', 'City3', FALSE),
(24, 19, 4, 2, 'TXN2026000094', 13020.30, '2025-10-10 11:58:00', 'PENDING', 'NEFT', '192.168.94.27', NULL, FALSE),
(25, 20, 5, 3, 'TXN2026000095', 13157.75, '2025-11-11 12:05:00', 'FAILED', 'RTGS', '192.168.95.30', 'City5', FALSE),
(26, 21, NULL, 4, 'TXN2026000096', 13295.20, '2025-12-12 13:12:00', 'REVERSED', 'IMPS', '192.168.96.33', 'City6', FALSE),
(27, 22, 7, 1, 'TXN2026000097', 13432.65, '2025-01-13 14:19:00', 'SUCCESS', 'ATM', NULL, 'City7', FALSE),
(28, 23, 8, 2, 'TXN2026000098', 13570.10, '2025-02-14 15:26:00', 'SUCCESS', 'POS', NULL, 'City8', FALSE),
(29, NULL, 9, 3, 'TXN2026000099', 13707.55, '2025-03-15 16:33:00', 'SUCCESS', 'ONLINE', '192.168.99.42', 'City9', TRUE),
(30, 25, NULL, 4, 'TXN2026000100', 13845.00, '2025-04-16 17:40:00', 'PENDING', 'MOBILE', '192.168.100.45', 'City10', FALSE),
(31, 1, 11, 1, 'TXN2026000101', 13982.45, '2025-05-17 08:47:00', 'FAILED', 'UPI', '192.168.101.48', 'City1', FALSE),
(32, 2, 12, 2, 'TXN2026000102', 14119.90, '2025-06-18 09:54:00', 'REVERSED', 'NEFT', '192.168.102.51', NULL, FALSE),
(33, 3, 13, 3, 'TXN2026000103', 14257.35, '2025-07-19 10:01:00', 'SUCCESS', 'RTGS', '192.168.103.54', 'City3', FALSE),
(34, 4, NULL, 4, 'TXN2026000104', 14394.80, '2025-08-20 11:08:00', 'SUCCESS', 'IMPS', '192.168.104.57', 'City4', FALSE),
(35, 5, 15, 1, 'TXN2026000105', 14532.25, '2025-09-21 12:15:00', 'SUCCESS', 'ATM', NULL, 'City5', FALSE),
(36, 6, 16, 2, 'TXN2026000106', 14669.70, '2025-10-22 13:22:00', 'PENDING', 'POS', NULL, 'City6', FALSE),
(37, 7, 17, 3, 'TXN2026000107', 14807.15, '2025-11-23 14:29:00', 'FAILED', 'ONLINE', '192.168.107.66', 'City7', FALSE),
(38, NULL, NULL, 4, 'TXN2026000108', 14944.60, '2025-12-24 15:36:00', 'REVERSED', 'MOBILE', '192.168.108.69', 'City8', FALSE),
(39, 9, 19, 1, 'TXN2026000109', 15082.05, '2025-01-25 16:43:00', 'SUCCESS', 'UPI', '192.168.109.72', 'City9', FALSE),
(40, 10, 20, 2, 'TXN2026000110', 15219.50, '2025-02-26 17:50:00', 'SUCCESS', 'NEFT', '192.168.110.75', NULL, TRUE),
(41, 11, 21, 3, 'TXN2026000111', 15356.95, '2025-03-27 08:57:00', 'SUCCESS', 'RTGS', '192.168.111.78', 'City1', FALSE),
(42, 12, NULL, 4, 'TXN2026000112', 15494.40, '2025-04-28 09:04:00', 'PENDING', 'IMPS', '192.168.112.81', 'City2', FALSE),
(43, 13, 23, 1, 'TXN2026000113', 15631.85, '2025-05-01 10:11:00', 'FAILED', 'ATM', NULL, 'City3', FALSE),
(44, 14, 24, 2, 'TXN2026000114', 15769.30, '2025-06-02 11:18:00', 'REVERSED', 'POS', NULL, 'City4', FALSE),
(45, 15, 25, 3, 'TXN2026000115', 15906.75, '2025-07-03 12:25:00', 'SUCCESS', 'ONLINE', '192.168.115.90', 'City5', FALSE),
(46, 16, NULL, 4, 'TXN2026000116', 16044.20, '2025-08-04 13:32:00', 'SUCCESS', 'MOBILE', '192.168.116.93', 'City6', FALSE),
(47, NULL, 27, 1, 'TXN2026000117', 16181.65, '2025-09-05 14:39:00', 'SUCCESS', 'UPI', '192.168.117.96', 'City7', FALSE),
(48, 18, 28, 2, 'TXN2026000118', 16319.10, '2025-10-06 15:46:00', 'PENDING', 'NEFT', '192.168.118.99', NULL, FALSE),
(49, 19, 29, 3, 'TXN2026000119', 16456.55, '2025-11-07 16:53:00', 'FAILED', 'RTGS', '192.168.119.102', 'City9', FALSE),
(50, 20, NULL, 4, 'TXN2026000120', 16594.00, '2025-12-08 17:00:00', 'REVERSED', 'IMPS', '192.168.120.105', 'City10', FALSE),
(51, 21, 1, 1, 'TXN2026000121', 16731.45, '2025-01-09 08:07:00', 'SUCCESS', 'ATM', NULL, 'City1', TRUE),
(52, 22, 2, 2, 'TXN2026000122', 16868.90, '2025-02-10 09:14:00', 'SUCCESS', 'POS', NULL, 'City2', FALSE),
(53, 23, 3, 3, 'TXN2026000123', 17006.35, '2025-03-11 10:21:00', 'SUCCESS', 'ONLINE', '192.168.123.114', 'City3', FALSE),
(54, 24, NULL, 4, 'TXN2026000124', 17143.80, '2025-04-12 11:28:00', 'PENDING', 'MOBILE', '192.168.124.117', 'City4', FALSE),
(55, 25, 5, 1, 'TXN2026000125', 17281.25, '2025-05-13 12:35:00', 'FAILED', 'UPI', '192.168.125.120', 'City5', FALSE),
(56, NULL, 6, 2, 'TXN2026000126', 17418.70, '2025-06-14 13:42:00', 'REVERSED', 'NEFT', '192.168.126.123', NULL, FALSE),
(57, 2, 7, 3, 'TXN2026000127', 17556.15, '2025-07-15 14:49:00', 'SUCCESS', 'RTGS', '192.168.127.126', 'City7', FALSE),
(58, 3, NULL, 4, 'TXN2026000128', 17693.60, '2025-08-16 15:56:00', 'SUCCESS', 'IMPS', '192.168.128.129', 'City8', FALSE),
(59, 4, 9, 1, 'TXN2026000129', 17831.05, '2025-09-17 16:03:00', 'SUCCESS', 'ATM', NULL, 'City9', FALSE),
(60, 5, 10, 2, 'TXN2026000130', 17968.50, '2025-10-18 17:10:00', 'PENDING', 'POS', NULL, 'City10', FALSE),
(61, 6, 11, 3, 'TXN2026000131', 18105.95, '2025-11-19 08:17:00', 'FAILED', 'ONLINE', '192.168.131.138', 'City1', FALSE),
(62, 7, NULL, 4, 'TXN2026000132', 18243.40, '2025-12-20 09:24:00', 'REVERSED', 'MOBILE', '192.168.132.141', 'City2', TRUE),
(63, 8, 13, 1, 'TXN2026000133', 18380.85, '2025-01-21 10:31:00', 'SUCCESS', 'UPI', '192.168.133.144', 'City3', FALSE),
(64, 9, 14, 2, 'TXN2026000134', 18518.30, '2025-02-22 11:38:00', 'SUCCESS', 'NEFT', '192.168.134.147', NULL, FALSE),
(65, NULL, 15, 3, 'TXN2026000135', 18655.75, '2025-03-23 12:45:00', 'SUCCESS', 'RTGS', '192.168.135.150', 'City5', FALSE),
(66, 11, NULL, 4, 'TXN2026000136', 18793.20, '2025-04-24 13:52:00', 'PENDING', 'IMPS', '192.168.136.153', 'City6', FALSE),
(67, 12, 17, 1, 'TXN2026000137', 18930.65, '2025-05-25 14:59:00', 'FAILED', 'ATM', NULL, 'City7', FALSE),
(68, 13, 18, 2, 'TXN2026000138', 19068.10, '2025-06-26 15:06:00', 'REVERSED', 'POS', NULL, 'City8', FALSE),
(69, 14, 19, 3, 'TXN2026000139', 19205.55, '2025-07-27 16:13:00', 'SUCCESS', 'ONLINE', '192.168.139.162', 'City9', FALSE),
(70, 15, NULL, 4, 'TXN2026000140', 19343.00, '2025-08-28 17:20:00', 'SUCCESS', 'MOBILE', '192.168.140.165', 'City10', FALSE),
(1, 16, 21, 1, 'TXN2026000141', 19480.45, '2025-09-01 08:27:00', 'SUCCESS', 'UPI', '192.168.141.168', 'City1', FALSE),
(2, 17, 22, 2, 'TXN2026000142', 19617.90, '2025-10-02 09:34:00', 'PENDING', 'NEFT', '192.168.142.171', NULL, FALSE),
(3, 18, 23, 3, 'TXN2026000143', 19755.35, '2025-11-03 10:41:00', 'FAILED', 'RTGS', '192.168.143.174', 'City3', TRUE),
(4, NULL, NULL, 4, 'TXN2026000144', 19892.80, '2025-12-04 11:48:00', 'REVERSED', 'IMPS', '192.168.144.177', 'City4', FALSE),
(5, 20, 25, 1, 'TXN2026000145', 20030.25, '2025-01-05 12:55:00', 'SUCCESS', 'ATM', NULL, 'City5', FALSE),
(6, 21, 26, 2, 'TXN2026000146', 20167.70, '2025-02-06 13:02:00', 'SUCCESS', 'POS', NULL, 'City6', FALSE),
(7, 22, 27, 3, 'TXN2026000147', 20305.15, '2025-03-07 14:09:00', 'SUCCESS', 'ONLINE', '192.168.147.186', 'City7', FALSE),
(8, 23, NULL, 4, 'TXN2026000148', 20442.60, '2025-04-08 15:16:00', 'PENDING', 'MOBILE', '192.168.148.189', 'City8', FALSE),
(9, 24, 29, 1, 'TXN2026000149', 20580.05, '2025-05-09 16:23:00', 'FAILED', 'UPI', '192.168.149.192', 'City9', FALSE),
(10, 25, 30, 2, 'TXN2026000150', 20717.50, '2025-06-10 17:30:00', 'REVERSED', 'NEFT', '192.168.150.195', NULL, FALSE),
(11, 1, 1, 3, 'TXN2026000151', 20854.95, '2025-07-11 08:37:00', 'SUCCESS', 'RTGS', '192.168.151.198', 'City1', FALSE),
(12, 2, NULL, 4, 'TXN2026000152', 20992.40, '2025-08-12 09:44:00', 'SUCCESS', 'IMPS', '192.168.152.201', 'City2', FALSE),
(13, NULL, 3, 1, 'TXN2026000153', 21129.85, '2025-09-13 10:51:00', 'SUCCESS', 'ATM', NULL, 'City3', FALSE),
(14, 4, 4, 2, 'TXN2026000154', 21267.30, '2025-10-14 11:58:00', 'PENDING', 'POS', NULL, 'City4', TRUE),
(15, 5, 5, 3, 'TXN2026000155', 21404.75, '2025-11-15 12:05:00', 'FAILED', 'ONLINE', '192.168.155.210', 'City5', FALSE),
(16, 6, NULL, 4, 'TXN2026000156', 21542.20, '2025-12-16 13:12:00', 'REVERSED', 'MOBILE', '192.168.156.213', 'City6', FALSE),
(17, 7, 7, 1, 'TXN2026000157', 21679.65, '2025-01-17 14:19:00', 'SUCCESS', 'UPI', '192.168.157.216', 'City7', FALSE),
(18, 8, 8, 2, 'TXN2026000158', 21817.10, '2025-02-18 15:26:00', 'SUCCESS', 'NEFT', '192.168.158.219', NULL, FALSE),
(19, 9, 9, 3, 'TXN2026000159', 21954.55, '2025-03-19 16:33:00', 'SUCCESS', 'RTGS', '192.168.159.222', 'City9', FALSE),
(20, 10, NULL, 4, 'TXN2026000160', 22092.00, '2025-04-20 17:40:00', 'PENDING', 'IMPS', '192.168.160.225', 'City10', FALSE),
(21, 11, 11, 1, 'TXN2026000161', 22229.45, '2025-05-21 08:47:00', 'FAILED', 'ATM', NULL, 'City1', FALSE),
(22, NULL, 12, 2, 'TXN2026000162', 22366.90, '2025-06-22 09:54:00', 'REVERSED', 'POS', NULL, 'City2', FALSE),
(23, 13, 13, 3, 'TXN2026000163', 22504.35, '2025-07-23 10:01:00', 'SUCCESS', 'ONLINE', '192.168.163.234', 'City3', FALSE),
(24, 14, NULL, 4, 'TXN2026000164', 22641.80, '2025-08-24 11:08:00', 'SUCCESS', 'MOBILE', '192.168.164.237', 'City4', FALSE),
(25, 15, 15, 1, 'TXN2026000165', 22779.25, '2025-09-25 12:15:00', 'SUCCESS', 'UPI', '192.168.165.240', 'City5', TRUE),
(26, 16, 16, 2, 'TXN2026000166', 22916.70, '2025-10-26 13:22:00', 'PENDING', 'NEFT', '192.168.166.243', NULL, FALSE),
(27, 17, 17, 3, 'TXN2026000167', 23054.15, '2025-11-27 14:29:00', 'FAILED', 'RTGS', '192.168.167.246', 'City7', FALSE),
(28, 18, NULL, 4, 'TXN2026000168', 23191.60, '2025-12-28 15:36:00', 'REVERSED', 'IMPS', '192.168.168.249', 'City8', FALSE),
(29, 19, 19, 1, 'TXN2026000169', 23329.05, '2025-01-01 16:43:00', 'SUCCESS', 'ATM', NULL, 'City9', FALSE),
(30, 20, 20, 2, 'TXN2026000170', 23466.50, '2025-02-02 17:50:00', 'SUCCESS', 'POS', NULL, 'City10', FALSE),
(31, NULL, 21, 3, 'TXN2026000171', 23603.95, '2025-03-03 08:57:00', 'SUCCESS', 'ONLINE', '192.168.171.3', 'City1', FALSE),
(32, 22, NULL, 4, 'TXN2026000172', 23741.40, '2025-04-04 09:04:00', 'PENDING', 'MOBILE', '192.168.172.6', 'City2', FALSE),
(33, 23, 23, 1, 'TXN2026000173', 23878.85, '2025-05-05 10:11:00', 'FAILED', 'UPI', '192.168.173.9', 'City3', FALSE),
(34, 24, 24, 2, 'TXN2026000174', 24016.30, '2025-06-06 11:18:00', 'REVERSED', 'NEFT', '192.168.174.12', NULL, FALSE),
(35, 25, 25, 3, 'TXN2026000175', 24153.75, '2025-07-07 12:25:00', 'SUCCESS', 'RTGS', '192.168.175.15', 'City5', FALSE),
(36, 1, NULL, 4, 'TXN2026000176', 24291.20, '2025-08-08 13:32:00', 'SUCCESS', 'IMPS', '192.168.176.18', 'City6', TRUE),
(37, 2, 27, 1, 'TXN2026000177', 24428.65, '2025-09-09 14:39:00', 'SUCCESS', 'ATM', NULL, 'City7', FALSE),
(38, 3, 28, 2, 'TXN2026000178', 24566.10, '2025-10-10 15:46:00', 'PENDING', 'POS', NULL, 'City8', FALSE),
(39, 4, 29, 3, 'TXN2026000179', 24703.55, '2025-11-11 16:53:00', 'FAILED', 'ONLINE', '192.168.179.27', 'City9', FALSE),
(40, NULL, NULL, 4, 'TXN2026000180', 24841.00, '2025-12-12 17:00:00', 'REVERSED', 'MOBILE', '192.168.180.30', 'City10', FALSE),
(41, 6, 1, 1, 'TXN2026000181', 24978.45, '2025-01-13 08:07:00', 'SUCCESS', 'UPI', '192.168.181.33', 'City1', FALSE),
(42, 7, 2, 2, 'TXN2026000182', 25115.90, '2025-02-14 09:14:00', 'SUCCESS', 'NEFT', '192.168.182.36', NULL, FALSE),
(43, 8, 3, 3, 'TXN2026000183', 25253.35, '2025-03-15 10:21:00', 'SUCCESS', 'RTGS', '192.168.183.39', 'City3', FALSE),
(44, 9, NULL, 4, 'TXN2026000184', 25390.80, '2025-04-16 11:28:00', 'PENDING', 'IMPS', '192.168.184.42', 'City4', FALSE),
(45, 10, 5, 1, 'TXN2026000185', 25528.25, '2025-05-17 12:35:00', 'FAILED', 'ATM', NULL, 'City5', FALSE),
(46, 11, 6, 2, 'TXN2026000186', 25665.70, '2025-06-18 13:42:00', 'REVERSED', 'POS', NULL, 'City6', FALSE),
(47, 12, 7, 3, 'TXN2026000187', 25803.15, '2025-07-19 14:49:00', 'SUCCESS', 'ONLINE', '192.168.187.51', 'City7', TRUE),
(48, 13, NULL, 4, 'TXN2026000188', 25940.60, '2025-08-20 15:56:00', 'SUCCESS', 'MOBILE', '192.168.188.54', 'City8', FALSE),
(49, NULL, 9, 1, 'TXN2026000189', 26078.05, '2025-09-21 16:03:00', 'SUCCESS', 'UPI', '192.168.189.57', 'City9', FALSE),
(50, 15, 10, 2, 'TXN2026000190', 26215.50, '2025-10-22 17:10:00', 'PENDING', 'NEFT', '192.168.190.60', NULL, FALSE),
(51, 16, 11, 3, 'TXN2026000191', 26352.95, '2025-11-23 08:17:00', 'FAILED', 'RTGS', '192.168.191.63', 'City1', FALSE),
(52, 17, NULL, 4, 'TXN2026000192', 26490.40, '2025-12-24 09:24:00', 'REVERSED', 'IMPS', '192.168.192.66', 'City2', FALSE),
(53, 18, 13, 1, 'TXN2026000193', 26627.85, '2025-01-25 10:31:00', 'SUCCESS', 'ATM', NULL, 'City3', FALSE),
(54, 19, 14, 2, 'TXN2026000194', 26765.30, '2025-02-26 11:38:00', 'SUCCESS', 'POS', NULL, 'City4', FALSE),
(55, 20, 15, 3, 'TXN2026000195', 26902.75, '2025-03-27 12:45:00', 'SUCCESS', 'ONLINE', '192.168.195.75', 'City5', FALSE),
(56, 21, NULL, 4, 'TXN2026000196', 27040.20, '2025-04-28 13:52:00', 'PENDING', 'MOBILE', '192.168.196.78', 'City6', FALSE),
(57, 22, 17, 1, 'TXN2026000197', 27177.65, '2025-05-01 14:59:00', 'FAILED', 'UPI', '192.168.197.81', 'City7', FALSE),
(58, NULL, 18, 2, 'TXN2026000198', 27315.10, '2025-06-02 15:06:00', 'REVERSED', 'NEFT', '192.168.198.84', NULL, TRUE),
(59, 24, 19, 3, 'TXN2026000199', 27452.55, '2025-07-03 16:13:00', 'SUCCESS', 'RTGS', '192.168.199.87', 'City9', FALSE),
(60, 25, NULL, 4, 'TXN2026000200', 27590.00, '2025-08-04 17:20:00', 'SUCCESS', 'IMPS', '192.168.200.90', 'City10', FALSE),
(61, 1, 21, 1, 'TXN2026000201', 27727.45, '2025-09-05 08:27:00', 'SUCCESS', 'ATM', NULL, 'City1', FALSE),
(62, 2, 22, 2, 'TXN2026000202', 27864.90, '2025-10-06 09:34:00', 'PENDING', 'POS', NULL, 'City2', FALSE),
(63, 3, 23, 3, 'TXN2026000203', 28002.35, '2025-11-07 10:41:00', 'FAILED', 'ONLINE', '192.168.203.99', 'City3', FALSE),
(64, 4, NULL, 4, 'TXN2026000204', 28139.80, '2025-12-08 11:48:00', 'REVERSED', 'MOBILE', '192.168.204.102', 'City4', FALSE),
(65, 5, 25, 1, 'TXN2026000205', 28277.25, '2025-01-09 12:55:00', 'SUCCESS', 'UPI', '192.168.205.105', 'City5', FALSE),
(66, 6, 26, 2, 'TXN2026000206', 28414.70, '2025-02-10 13:02:00', 'SUCCESS', 'NEFT', '192.168.206.108', NULL, FALSE),
(67, NULL, 27, 3, 'TXN2026000207', 28552.15, '2025-03-11 14:09:00', 'SUCCESS', 'RTGS', '192.168.207.111', 'City7', FALSE),
(68, 8, NULL, 4, 'TXN2026000208', 28689.60, '2025-04-12 15:16:00', 'PENDING', 'IMPS', '192.168.208.114', 'City8', FALSE),
(69, 9, 29, 1, 'TXN2026000209', 28827.05, '2025-05-13 16:23:00', 'FAILED', 'ATM', NULL, 'City9', TRUE),
(70, 10, 30, 2, 'TXN2026000210', 28964.50, '2025-06-14 17:30:00', 'REVERSED', 'POS', NULL, 'City10', FALSE),
(1, 11, 1, 3, 'TXN2026000211', 29101.95, '2025-07-15 08:37:00', 'SUCCESS', 'ONLINE', '192.168.211.123', 'City1', FALSE),
(2, 12, NULL, 4, 'TXN2026000212', 29239.40, '2025-08-16 09:44:00', 'SUCCESS', 'MOBILE', '192.168.212.126', 'City2', FALSE),
(3, 13, 3, 1, 'TXN2026000213', 29376.85, '2025-09-17 10:51:00', 'SUCCESS', 'UPI', '192.168.213.129', 'City3', FALSE),
(4, 14, 4, 2, 'TXN2026000214', 29514.30, '2025-10-18 11:58:00', 'PENDING', 'NEFT', '192.168.214.132', NULL, FALSE),
(5, 15, 5, 3, 'TXN2026000215', 29651.75, '2025-11-19 12:05:00', 'FAILED', 'RTGS', '192.168.215.135', 'City5', FALSE),
(6, NULL, NULL, 4, 'TXN2026000216', 29789.20, '2025-12-20 13:12:00', 'REVERSED', 'IMPS', '192.168.216.138', 'City6', FALSE),
(7, 17, 7, 1, 'TXN2026000217', 29926.65, '2025-01-21 14:19:00', 'SUCCESS', 'ATM', NULL, 'City7', FALSE),
(8, 18, 8, 2, 'TXN2026000218', 30064.10, '2025-02-22 15:26:00', 'SUCCESS', 'POS', NULL, 'City8', FALSE),
(9, 19, 9, 3, 'TXN2026000219', 30201.55, '2025-03-23 16:33:00', 'SUCCESS', 'ONLINE', '192.168.219.147', 'City9', FALSE),
(10, 20, NULL, 4, 'TXN2026000220', 30339.00, '2025-04-24 17:40:00', 'PENDING', 'MOBILE', '192.168.220.150', 'City10', TRUE),
(11, 21, 11, 1, 'TXN2026000221', 30476.45, '2025-05-25 08:47:00', 'FAILED', 'UPI', '192.168.221.153', 'City1', FALSE),
(12, 22, 12, 2, 'TXN2026000222', 30613.90, '2025-06-26 09:54:00', 'REVERSED', 'NEFT', '192.168.222.156', NULL, FALSE),
(13, 23, 13, 3, 'TXN2026000223', 30751.35, '2025-07-27 10:01:00', 'SUCCESS', 'RTGS', '192.168.223.159', 'City3', FALSE),
(14, 24, NULL, 4, 'TXN2026000224', 30888.80, '2025-08-28 11:08:00', 'SUCCESS', 'IMPS', '192.168.224.162', 'City4', FALSE),
(15, NULL, 15, 1, 'TXN2026000225', 31026.25, '2025-09-01 12:15:00', 'SUCCESS', 'ATM', NULL, 'City5', FALSE),
(16, 1, 16, 2, 'TXN2026000226', 31163.70, '2025-10-02 13:22:00', 'PENDING', 'POS', NULL, 'City6', FALSE),
(17, 2, 17, 3, 'TXN2026000227', 31301.15, '2025-11-03 14:29:00', 'FAILED', 'ONLINE', '192.168.227.171', 'City7', FALSE),
(18, 3, NULL, 4, 'TXN2026000228', 31438.60, '2025-12-04 15:36:00', 'REVERSED', 'MOBILE', '192.168.228.174', 'City8', FALSE),
(19, 4, 19, 1, 'TXN2026000229', 31576.05, '2025-01-05 16:43:00', 'SUCCESS', 'UPI', '192.168.229.177', 'City9', FALSE),
(20, 5, 20, 2, 'TXN2026000230', 31713.50, '2025-02-06 17:50:00', 'SUCCESS', 'NEFT', '192.168.230.180', NULL, FALSE),
(21, 6, 21, 3, 'TXN2026000231', 31850.95, '2025-03-07 08:57:00', 'SUCCESS', 'RTGS', '192.168.231.183', 'City1', TRUE),
(22, 7, NULL, 4, 'TXN2026000232', 31988.40, '2025-04-08 09:04:00', 'PENDING', 'IMPS', '192.168.232.186', 'City2', FALSE),
(23, 8, 23, 1, 'TXN2026000233', 32125.85, '2025-05-09 10:11:00', 'FAILED', 'ATM', NULL, 'City3', FALSE),
(24, NULL, 24, 2, 'TXN2026000234', 32263.30, '2025-06-10 11:18:00', 'REVERSED', 'POS', NULL, 'City4', FALSE),
(25, 10, 25, 3, 'TXN2026000235', 32400.75, '2025-07-11 12:25:00', 'SUCCESS', 'ONLINE', '192.168.235.195', 'City5', FALSE),
(26, 11, NULL, 4, 'TXN2026000236', 32538.20, '2025-08-12 13:32:00', 'SUCCESS', 'MOBILE', '192.168.236.198', 'City6', FALSE),
(27, 12, 27, 1, 'TXN2026000237', 32675.65, '2025-09-13 14:39:00', 'SUCCESS', 'UPI', '192.168.237.201', 'City7', FALSE),
(28, 13, 28, 2, 'TXN2026000238', 32813.10, '2025-10-14 15:46:00', 'PENDING', 'NEFT', '192.168.238.204', NULL, FALSE),
(29, 14, 29, 3, 'TXN2026000239', 32950.55, '2025-11-15 16:53:00', 'FAILED', 'RTGS', '192.168.239.207', 'City9', FALSE),
(30, 15, NULL, 4, 'TXN2026000240', 33088.00, '2025-12-16 17:00:00', 'REVERSED', 'IMPS', '192.168.240.210', 'City10', FALSE),
(31, 16, 1, 1, 'TXN2026000241', 33225.45, '2025-01-17 08:07:00', 'SUCCESS', 'ATM', NULL, 'City1', FALSE),
(32, 17, 2, 2, 'TXN2026000242', 33362.90, '2025-02-18 09:14:00', 'SUCCESS', 'POS', NULL, 'City2', TRUE),
(33, NULL, 3, 3, 'TXN2026000243', 33500.35, '2025-03-19 10:21:00', 'SUCCESS', 'ONLINE', '192.168.243.219', 'City3', FALSE),
(34, 19, NULL, 4, 'TXN2026000244', 33637.80, '2025-04-20 11:28:00', 'PENDING', 'MOBILE', '192.168.244.222', 'City4', FALSE),
(35, 20, 5, 1, 'TXN2026000245', 33775.25, '2025-05-21 12:35:00', 'FAILED', 'UPI', '192.168.245.225', 'City5', FALSE),
(36, 21, 6, 2, 'TXN2026000246', 33912.70, '2025-06-22 13:42:00', 'REVERSED', 'NEFT', '192.168.246.228', NULL, FALSE),
(37, 22, 7, 3, 'TXN2026000247', 34050.15, '2025-07-23 14:49:00', 'SUCCESS', 'RTGS', '192.168.247.231', 'City7', FALSE),
(38, 23, NULL, 4, 'TXN2026000248', 34187.60, '2025-08-24 15:56:00', 'SUCCESS', 'IMPS', '192.168.248.234', 'City8', FALSE),
(39, 24, 9, 1, 'TXN2026000249', 34325.05, '2025-09-25 16:03:00', 'SUCCESS', 'ATM', NULL, 'City9', FALSE),
(40, 25, 10, 2, 'TXN2026000250', 34462.50, '2025-10-26 17:10:00', 'PENDING', 'POS', NULL, 'City10', FALSE),
(41, 1, 11, 3, 'TXN2026000251', 34599.95, '2025-11-27 08:17:00', 'FAILED', 'ONLINE', '192.168.251.243', 'City1', FALSE),
(42, NULL, NULL, 4, 'TXN2026000252', 34737.40, '2025-12-28 09:24:00', 'REVERSED', 'MOBILE', '192.168.252.246', 'City2', FALSE),
(43, 3, 13, 1, 'TXN2026000253', 34874.85, '2025-01-01 10:31:00', 'SUCCESS', 'UPI', '192.168.253.249', 'City3', TRUE),
(44, 4, 14, 2, 'TXN2026000254', 35012.30, '2025-02-02 11:38:00', 'SUCCESS', 'NEFT', '192.168.254.252', NULL, FALSE),
(45, 5, 15, 3, 'TXN2026000255', 35149.75, '2025-03-03 12:45:00', 'SUCCESS', 'RTGS', '192.168.0.0', 'City5', FALSE),
(46, 6, NULL, 4, 'TXN2026000256', 35287.20, '2025-04-04 13:52:00', 'PENDING', 'IMPS', '192.168.1.3', 'City6', FALSE),
(47, 7, 17, 1, 'TXN2026000257', 35424.65, '2025-05-05 14:59:00', 'FAILED', 'ATM', NULL, 'City7', FALSE),
(48, 8, 18, 2, 'TXN2026000258', 35562.10, '2025-06-06 15:06:00', 'REVERSED', 'POS', NULL, 'City8', FALSE),
(49, 9, 19, 3, 'TXN2026000259', 35699.55, '2025-07-07 16:13:00', 'SUCCESS', 'ONLINE', '192.168.4.12', 'City9', FALSE),
(50, 10, NULL, 4, 'TXN2026000260', 35837.00, '2025-08-08 17:20:00', 'SUCCESS', 'MOBILE', '192.168.5.15', 'City10', FALSE),
(51, NULL, 21, 1, 'TXN2026000261', 35974.45, '2025-09-09 08:27:00', 'SUCCESS', 'UPI', '192.168.6.18', 'City1', FALSE),
(52, 12, 22, 2, 'TXN2026000262', 36111.90, '2025-10-10 09:34:00', 'PENDING', 'NEFT', '192.168.7.21', NULL, FALSE),
(53, 13, 23, 3, 'TXN2026000263', 36249.35, '2025-11-11 10:41:00', 'FAILED', 'RTGS', '192.168.8.24', 'City3', FALSE),
(54, 14, NULL, 4, 'TXN2026000264', 36386.80, '2025-12-12 11:48:00', 'REVERSED', 'IMPS', '192.168.9.27', 'City4', TRUE),
(55, 15, 25, 1, 'TXN2026000265', 36524.25, '2025-01-13 12:55:00', 'SUCCESS', 'ATM', NULL, 'City5', FALSE),
(56, 16, 26, 2, 'TXN2026000266', 36661.70, '2025-02-14 13:02:00', 'SUCCESS', 'POS', NULL, 'City6', FALSE),
(57, 17, 27, 3, 'TXN2026000267', 36799.15, '2025-03-15 14:09:00', 'SUCCESS', 'ONLINE', '192.168.12.36', 'City7', FALSE),
(58, 18, NULL, 4, 'TXN2026000268', 36936.60, '2025-04-16 15:16:00', 'PENDING', 'MOBILE', '192.168.13.39', 'City8', FALSE),
(59, 19, 29, 1, 'TXN2026000269', 37074.05, '2025-05-17 16:23:00', 'FAILED', 'UPI', '192.168.14.42', 'City9', FALSE),
(60, NULL, 30, 2, 'TXN2026000270', 37211.50, '2025-06-18 17:30:00', 'REVERSED', 'NEFT', '192.168.15.45', NULL, FALSE),
(61, 21, 1, 3, 'TXN2026000271', 37348.95, '2025-07-19 08:37:00', 'SUCCESS', 'RTGS', '192.168.16.48', 'City1', FALSE),
(62, 22, NULL, 4, 'TXN2026000272', 37486.40, '2025-08-20 09:44:00', 'SUCCESS', 'IMPS', '192.168.17.51', 'City2', FALSE),
(63, 23, 3, 1, 'TXN2026000273', 37623.85, '2025-09-21 10:51:00', 'SUCCESS', 'ATM', NULL, 'City3', FALSE),
(64, 24, 4, 2, 'TXN2026000274', 37761.30, '2025-10-22 11:58:00', 'PENDING', 'POS', NULL, 'City4', FALSE),
(65, 25, 5, 3, 'TXN2026000275', 37898.75, '2025-11-23 12:05:00', 'FAILED', 'ONLINE', '192.168.20.60', 'City5', TRUE),
(66, 1, NULL, 4, 'TXN2026000276', 38036.20, '2025-12-24 13:12:00', 'REVERSED', 'MOBILE', '192.168.21.63', 'City6', FALSE),
(67, 2, 7, 1, 'TXN2026000277', 38173.65, '2025-01-25 14:19:00', 'SUCCESS', 'UPI', '192.168.22.66', 'City7', FALSE),
(68, 3, 8, 2, 'TXN2026000278', 38311.10, '2025-02-26 15:26:00', 'SUCCESS', 'NEFT', '192.168.23.69', NULL, FALSE),
(69, NULL, 9, 3, 'TXN2026000279', 38448.55, '2025-03-27 16:33:00', 'SUCCESS', 'RTGS', '192.168.24.72', 'City9', FALSE),
(70, 5, NULL, 4, 'TXN2026000280', 38586.00, '2025-04-28 17:40:00', 'PENDING', 'IMPS', '192.168.25.75', 'City10', FALSE),
(1, 6, 11, 1, 'TXN2026000281', 38723.45, '2025-05-01 08:47:00', 'FAILED', 'ATM', NULL, 'City1', FALSE),
(2, 7, 12, 2, 'TXN2026000282', 38860.90, '2025-06-02 09:54:00', 'REVERSED', 'POS', NULL, 'City2', FALSE),
(3, 8, 13, 3, 'TXN2026000283', 38998.35, '2025-07-03 10:01:00', 'SUCCESS', 'ONLINE', '192.168.28.84', 'City3', FALSE),
(4, 9, NULL, 4, 'TXN2026000284', 39135.80, '2025-08-04 11:08:00', 'SUCCESS', 'MOBILE', '192.168.29.87', 'City4', FALSE),
(5, 10, 15, 1, 'TXN2026000285', 39273.25, '2025-09-05 12:15:00', 'SUCCESS', 'UPI', '192.168.30.90', 'City5', FALSE),
(6, 11, 16, 2, 'TXN2026000286', 39410.70, '2025-10-06 13:22:00', 'PENDING', 'NEFT', '192.168.31.93', NULL, TRUE),
(7, 12, 17, 3, 'TXN2026000287', 39548.15, '2025-11-07 14:29:00', 'FAILED', 'RTGS', '192.168.32.96', 'City7', FALSE),
(8, NULL, NULL, 4, 'TXN2026000288', 39685.60, '2025-12-08 15:36:00', 'REVERSED', 'IMPS', '192.168.33.99', 'City8', FALSE),
(9, 14, 19, 1, 'TXN2026000289', 39823.05, '2025-01-09 16:43:00', 'SUCCESS', 'ATM', NULL, 'City9', FALSE),
(10, 15, 20, 2, 'TXN2026000290', 39960.50, '2025-02-10 17:50:00', 'SUCCESS', 'POS', NULL, 'City10', FALSE),
(11, 16, 21, 3, 'TXN2026000291', 40097.95, '2025-03-11 08:57:00', 'SUCCESS', 'ONLINE', '192.168.36.108', 'City1', FALSE),
(12, 17, NULL, 4, 'TXN2026000292', 40235.40, '2025-04-12 09:04:00', 'PENDING', 'MOBILE', '192.168.37.111', 'City2', FALSE),
(13, 18, 23, 1, 'TXN2026000293', 40372.85, '2025-05-13 10:11:00', 'FAILED', 'UPI', '192.168.38.114', 'City3', FALSE),
(14, 19, 24, 2, 'TXN2026000294', 40510.30, '2025-06-14 11:18:00', 'REVERSED', 'NEFT', '192.168.39.117', NULL, FALSE),
(15, 20, 25, 3, 'TXN2026000295', 40647.75, '2025-07-15 12:25:00', 'SUCCESS', 'RTGS', '192.168.40.120', 'City5', FALSE),
(16, 21, NULL, 4, 'TXN2026000296', 40785.20, '2025-08-16 13:32:00', 'SUCCESS', 'IMPS', '192.168.41.123', 'City6', FALSE),
(17, NULL, 27, 1, 'TXN2026000297', 40922.65, '2025-09-17 14:39:00', 'SUCCESS', 'ATM', NULL, 'City7', TRUE),
(18, 23, 28, 2, 'TXN2026000298', 41060.10, '2025-10-18 15:46:00', 'PENDING', 'POS', NULL, 'City8', FALSE),
(19, 24, 29, 3, 'TXN2026000299', 41197.55, '2025-11-19 16:53:00', 'FAILED', 'ONLINE', '192.168.44.132', 'City9', FALSE),
(20, 25, NULL, 4, 'TXN2026000300', 41335.00, '2025-12-20 17:00:00', 'REVERSED', 'MOBILE', '192.168.45.135', 'City10', FALSE);

INSERT INTO fraud_alert
(
    transaction_id,
    fraud_rule_id,
    risk_score,
    alert_status,
    detected_by,
    remarks
)

VALUES

(11, 4, 96.50, 'CONFIRMED', 'RULE_ENGINE', 'High-value online transaction from an unusual location.'),
(22, 3, 84.75, 'UNDER_REVIEW', 'RULE_ENGINE', 'Multiple high-frequency transactions detected.'),
(33, 2, 68.40, 'OPEN', 'SYSTEM', 'Transaction amount exceeds customer profile.'),
(44, 1, 42.80, 'FALSE_POSITIVE', 'MANUAL_REVIEW', 'Verified by customer after review.'),
(55, 4, 99.20, 'CONFIRMED', 'RULE_ENGINE', 'Card used from two distant locations within a short period.'),
(66, 3, 79.60, 'UNDER_REVIEW', 'SYSTEM', 'Repeated failed authentication attempts before transaction.'),
(77, 2, 63.10, 'OPEN', 'RULE_ENGINE', 'Unusual merchant category for customer spending pattern.'),
(88, 1, 38.25, 'CLOSED', 'MANUAL_REVIEW', 'Legitimate customer transaction confirmed.'),
(99, 4, 94.80, 'CONFIRMED', 'RULE_ENGINE', 'High-risk international online payment detected.'),
(110, 3, 82.35, 'UNDER_REVIEW', 'SYSTEM', 'Rapid sequence of transactions from the same account.'),
(121, 2, 71.45, 'OPEN', 'RULE_ENGINE', 'Multiple ATM withdrawals within a short duration.'),
(132, 1, 36.90, 'FALSE_POSITIVE', 'MANUAL_REVIEW', 'Customer confirmed transaction authenticity.'),
(143, 3, 88.60, 'UNDER_REVIEW', 'SYSTEM', 'Transaction originated from an unfamiliar device.'),
(154, 4, 97.80, 'CONFIRMED', 'RULE_ENGINE', 'High-value RTGS transfer flagged by fraud rules.'),
(165, 2, 59.75, 'CLOSED', 'MANUAL_REVIEW', 'Alert closed after successful verification.'),
(176, 3, 81.20, 'UNDER_REVIEW', 'SYSTEM', 'Abnormal transaction velocity detected.'),
(187, 1, 47.35, 'FALSE_POSITIVE', 'MANUAL_REVIEW', 'Merchant verified as trusted by customer.'),
(198, 4, 93.40, 'CONFIRMED', 'RULE_ENGINE', 'Large online payment from previously unseen IP address.'),
(209, 2, 66.85, 'OPEN', 'SYSTEM', 'Repeated UPI transactions exceeding normal customer pattern.'),
(220, 4, 98.65, 'CONFIRMED', 'RULE_ENGINE', 'Critical fraud pattern matched multiple detection rules.');

-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT
    COUNT(*) AS total_branches
FROM branch;

SELECT
    COUNT(*) AS total_customers
FROM customer;

SELECT
    COUNT(*) AS total_employees
FROM employee;

SELECT
    COUNT(*) AS total_accounts
FROM account;

SELECT
    COUNT(*) AS total_cards
FROM card;

SELECT
    COUNT(*) AS total_loans
FROM loan;

SELECT
    COUNT(*) AS total_merchants
FROM merchant;

SELECT
    COUNT(*) AS total_transactions
FROM bank_transaction;

SELECT
    COUNT(*) AS total_fraud_alerts
FROM fraud_alert;

-- ============================================================================
-- REFERENTIAL INTEGRITY VERIFICATION
-- ============================================================================

SELECT
    COUNT(*) AS accounts_without_customer
FROM account a
LEFT JOIN customer c
    ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT
    COUNT(*) AS cards_without_account
FROM card cd
LEFT JOIN account a
    ON cd.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT
    COUNT(*) AS loans_without_customer
FROM loan l
LEFT JOIN customer c
    ON l.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT
    COUNT(*) AS transactions_without_account
FROM bank_transaction bt
LEFT JOIN account a
    ON bt.account_id = a.account_id
WHERE a.account_id IS NULL;

SELECT
    COUNT(*) AS alerts_without_transaction
FROM fraud_alert fa
LEFT JOIN bank_transaction bt
    ON fa.transaction_id = bt.transaction_id
WHERE bt.transaction_id IS NULL;

-- ============================================================================
-- EXPECTED ROW COUNTS
-- ============================================================================
-- Branch              : 10
-- Customer            : 50
-- Employee            : 30
-- Account             : 70
-- Card                : 70
-- Loan                : 20
-- Merchant            : 25
-- Bank Transaction    : 300
-- Fraud Alert         : 20
-- ============================================================================
-- END OF FILE
-- ============================================================================