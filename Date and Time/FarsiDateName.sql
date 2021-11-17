--SELECT dbo.FarsiDateName('1400/08/26') => چهارشنبه 26 آبان 1400
CREATE FUNCTION [dbo].[FarsiDateName] (@StartDate char(10))  
RETURNS  varchar(50)
AS  
BEGIN 
  DECLARE @DayName  as varchar(15)
  DECLARE @FDayName  as varchar(15)
  DECLARE @FMOnthName  as varchar(15)
  Declare @RetStr   as varchar(50)
      
  set @DayName=datename(dw,dbo.Fn_ShamsiToMiladi(@StartDate))
  set @FDayName=
   CASE @DayName
         WHEN 'Saturday' THEN 'شنبه'
         WHEN 'Sunday' THEN 'يکشنبه'
         WHEN 'Monday' THEN 'دوشنبه'
         WHEN 'Tuesday' THEN 'سه شنبه'
         WHEN 'Wednesday' THEN 'چهارشنبه'
         WHEN 'Thursday' THEN 'پنج شنبه'
         WHEN 'Friday' THEN 'جمعه'
      END
   set @FMOnthName=CASE substring(@StartDate,6,2)
         WHEN '01' THEN 'فروردين'
         WHEN '02' THEN 'ارديبهشت'
         WHEN '03' THEN 'خرداد'
         WHEN '04' THEN 'تير'
         WHEN '05' THEN 'مرداد'
         WHEN '06' THEN 'شهريور'
         WHEN '07' THEN 'مهر'
         WHEN '08' THEN 'آبان'
         WHEN '09' THEN 'آذر'
         WHEN '10' THEN 'دي'
         WHEN '11' THEN 'بهمن'
         WHEN '12' THEN 'اسفند'
      END
 set @RetStr=@FDayName+' '+cast(cast(substring(@StartDate,9,2) as int) as varchar(2))+' '+@FMOnthName+' '+substring(@StartDate,1,4)
 

 Return @RetStr

END