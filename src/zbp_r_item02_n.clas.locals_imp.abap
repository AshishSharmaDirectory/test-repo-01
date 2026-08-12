*LHC is a Local Handler Class
CLASS lhc_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR item RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR item RESULT result.

    "For Action/Button
    METHODS updstatus FOR MODIFY
      IMPORTING keys FOR ACTION item~updstatus RESULT result.

    "To work with UI(Disable/Enable/Hide)
    "For Disabling the button if the statuscode is already New for a line item
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR item RESULT result.

    "Validation On Save
    METHODS validateprice FOR VALIDATE ON SAVE
      IMPORTING keys FOR item~validateprice.

    "Determinations On Save
    "To set the default price for specific products
*    METHODS productprice FOR DETERMINE ON SAVE
    METHODS productprice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR item~productprice.

ENDCLASS.

CLASS lhc_item IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD updStatus.
    "For performing the action on a button click

    "Update the Status to "YES" when button is clicked
    MODIFY ENTITIES OF zr_item02_n IN LOCAL MODE
    ENTITY item
    UPDATE FIELDS ( StatusCode )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky StatusCode = 'New' ) )

    FAILED failed
    REPORTED reported.

    "Get the respone updated record
    READ ENTITIES OF zr_item02_n IN LOCAL MODE
    ENTITY item
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lwa_item_data).

    result = VALUE #( FOR lwa_item IN lwa_item_data
    ( %tky = lwa_item-%tky %param = lwa_item ) ).


  ENDMETHOD.

  METHOD get_instance_features.

    "For Disabling the button if the statuscode is already New for a line item
    READ ENTITIES OF zr_item02_n IN LOCAL MODE
    ENTITY item
    FIELDS ( StatusCode ) WITH CORRESPONDING #( keys )
    RESULT DATA(itemresult)
    FAILED failed.

*    result = VALUE #( FOR item IN itemresult
*    ( %tky = item-%tky
*     %features-%action-updstatus = COND #(
*     WHEN item-StatusCode = 'YES'
*     THEN if_abap_behv=>fc-o-disabled
*     ELSE if_abap_behv=>fc-o-enabled ) ) ).

    result = VALUE #( FOR item IN itemresult
    LET statusval = COND #( WHEN item-StatusCode = 'New'
    THEN if_abap_behv=>fc-o-disabled
    ELSE if_abap_behv=>fc-o-enabled )
    IN ( %tky = item-%tky
         %action-updstatus = statusval )   ).

  ENDMETHOD.

  METHOD ValidatePrice.
    READ ENTITIES OF zr_item02_n IN LOCAL MODE
    ENTITY item
    FIELDS ( Price ) WITH CORRESPONDING #( Keys )
    RESULT DATA(Prices).

    LOOP AT Prices ASSIGNING FIELD-SYMBOL(<fs_price>).

      IF <fs_price>-Price LE 0.

        APPEND VALUE #( %tky = <fs_price>-%tky ) TO failed-item.

        APPEND VALUE #( %tky = keys[ 1 ]-%tky
                       %msg = new_message_with_text(
                        severity =  if_abap_behv_message=>severity-error
                        text = 'Price cannot be empty!'
                                            ) )
                          TO reported-item.

*        APPEND VALUE #( %tky = <fs_price>-%tky
*                        %element-Price = if_abap_behv=>mk-on
*                        %state_area = 'VALIDATE_PRICE'
*                        %path-zr_root_n = VALUE #( %is_draft = <fs_price>-%is_draft
*                                                   zr_root_n_id = <fs_price>-zr_root_n_id )
*                        %msg = new_message_with_text(
*                        severity =  if_abap_behv_message=>severity-error
*                        text = 'Price cannot be empty!'
*                                            ) )
*                          TO reported-item.

*                        %msg = new_message( id       = 'ZR_ITEM02_N'
*                                            number   = '001'.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD ProductPrice.

    "To set the default price for specific products

    "First read the entity before modify
    READ ENTITIES OF zr_item02_n IN LOCAL MODE
    ENTITY item
    FIELDS ( Name ) WITH CORRESPONDING #( Keys )
    RESULT DATA(lt_products).

    "Modify the entity with the default price
*Working Scenario 1
*    MODIFY ENTITIES OF zr_item02_n IN LOCAL MODE
*    ENTITY item
*    UPDATE FIELDS ( Price )
*    WITH VALUE #( FOR ls_product IN lt_products WHERE ( Name = 'LIQUID' )
*    ( %tky = ls_product-%tky Price = 100 ) ).

*Working Scenario 2
    LOOP AT lt_products INTO DATA(lwa_products).
      IF lwa_products-Name = 'LIQUID'.
        MODIFY ENTITIES OF zr_item02_n IN LOCAL MODE
        ENTITY item
        UPDATE FIELDS ( Price )
        WITH VALUE #( ( %tky = lwa_products-%tky Price = '150' ) ).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
