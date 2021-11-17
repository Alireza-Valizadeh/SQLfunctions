CREATE   FUNCTION [dbo].[DifTime]  (@time1 varchar(8),@Time2 varchar(8))
RETURNS int  AS  
BEGIN 
Declare @Result int ,@frommin int, @tomin int

 set @frommin=(cast  (substring(@time1,4,2) as int) + (cast (substring(@time1,1,2) as int))*60   )
 set @tomin=(cast  (substring(@time2,4,2) as int) + (cast (substring(@time2,1,2) as int))*60   )

    if (@ToMin>=@frommin )
      set @Result=@tomin-@frommin
  else
    set @Result=@tomin-@frommin+1440

 Return @Result

END
--result = difference of minutes as int, if time 2 is less that time 1 it counts as if time 2 was yesterday 
-- thats why there is a +1440 in the end