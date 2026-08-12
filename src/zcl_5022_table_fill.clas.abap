CLASS zcl_5022_table_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    CLASS-METHODS load_data.

  PROTECTED SECTION.

  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_5022_table_fill IMPLEMENTATION.

  METHOD load_data.
    DATA: ls_header TYPE zTravel_hdr_N,
          ls_item   TYPE ztRAVEL_item_N.


    SELECT * FROM zTravel_hdr_N INTO TABLE @DATA(lt_travel_hdr).
    IF sy-subrc EQ 0.
      SORT lt_travel_hdr BY agency_id DESCENDING.
      READ TABLE lt_travel_hdr INTO ls_header INDEX 1.
      ls_header-agency_id = ls_header-agency_id + 1.
      ls_header-travel_id  = ls_header-travel_id  + 1.
      ls_header-description = |Travel ID { ls_header-agency_id }|.
      ls_header-customer_id    = ls_header-customer_id  + 1.
      ls_header-begin_date     = cl_abap_context_info=>get_system_date( ).
      ls_header-end_date       = cl_abap_context_info=>get_system_date( ) + 6.
      ls_header-status         = 'I'.
      INSERT zTravel_hdr_N FROM @ls_header.
      IF sy-subrc EQ 0.

      ENDIF.
    ENDIF.


    SELECT * FROM ztRAVEL_item_N INTO TABLE @DATA(lt_travel_itm).
    IF sy-subrc EQ 0.
      SORT lt_travel_itm BY agency_id DESCENDING.
      READ TABLE lt_travel_itm INTO ls_item INDEX 1.
      ls_item-item_uuid = ls_item-item_uuid + 1.
      ls_item-agency_id = ls_item-agency_id + 1.
      ls_item-travel_id  = ls_item-travel_id  + 1.
      ls_item-booking_id = ls_item-booking_id + 1.
      ls_item-carrier_id =    ls_item-carrier_id.
      ls_item-connection_id        = ls_item-connection_id  + 1.
      ls_item-flight_date          = cl_abap_context_info=>get_system_date( ) + 1.
      ls_item-passenger_first_name = cl_abap_context_info=>get_user_technical_name( ).
      ls_item-passenger_last_name  = cl_abap_context_info=>get_user_technical_name( ).
      INSERT ztRAVEL_item_N FROM @ls_item.
      IF sy-subrc EQ 0.
        COMMIT WORK.
      ENDIF.
    ENDIF.




    COMMIT WORK.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.


    DATA(lo_obj) = NEW zcl_5022_table_fill( ).
    lo_obj->load_data( ).


  ENDMETHOD.

ENDCLASS.
