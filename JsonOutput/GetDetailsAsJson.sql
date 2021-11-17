CREATE FUNCTION [dbo].[GetDetailsAsJson] (@detailId int)  
RETURNS varchar(max)
AS  
BEGIN 
  declare @res varchar(max)
  set @res=(
  --select 
  --isnull((
  --select 
  -- productCode
  --,productName
  --,orderAmount
  --,OrderDetails.unitPrice
  --,isnull(confirmAmount,0) as confirmAmount
  --from OrderHeader 
  --left outer join OrderDetails on(orderCode=orderId)
  --left outer join Products on(productCode=productId)
  --where orderCode=@orderNo
   For json path ),JSON_QUERY('[]')) as details  
  )
  Return isnull(@res,0)

END