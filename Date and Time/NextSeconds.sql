--[NextSecond]('20:00:00', 700) => 20:11:40
CREATE FUNCTION [dbo].[NextSecond] (@StartTime char(8),@DifSecond int)  
RETURNS char(8)
AS  
BEGIN 
  DECLARE @Ret  as varchar(8)
  DECLARE @Sm  as Integer
 -- DECLARE @Em  as Integer
  
  declare @nexth int
  declare @nextm int
  declare @nexts int
  declare @nexthStr varchar(2)
  declare @nextmStr varchar(2)
  declare @nextsstr varchar(2)
 

  set @sm=(cast(substring(@StartTime,1,2) as int))*3600
  set @sm=@sm+(cast(substring(@StartTime,4,2) as int))*60
  set @sm=@sm+(cast(substring(@StartTime,7,2) as int))
  
  set @sm=@sm+@DifSecond
  
  if( @sm>=86400)
     set @sm=@sm-86400

  set @nexth=@Sm / 3600

  set @nextm=((@Sm-(@nexth*3600)))/60
  
  set @nexts=@Sm- ( (@nexth*3600)+(@nextm*60))
  
  if (@nexth=0) 
  begin
    set @nexthstr='00'
  end
  else
  if (@nexth<10)
    set @nexthstr='0'+cast(@nexth as varchar(1))
  else
    set @nexthstr=+cast(@nexth as varchar(2))
	 
  if (@nextm=0) 
  begin
    set @nextmstr='00'
  end
  else
  if (@nextm<10)
    set @nextmstr='0'+cast(@nextm as varchar(1))
  else
    set @nextmstr=+cast(@nextm as varchar(2))
   
 if (@nexts=0) 
  begin
    set @nextsstr='00'
  end
  else
  if (@nexts<10)
    set @nextsstr='0'+cast(@nexts as varchar(1))
  else
    set @nextsstr=+cast(@nexts as varchar(2))
   
  set @Ret= @nexthstr+':'+@nextmstr+':'+@nextsstr

 Return @Ret

END