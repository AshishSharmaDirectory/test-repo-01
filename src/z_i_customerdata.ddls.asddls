//@AbapCatalog.sqlViewName: 'Z_I_CD_SQL_VIEW'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Customer Data'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_CustomerData
  as select from /lrn/437g_travel
  association [0..1] to /lrn/437g_tritem as _assoc on $projection.AgencyId = _assoc.agency_id
{
  key agency_id      as AgencyId,
  key travel_id      as TravelId,
      description    as Description,
      customer_id    as CustomerId,
      begin_date     as BeginDate,
      end_date       as EndDate,
      status         as Status,
      changed_at     as ChangedAt,
      changed_by     as ChangedBy,
      loc_changed_at as LocChangedAt,
      _assoc.item_uuid as ItemNo,
      _assoc

}
