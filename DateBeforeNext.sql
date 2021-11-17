create FUNCTION [dbo].[DateBeforeNext] (@Dcount int,@StartDate char(10))  
RETURNS char(10)
AS  
BEGIN 
 Return dbo.FN_MiladiToShamsi(dateadd(dd,@Dcount,dbo.Fn_ShamsiToMiladi(@StartDate)))
END


