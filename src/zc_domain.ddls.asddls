@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Domain'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_Domain
  //  provider contract transactional_query
  as projection on ZI_Domain
{
  key  ProjectId,
  key  DomainId,
       DomainCode,
       DomainName,
       DomainLead,
       Status,
       CreatedBy,
       CreatedAt,
       ChangedBy,
       ChangedAt,
       /* Associations */
       //       _Project
       _Project : redirected to parent ZC_PRJ_HDR
}
