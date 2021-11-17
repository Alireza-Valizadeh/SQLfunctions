CREATE   FUNCTION [dbo].[Distance]( @lat1 float , @long1 float , @lat2 float , @long2 float)
RETURNS float  AS  
BEGIN 
  declare @dist float
   declare @geo1 geography = geography::Point(isnull(@lat1,0),isnull( @long1,0), 4326),
        @geo2 geography = geography::Point(isnull(@lat2,0), isnull(@long2,0), 4326)
 
 select @dist=@geo1.STDistance(@geo2)

  return @dist

END
