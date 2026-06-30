//Root View Entity - Main CDS View
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View Entity for Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZR_ITEM02_N as select from zitem02_n
//composition of target_data_source_name as _association_name
{
    key item_id as ItemId,
    name as Name,
    description as Description,
    price as Price,
    status_code as StatusCode,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
//    _association_name // Make association public
}

//Table : ZITEM02_N
//CDS Root view : ZR_ITEM02_N
//Project View : ZC_ITEM02_N
//Behavior Definition for CDS root view ZR_ITEM02_N
//Behavior Definition for Projection root view ZC_ITEM02_N
