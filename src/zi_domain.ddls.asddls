@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain CDS Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Domain
  as select from zprj_domain

  //Test Parent and Child relation with Composition & Association to
  //Here we're defining who is the parent of this NODE/Entity
  association to parent ZR_PRJ_HDR as _Project on $projection.ProjectId = _Project.ProjectId

  //For another CDS View
  //composition [0..*] of ZI_TASK as _Task
{
  key project_id  as ProjectId,
  key domain_id   as DomainId,
      domain_code as DomainCode,
      domain_name as DomainName,
      domain_lead as DomainLead,
      status      as Status,
      created_by  as CreatedBy,
      created_at  as CreatedAt,
      changed_by  as ChangedBy,
      changed_at  as ChangedAt,
      _Project
      //    _Task
}
