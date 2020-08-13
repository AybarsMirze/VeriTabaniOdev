
--
-- Database adı: `elms`yazmanınz gerek
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  [id] int NOT NULL,
  [UserName] varchar(100) NOT NULL,
  [Password] varchar(100) NOT NULL,
  [updationDate] datetime2(6) NOT NULL DEFAULT '0000-00-00 00:00:00' 
);

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` ([id], [UserName], [Password], [updationDate]) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-10-30 11:42:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  [id] int NOT NULL,
  [DepartmentName] varchar(150) DEFAULT NULL,
  [DepartmentShortName] varchar(100) NOT NULL,
  [DepartmentCode] varchar(50) DEFAULT NULL,
  [CreationDate] datetime2(6) NULL DEFAULT GETDATE()
);

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` ([id], [DepartmentName], [DepartmentShortName], [DepartmentCode], [CreationDate]) VALUES
(1, 'Human Resource', 'HR', 'HR001', '2017-11-01 07:16:25'),
(2, 'Information Technology', 'IT', 'IT001', '2017-11-01 07:19:37'),
(3, 'Operations', 'OP', 'OP1', '2017-12-02 21:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  [id] int NOT NULL,
  [EmpId] varchar(100) NOT NULL,
  [FirstName] varchar(150) NOT NULL,
  [LastName] varchar(150) NOT NULL,
  [EmailId] varchar(200) NOT NULL,
  [Password] varchar(180) NOT NULL,
  [Gender] varchar(100) NOT NULL,
  [Dob] varchar(100) NOT NULL,
  [Department] varchar(255) NOT NULL,
  [Address] varchar(255) NOT NULL,
  [City] varchar(200) NOT NULL,
  [Country] varchar(150) NOT NULL,
  [Phonenumber] char(11) NOT NULL,
  [Status] int NOT NULL,
  [RegDate] datetime2(6) NOT NULL DEFAULT GETDATE()
) ;

CREATE TABLE `leaves` (
  [leave_id] int NOT NULL,
  [departmet_id] int NOT NULL,
  [emp_id] int NULL 
) ;

CREATE TABLE salary(
 id  int NOT NULL ,
 monunt int NOT NULL ,
 emp_id int NOT NULL
 
);


------------------Inheritance----------------------------kalitim----

CREATE TABLE `tmanagers` (	--1
  [mang_id] int NOT NULL,
  [departmet_id] int NOT NULL,
  [dependents_num] int NULL 
) inherits (tblemployees);

CREATE TABLE director(		--2	
director_id SERIAL PRIMARY KEY NOT NULL,
secretary_id INT4 REFERENCES employee(id),
extra_legal_benefits VARCHAR(255) ARRAY
) inherits (tblemployees);
--
CREATE TABLE year_leaves_emp(	--3
lev_back_time TIMESTAMP NULL ,
 sick_days int NOT NULL,
 leave_date TIMESTAMP NOT NULL
) inherits (leaves);

CREATE TABLE auto_increment_salarys_per_year(	--4
	sumLeaves int NOT NULL ,
	sumDays int NOT NUll 
	avrg int NOT NULL 
) inherits (salary);
----------------------------------------------------------

-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` ([id], [EmpId], [FirstName], [LastName], [EmailId], [Password], [Gender], [Dob], [Department], [Address], [City], [Country], [Phonenumber], [Status], [RegDate]) VALUES
(1, 'EMP10806121', 'Anuj', 'kumar', 'anuj@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 'Male', '3 February, 1990', 'Human Resource', 'New Delhi', 'Delhi', 'India', '9857555555', 1, '2017-11-10 11:29:59'),
(2, 'DEMP2132', 'Amit', 'kumar', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 'Male', '3 February, 1990', 'Information Technology', 'New Delhi', 'Delhi', 'India', '8587944255', 1, '2017-11-10 13:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  [id] int NOT NULL,
  [LeaveType] varchar(110) NOT NULL,
  [ToDate] varchar(120) NOT NULL,
  [FromDate] varchar(120) NOT NULL,
  [Description] varchar(max) NOT NULL,
  [PostingDate] datetime2(6) NOT NULL DEFAULT GETDATE(),
  [AdminRemark] varchar(max),
  [AdminRemarkDate] varchar(120) DEFAULT NULL,
  [Status] int NOT NULL,
  [IsRead] int NOT NULL,
  [empid] int DEFAULT NULL
);

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` ([id], [LeaveType], [ToDate], [FromDate], [Description], [PostingDate], [AdminRemark], [AdminRemarkDate], [Status], [IsRead], [empid]) VALUES
(7, 'Casual Leave', '30/11/2017', '29/10/2017', 'test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description', '2017-11-19 13:11:21', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.rn', '2017-12-02 23:26:27 ', 2, 1, 1),
(8, 'Medical Leave test', '21/10/2017', '25/10/2017', 'test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description', '2017-11-20 11:14:14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2017-12-02 23:24:39 ', 1, 1, 1),
(9, 'Medical Leave test', '08/12/2017', '12/12/2017', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.rn', '2017-12-02 18:26:01', NULL, NULL, 0, 1, 2),
(10, 'Restricted Holiday(RH)', '25/12/2017', '25/12/2017', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.', '2017-12-03 08:29:07', 'Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.', '2017-12-03 14:06:12 ', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  [id] int NOT NULL,
  [LeaveType] varchar(200) DEFAULT NULL,
  [Description] varchar(max),
  [CreationDate] datetime2(6) NOT NULL DEFAULT GETDATE()
);

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` ([id], [LeaveType], [Description], [CreationDate]) VALUES
(1, 'Casual Leave', 'Casual Leave ', '2017-11-01 12:07:56'),
(2, 'Medical Leave test', 'Medical Leave  test', '2017-11-06 13:16:09'),
(3, 'Restricted Holiday(RH)', 'Restricted Holiday(RH)', '2017-11-06 13:16:38');



CREATE TABLE employee_audits (
   id INT GENERATED ALWAYS AS IDENTITY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);




-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE [admin]
  ADD PRIMARY KEY ([id]);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE [tbldepartments]
  ADD PRIMARY KEY ([id]);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE [tblemployees]
  ADD PRIMARY KEY ([id]);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE [tblleaves]
  ADD PRIMARY KEY ([id]),
  ADD KEY `UserEmail` ([empid]);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE [tblleavetype]
  ADD PRIMARY KEY ([id]);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE [admin]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE [tbldepartments]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE [tblemployees]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE [tblleaves]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE [tblleavetype]
  MODIFY [id] cast(11 as int) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;


-----------------------triggers (1)--------------------------------------------------




CREATE OR REPLACE FUNCTION log_last_name_changes()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL  
  AS
$$
BEGIN
	IF NEW.last_name <> OLD.last_name THEN
		 INSERT INTO employee_audits(employee_id,last_name,changed_on)
		 VALUES(OLD.id,OLD.last_name,now());
	END IF;

	RETURN NEW;
END;
$$

CREATE TRIGGER last_name_changes
  BEFORE UPDATE
  ON tblemployees
  FOR EACH ROW
  EXECUTE PROCEDURE log_last_name_changes();






----------------------------(2)------------------
CREATE OR REPLACE FUNCTION employee_insert_trigger_fnc()

  RETURNS trigger AS

$$

BEGIN



    INSERT INTO "Employee_Audit" ( "EmployeeId", "LastName", "FirstName","UserName" ,"EmpAdditionTime")

         VALUES(NEW."EmployeeId",NEW."LastName",NEW."FirstName",current_user,current_date);



RETURN NEW;

END;

$$

LANGUAGE 'plpgsql';



CREATE TRIGGER employee_insert_trigger

  AFTER INSERT

  ON "tblemployees"

  FOR EACH ROW

  EXECUTE PROCEDURE employee_insert_trigger_fnc();

-----------------------------(3)--------------------------------------
CREATE TRIGGER verify_user_for_update

 BEFORE UPDATE

 ON "tblemployees"

 FOR EACH ROW

EXECUTE PROCEDURE employee_verify_user_priv();
-----------------------------(4)--------------------------------------
CREATE TRIGGER employee_delete_trigger

  AFTER DELETE

  ON "tblemployees"

  FOR EACH ROW

 EXECUTE PROCEDURE aft_delete();

----------------------------------------------------------------------------

