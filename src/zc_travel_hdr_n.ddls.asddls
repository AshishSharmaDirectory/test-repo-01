@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTRAVEL_HDR_N'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TRAVEL_HDR_N
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TRAVEL_HDR_N
  association [1..1] to ZR_TRAVEL_HDR_N as _BaseEntity on $projection.AGENCYID = _BaseEntity.AGENCYID and $projection.TRAVELID = _BaseEntity.TRAVELID
{
  key AgencyID,
  key TravelID,
  Description,
  CustomerID,
  BeginDate,
  EndDate,
  Status,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  ChangedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  ChangedBy,
  @Semantics: {
    User.Createdby: true
  }
  Createdby,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocChangedAt,
  _BaseEntity
}
