@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TASK CDS Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_TASK
  as select from zprj_task
  association to parent ZI_Domain as _Domain
  //association [1..1] to ZI_Domain as _Domain
  on $projection.DomainId = _Domain.DomainId
{
  key task_id         as TaskId,
      domain_id       as DomainId,
      project_id      as ProjectId,
      request_no      as RequestNo,
      task_title      as TaskTitle,
      task_desc       as TaskDesc,
      task_type       as TaskType,
      priority        as Priority,
      status          as Status,
      assigned_to     as AssignedTo,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      changed_by      as ChangedBy,
      changed_at      as ChangedAt,
      est_hours       as EstHours,
      act_hours       as ActHours,
      due_date        as DueDate,
      completion_date as CompletionDate,
      comments        as Comments,
      _Domain
}
