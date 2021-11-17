create FUNCTION [dbo].[FarsiDateDiff] (@StartDate char(10),@EndDate char(10))  
RETURNS int
AS  
BEGIN 
  DECLARE @Dif  as Integer
  DECLARE @Sdate  as datetime
  DECLARE @Edate  as datetime
  set @Dif =0

  if @StartDate>@EndDate 
  begin
   set @Dif =-1
  end
  else
  if @StartDate=@EndDate 
  begin 
    set @Dif =0
  end  
  else
  if @StartDate<@EndDate 
  begin
     set @Dif= datediff(dd,dbo.Fn_ShamsiToMiladi(@StartDate),dbo.Fn_ShamsiToMiladi(@EndDate))   
  end

 Return @Dif

END

--result = int (positive or negative) date should be in char(10) format