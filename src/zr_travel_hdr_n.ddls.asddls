@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTRAVEL_HDR_N'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TRAVEL_HDR_N
  as select from ZTRAVEL_HDR_N
{
  key agency_id as AgencyID,
  key travel_id as TravelID,
  description as Description,
  customer_id as CustomerID,
  begin_date as BeginDate,
  end_date as EndDate,
  status as Status,
  @Semantics.systemDateTime.lastChangedAt: true
  changed_at as ChangedAt,
  @Semantics.user.lastChangedBy: true
  changed_by as ChangedBy,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  loc_changed_at as LocChangedAt
}
