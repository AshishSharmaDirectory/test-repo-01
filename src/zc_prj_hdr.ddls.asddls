@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_PRJ_HDR
  provider contract transactional_query
  as projection on ZR_PRJ_HDR
{
  key ProjectId,
      ProjectCode,
      CustomerName,
      ProjectManager,
      StartDate,
      EndDate,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      //      _domain
      _domain : redirected to composition child ZC_Domain
}
