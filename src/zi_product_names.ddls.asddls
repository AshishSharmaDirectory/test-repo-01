@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Names from Domain'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Product_Names as select from 
DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZDOM_PRODUCT_CODE'  )
{
    key domain_name,
    key value_position,
    @Semantics.language: true
    key language,
    value_low as Value,
    @Semantics.text: true
    text as ProdDesc
}
