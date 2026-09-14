CLASS zcl_cal_discount DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_CAL_DISCOUNT IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA: LT_items TYPE STANDARD TABLE OF zc_item02_n WITH DEFAULT KEY.
    LT_items =  CORRESPONDING #( it_original_data ).

    LOOP AT LT_items ASSIGNING FIELD-SYMBOL(<lfs_item>) WHERE Price > 0.
      IF <lfs_item>-Price < 500.
        <lfs_item>-Disc = '5.00'.
        <lfs_item>-FPrice = <lfs_item>-Price - <lfs_item>-Disc.
      ELSEIF <lfs_item>-Price > 500.
        <lfs_item>-Disc = '10.00'.
        <lfs_item>-FPrice = <lfs_item>-Price - <lfs_item>-Disc.
      ENDIF.
    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( LT_items ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
