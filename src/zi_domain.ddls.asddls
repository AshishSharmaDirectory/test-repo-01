@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain CDS Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Domain as select from zprj_domain
association to parent  ZR_PRJ_HDR as _Project
on $projection.ProjectId = _Project.ProjectId

composition [0..*] of ZI_TASK as _Task
{
    key domain_id as DomainId,
    project_id as ProjectId,
    domain_code as DomainCode,
    domain_name as DomainName,
    domain_lead as DomainLead,
    status as Status,
    created_by as CreatedBy,
    created_at as CreatedAt,
    changed_by as ChangedBy,
    changed_at as ChangedAt,
    _Project,
    _Task    
}
