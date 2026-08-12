@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_ITEM02_N
  provider contract transactional_query
  as projection on ZR_ITEM02_N
{
  key     ItemId,
          //    @EndUserText.label: 'Product Name'
          Name,
          //    ProductDesc,
          Description,
          Price,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CAL_DISCOUNT'
          @EndUserText.label: 'Discount'
  virtual Disc   : abap.dec( 10, 2 ),

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CAL_DISCOUNT'
          @EndUserText.label: 'FinalPrice'
  virtual FPrice : abap.dec( 10, 2 ),

          StatusCode,
          LocalCreatedBy,
          LocalCreatedAt,
          LocalLastChangedBy,
          LocalLastChangedAt,
          LastChangedAt
          //    ProductDesc
}
