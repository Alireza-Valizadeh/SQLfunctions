CREATE   FUNCTION [dbo].[MinToTime]  (@min smallint)
RETURNS char(5)  AS  
BEGIN 
Declare @Result char(5) ,@Hnum int, @MNum int,@HnumStr varchar(2), @MNumStr varchar(2)

  set @Hnum= @min/60
  set @MNum=@min-(@Hnum*60)
  if @min>0
  begin
	  if @Hnum<10 
		set @HnumStr='0'+cast(@Hnum as char(1))
	  else
		set @HnumStr=cast(@Hnum as char(2))

	  if @Mnum<10 
		set @MnumStr='0'+cast(@Mnum as char(1))
	  else
		set @MnumStr=cast(@Mnum as char(2))

     set @Result=@HnumStr+':'+@MnumStr

  end
  else
  set @Result='00:00'

 Return @Result

END

--result = 2 => 00:02, 25 => 00:25, 150 => 02:30