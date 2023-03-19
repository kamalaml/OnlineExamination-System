----------------------Procedues for Tables------------------------------------------------------
---------------------------------Student Table-------------------------
Alter PROC Student_SP  @StatementType NVARCHAR(20) = '',@St_ID int, @St_Fname varchar(50),@St_Lname varchar(50),
                        @Gender varchar(5),@Street varchar(50),
                        @City varchar(50),@Governorate varchar(50), @Birthdate date, @Hiring_Date date,
                        @Certificate varchar(150), @Freelancing Varchar(150),@ITI_Grad_Date date,@Position varchar(50), 
                        @CompanyName varchar(50), @Email varchar(50)
AS
  BEGIN try
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO Student
                        (St_ID, St_Fname,St_Lname, Gender ,Street ,
                         City , Governorate, Birthdate ,Hiring_Date ,
                         Certificate , Freelancing ,ITI_Grad_Date ,Position , 
                         CompanyName , Email )
            VALUES     ( @St_ID , @St_Fname ,@St_Lname ,
                         @Gender ,@Street ,
                         @City ,@Governorate, @Birthdate , @Hiring_Date,
                         @Certificate , @Freelancing ,@ITI_Grad_Date ,@Position , 
                         @CompanyName , @Email )
         END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM  Student
			WHERE St_ID=@St_ID
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE Student
            SET    St_Fname = @St_Fname,
                   St_Lname = @St_Lname,
                   Gender= @Gender,
				   Street=@Street,
                   City =@City,
				   Governorate= @Governorate,
				   Birthdate=@Birthdate,
				   Hiring_Date=@Hiring_Date,
				   Certificate=@Certificate , 
				   Freelancing =@Freelancing ,
				   ITI_Grad_Date=@ITI_Grad_Date ,
				   Position=@Position , 
				   CompanyName=@CompanyName,
				   Email =@Email 
            WHERE  St_ID = @St_ID
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Student
            WHERE St_ID = @St_ID
        END
  END try
  Begin Catch
  select 'Error'
  end catch
Execute Student_SP'Insert',2,'Ali','mohammed','M','elbahaR','TANTA', 'gharbia','10/20/1998',
'12/23/2019', 'adscsd','sdasasdvdfrg','12/11/2019','rgthththt','ddfthyh','dfsd@sdf.com'
Execute Student_SP'Delete',2,'Ali','mohammed','M','elbahaR','TANTA', 'gharbia','10/20/1998',
'12/23/2019', 'adscsd','sdasasdvdfrg','12/11/2019','rgthththt','ddfthyh','dfsd@sdf.com'
-----------------------------------------St_Phone Table----------------------------------
GO
Alter proc St_Phone_SP  @StatementType NVARCHAR(20) = '',@St_ID int, @Phone char(11)
AS
  BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO St_Phone
                        ( St_ID , Phone)
            VALUES      (@St_ID , @Phone)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM   St_Phone
			where St_ID=@St_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE St_Phone
            SET     Phone=@Phone
            Where  St_ID=@St_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM St_Phone
            WHERE  St_ID=@St_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH

  exec St_Phone_SP 'Insert',2, '01223498770'
-----------------------------------------St_Qualification Table------------------------------
  GO
Alter proc St_Qualification_SP  @StatementType NVARCHAR(20) = '',@St_ID int ,@Graduation_Year int ,
                                 @Scientific_Degree varchar(20),@Faculty varchar(50),@Grade Varchar(20)
AS
  BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO St_Qualification
                         ( St_ID , Graduation_Year , Scientific_Degree ,Faculty ,Grade)
            VALUES       (@St_ID ,@Graduation_Year ,
                          @Scientific_Degree ,@Faculty ,@Grade )
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM   St_Qualification
			where  St_ID=@St_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE St_Qualification
            SET     Graduation_Year=@Graduation_Year,
			        Scientific_Degree=@Scientific_Degree,
					Faculty=@Faculty,
					Grade=@Grade
            Where  St_ID=@St_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM St_Qualification
            WHERE  St_ID=@St_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH

Exec St_Qualification_SP 'delete', 2, 2021, 'B.sc', 'tanta univercity', 'A+'
-----------------------------------------Working table-------------------------------------
create proc Working_SP    @StatementType NVARCHAR(20) = '',
                          @Inst_ID int, @Dept_ID int , @Hiring_Date date
AS
  BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Working
                        (Inst_ID,Dept_ID,Hiring_Date )
            VALUES     (@Inst_ID,@Dept_ID,@Hiring_Date )
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM  Working
			Where  Inst_ID=@Inst_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Working
            SET  Dept_ID=@Dept_ID,
			     Hiring_Date=@Hiring_Date
            Where  Inst_ID=@Inst_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Working
            WHERE  Inst_ID=@Inst_ID 
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH

exec  Working_SP 'Insert', 1,2,'10-1-2007'

---------------------------------------------------Branches Table-------------------------------
Go
Alter proc Branches_SP  @StatementType NVARCHAR(20) = '',@Branch_ID int ,
                        @Branch_Name varchar(50),@Location varchar(50)
AS
  BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Branches
                        (Branch_ID,Branch_Name,Location)
            VALUES     (@Branch_ID, @Branch_Name,@Location )
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM  Branches
			Where  Branch_ID=@Branch_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Branches
            SET Branch_Name=@Branch_Name,
				 Location=@Location
            Where  Branch_ID=@Branch_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Branches
            WHERE  Branch_ID=@Branch_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH

execute Branches_SP 'Insert', 3,'Mansoura' , 'Elmansoura'
-------------------------------------------Exam Table-------------------------------------
Go
Alter proc Exam_SP  @StatementType NVARCHAR(20) = '',
                     @Exam_Code int , @Grade Float,@Exam_Model int,@Dept_ID int
As
BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Exam
                        (Exam_Code,Grade,Exam_Model,Dept_ID)
            VALUES      (@Exam_Code, @Grade,@Exam_Model,@Dept_ID)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM Exam
			Where Exam_Code=@Exam_Code and Exam_Model=@Exam_Model
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Exam
            SET Grade=@Grade,
		        Dept_ID=@Dept_ID
            Where Exam_Code=@Exam_Code and Exam_Model=@Exam_Model
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Exam
            WHERE Exam_Code=@Exam_Code and Exam_Model=@Exam_Model
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH
-----------------------------------------------Questions Table----------------------------
Go 
create proc Questions_SP @Statement_Type nvarchar(20),@Quest_Num int,@Questions varchar(150), 
                         @Correct_Answer Varchar(50),@Quest_Grade int ,
						 @Course_Code int
AS
BEGIN TRY
 IF @Statement_Type='Insert'
  BEGIN
      INSERT INTO Questions
	                        (Quest_Num ,Questions ,Correct_Answer,Quest_Grade ,
						     Course_Code )
			VALUES          (@Quest_Num ,@Questions ,@Correct_Answer,@Quest_Grade ,
						     @Course_Code)
  END
 IF @Statement_Type='Update'
  BEGIN
    UPDATE Questions
	SET  
	       Questions=@Questions ,
		   Correct_Answer=@Correct_Answer,
		   Quest_Grade=@Quest_Grade,
	       Course_Code =@Course_Code
	WHERE  Quest_Num=@Quest_Num 
  END
 IF @Statement_Type='Select'
  BEGIN
    SELECT*FROM Questions
	WHERE Quest_Num=@Quest_Num
  END
  ELSE IF @Statement_Type='Delete'
  BEGIN
     Delete FROM Questions WHERE Quest_Num=@Quest_Num
  END
END TRY
BEGIN CATCH
  SELECT'Error'
END CATCH
-----------------------------------------Choices_SP Table-----------------------------------------------------
GO
Create proc Choices_SP  @Statement_Type varchar(20),
                        @Quest_Num int,@Choices varchar(50)
AS
BEGIN TRY
  if @Statement_Type='Insert'
  BEGIN
     INSERT INTO Choices
	                   (Quest_Num ,Choices)
		VALUES         (@Quest_Num ,@Choices)
  END 
  IF @Statement_Type='Select'
   BEGIN
     SELECT * FROM Choices
	 where    Quest_Num = @Quest_Num AND Choices = @Choices
   END
   Else if @Statement_Type='Delete'
   begin
     DELETE FROM Choices
	 where Quest_Num=@Quest_Num AND Choices=@Choices
   end
END TRY
BEGIN CATCH
  SELECT'Error'
END CATCH

----------------------------------------------Resualt Table----------------------------------------------------
Go
Alter proc Resualt_SP   @StatementType NVARCHAR(20) = '', @St_ID int ,@Quest_Num int 
                         ,@Exam_Code int,@Exam_Model int , @Answer varchar(20)
As
BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Resualt
                        (St_ID,Quest_Num,Exam_Code,Exam_Model,Answer)
            VALUES     (@St_ID,@Quest_Num,@Exam_Code,@Exam_Model,@Answer)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM Resualt
			Where St_ID=@St_ID and Quest_Num=@Quest_Num
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Resualt
            SET Exam_Code=@Exam_Code,
			    Exam_Model=@Exam_Model,
				Answer=@Answer
            Where St_ID=@St_ID and Quest_Num=@Quest_Num
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Resualt
            WHERE St_ID=@St_ID and Quest_Num=@Quest_Num
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH
---------------------------Proc_for _Instructor-------------------------------------------------
GO
Alter proc Instractor     @StatementType NVARCHAR(20) = '',
                          @Inst_ID int ,
                          @Inst_Fname varchar(50),
                          @Inst_Lname varchar(50),
                          @Email varchar(50),
                          @Gender varchar(20),
                          @Birthdate date,
                          @Salary int,
                          @Manager_ID int
AS
  BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Instructor
                        (Inst_ID , Inst_Fname ,Inst_Lname ,Email ,Gender,
                         Birthdate, Salary,Manager_ID )
            VALUES     ( @Inst_ID ,@Inst_Fname ,@Inst_Lname ,@Email ,@Gender,
                         @Birthdate,@Salary,@Manager_ID)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM   Instructor
			WHERE Inst_ID=@Inst_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Instructor
            SET          
                         Inst_Fname = @Inst_Fname ,
                         Inst_Lname = @Inst_Lname ,
                         Email      = @Email ,
                         Gender     = @Gender,
                         Birthdate  = @Birthdate,
                         Salary     = @Salary,
                         Manager_ID = @Manager_ID   
            Where  Inst_ID = @Inst_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Instructor
            WHERE  Inst_ID = @Inst_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH 
--Cal-
 --Execute Instractor 'Insert',
-------------------------------Proc_for _Inst_Qualification-------------------------
GO
Alter proc Inst_Qualification_SP  @StatementType NVARCHAR(20) = '',
                                  @Inst_ID INT ,@Scientific_Degree varchar(20),
								  @Faculty varchar(50) 
AS
BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Inst_Qualification
                        (Inst_ID ,Scientific_Degree,Faculty)
            VALUES      ( @Inst_ID ,@Scientific_Degree,@Faculty)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM   Inst_Qualification
			WHERE Inst_ID=@Inst_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Inst_Qualification
            SET          
						 Scientific_Degree =@Scientific_Degree, 
						 Faculty=@Faculty  
            Where  Inst_ID =@Inst_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Inst_Qualification
            WHERE  Inst_ID =@Inst_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH 
  --cal   
---------------------------Inst_Phone_SP --------------------------------------------
GO
Alter proc Inst_Phone_SP  @StatementType NVARCHAR(20) = '',
                           @Inst_ID INT , @Phone char(11)
AS
BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Inst_Phone
                        (Inst_ID ,Phone)
            VALUES      ( @Inst_ID , @Phone)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM   Inst_Phone
			WHERE Inst_ID=@Inst_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Inst_Phone
            SET    Phone=@Phone  
            Where  Inst_ID=@Inst_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Inst_Phone
            WHERE  Inst_ID=@Inst_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH 
  --cal 
  EXECUTE Inst_Phone_SP 'Insert',1,01011106111
  EXECUTE Inst_Phone_SP 'Update',1,01011106111
  --EXECUTE Inst_Phone_SP 'Delete' , 1 
--------------------------------------Department_SP------------------------------------
GO
Alter proc Department_Sp   @StatementType NVARCHAR(20) = '', @Dept_ID int, 
                           @Manager_ID int, @Dept_Name varchar(50),@Duration varchar(20),
                           @Dept_Description varchar(150)
As
BEGIN TRY
      IF @StatementType = 'Insert'
      BEGIN
            INSERT INTO Department
                        (Dept_ID,Manager_ID,Dept_Name,Duration ,Dept_Description )
            VALUES      (@Dept_ID,@Manager_ID, @Dept_Name,@Duration ,@Dept_Description)
      END
      IF @StatementType = 'Select'
       BEGIN
            SELECT *
            FROM   Department
			where Dept_ID=@Dept_ID
       END
      IF @StatementType = 'Update'
        BEGIN
            UPDATE Department
            SET    Manager_ID=@Manager_ID,
				   Dept_Name=@Dept_Name,
				   Duration=@Duration ,
				   Dept_Description=@Dept_Description
            Where  Dept_ID=@Dept_ID
         END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM Department
            WHERE  Dept_ID=@Dept_ID
        END
  END TRY
  BEGIN CATCH
       Select'Error'
  END CATCH 
  --cal 
  Execute Department_Sp 'Insert',10,1,'OS','9 monthes','its operating System Department in Mansoura Branch'
  Execute Department_Sp 'Update',10,2,'ML','9 monthes','Mansoura'
  --Execute Department_Sp 'Delete' 
----------------------------------Branch_Department_SP----------------------------------------
GO
Alter proc Branch_Department_SP    @StatementType NVARCHAR(20) = '',
                                   @Dept_ID int, @Branch_ID int
AS 
BEGIN TRY
  IF @StatementType='Insert'
  BEGIN 
     INSERT into Branch_Department
	              (Dept_ID , Branch_ID )
		VALUES    (@Dept_ID , @Branch_ID )
  END
  IF @StatementType='Select'
  BEGIN
      SELECT * FROM Branch_Department
	  WHERE Dept_ID=@Dept_ID and Branch_ID=@Branch_ID
  END
  ELSE IF @StatementType='Delete'
  BEGIN
     DELETE FROM Branch_Department
	 WHERE Dept_ID=@Dept_ID and Branch_ID=@Branch_ID
  END
END TRY
BEGIN CATCH
  SELECT'Error'
END CATCH 

Execute Branch_Department_SP 'Insert' ,1,2 
Execute Branch_Department_SP 'Delete' ,1,2
------------------------------------------Topics_SP--------------------------------------------
GO 
ALTER proc Topics_SP  @Statement_Type nvarchar(20),
                      @Topic_ID int,@TopicName varchar(20)
AS
BEGIN TRY
 IF @Statement_Type='Insert'
 BEGIN
   INSERT INTO Topics
                     (Topic_ID,TopicName)
     VALUES          (@Topic_ID,@TopicName)
 END
 IF @Statement_Type='Select'
 BEGIN
    SELECT * FROM Topics
	WHERE Topic_ID=@Topic_ID
 END
 IF @Statement_Type='Update'
 BEGIN
   UPDATE Topics
    SET   TopicName=@TopicName
	WHERE Topic_ID=@Topic_ID
 END
 ELSE IF @Statement_Type='Delete'
 BEGIN
    DELETE FROM Topics
	WHERE Topic_ID=@Topic_ID 
 END
END TRY
BEGIN CATCH 
 SELECT 'Error'
END CATCH

 Execute Topics_SP 'Insert',1,'Database'
 Execute Topics_SP 'Update',1,'Network'
 Execute Topics_SP 'Delete',1,'Network'
------------------------------------------Course_SP--------------------------------------
GO
Alter Proc Courses_SP  @Statement_Type nvarchar(20),@Course_Code int , 
                        @CourseName varchar(20),@Course_Duration int ,@Topic_ID int
AS 
BEGIN TRY
 IF @Statement_Type='Insert'
 BEGIN
   INSERT INTO Courses
                      (Course_Code,CourseName,Course_Duration,Topic_ID)
		VALUES        (@Course_Code,@CourseName,@Course_Duration,@Topic_ID)
 END
 IF @Statement_Type='Select'
 BEGIN
   SELECT * FROM Courses
   WHERE Course_Code=@Course_Code
 END
 IF @Statement_Type='Update'
  BEGIN  
    UPDATE Courses
	SET  CourseName=@CourseName,
		 Course_Duration=@Course_Duration,
		 Topic_ID=@Topic_ID
  END 
  ELSE IF @Statement_Type='Delete'
  BEGIN
   DELETE FROM Courses
   WHERE Course_Code=@Course_Code
  END
END TRY
BEGIN CATCH
 SELECT 'Error'
END CATCH

  Execute Courses_SP 'Insert',1,'SSMSN',3,1
-------------------------------------------Inst_Courses_SP----------------------------------
GO
Alter proc Inst_Course_SP @Statement_Type varchar(20),
                          @Inst_ID int, @Course_Code int, @Evaluation int
AS
BEGIN TRY
  IF @Statement_Type='Insert'
  BEGIN
    INSERT INTO Inst_Course
	                  (Inst_ID,Course_Code,Evaluation)
			VALUES	  (@Inst_ID ,@Course_Code,@Evaluation)
  END
  IF @Statement_Type='Select'
  BEGIN
   SELECT *FROM Inst_Course
   WHERE Inst_ID=@Inst_ID AND Course_Code=@Course_Code
  END
  IF @Statement_Type='Update'
  BEGIN
    UPDATE Inst_Course 
	  SET Evaluation=@Evaluation
	  WHERE Inst_ID=@Inst_ID and Course_Code=@Course_Code
  END
  ELSE IF @Statement_Type='Delete'
  BEGIN
    DELETE FROM Inst_Course
	WHERE Inst_ID=@Inst_ID and Course_Code=@Course_Code
  END
END TRY
BEGIN CATCH
  SELECT'Error'
END CATCH

 Execute Inst_Course_SP 'Insert',1,2,10
-------------------------------------------St_Course_SP-----------------------------------
GO
Alter proc St_Course_SP   @Statement_Type nvarchar(20),
                          @St_ID int,@Course_Code int,@Crs_Grade float   
AS
BEGIN TRY
  IF @Statement_Type='Insert'
  BEGIN
   INSERT INTO St_Course
                        (St_ID,Course_Code,Crs_Grade)
		VALUES          (@St_ID,@Course_Code,@Crs_Grade)
  END
  IF @Statement_Type='Select'
  BEGIN
    SELECT * FROM St_Course
	WHERE St_ID=@St_ID AND Course_Code=@Course_Code
  END
  IF @Statement_Type='Update'
   BEGIN
     UPDATE St_Course
	    SET Crs_Grade=@Crs_Grade
		WHERE St_ID=@St_ID AND Course_Code=@Course_Code
   END
   ELSE IF @Statement_Type='Delete'
    BEGIN
	 DELETE FROM St_Course
	 WHERE St_ID=@St_ID AND Course_Code=@Course_Code
	END
END TRY
BEGIN CATCH
 SELECT'Error'
END CATCH
 Execute St_Course_SP 'Insert',1,0202,5.0
