@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View Entity for Project'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_PRJ_HDR
  as select from zprj_hdr

  //Normal Association
  //  association [0..*] to zprj_domain as _domain
  //  on $projection.ProjectId = _domain.project_id


  //Test Parent and Child relation with Composition & Association to
  //Here we're defining the child node
  composition [0..*] of ZI_Domain as _domain
{
  key project_id            as ProjectId,
      project_code          as ProjectCode,
      customer_name         as CustomerName,
      project_manager       as ProjectManager,
      start_date            as StartDate,
      end_date              as EndDate,
      status                as Status,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      //      _association_name // Make association public
      _domain
}
