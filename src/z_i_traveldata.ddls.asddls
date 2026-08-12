@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Travel Data'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity Z_I_TravelData
  as select from ztravel_hdr_n
  association to ztravel_item_n as _assoc on $projection.AgencyId = _assoc.agency_id
{
  key agency_id        as AgencyId,
  key travel_id        as TravelId,
      description      as Description,
      customer_id      as CustomerId,
      begin_date       as BeginDate,
      end_date         as EndDate,
      status           as Status,
      changed_at       as ChangedAt,
      changed_by       as ChangedBy,
      loc_changed_at   as LocChangedAt,
      _assoc.item_uuid as ItemNo,
      _assoc
}
/* where agency_id = '000100' ; */

