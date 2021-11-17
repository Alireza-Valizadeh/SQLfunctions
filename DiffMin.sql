create FUNCTION [dbo].[DiffMin] (@StartTime1 char(8),@StartTime2 char(8))  
RETURNS int
AS  
BEGIN 
  DECLARE @FirstMin  as Integer
  DECLARE @LastMin  as Integer
 
  set @FirstMin =0
  set @LastMin =0
  
  set @FirstMin=CAST(SUBSTRING(@StartTime1,1,2) as int)*60+CAST(SUBSTRING(@StartTime1,4,2) as int)
  
  set @LastMin=CAST(SUBSTRING(@StartTime2,1,2) as int)*60+CAST(SUBSTRING(@StartTime2,4,2) as int)

 Return @LastMin-@FirstMin

END
--result = difference of minutes as int, if time 2 is less that time 1 it returns a negative integer