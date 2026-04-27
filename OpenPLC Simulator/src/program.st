PROGRAM main
  VAR
    ob_flag : BOOL;
    TON0 : TON;
    PT1 : TIME := T#2s;
    t1_done : BOOL;
    TON1 : TON;
    em_stop : BOOL;
  END_VAR
  VAR
    stop AT %IX0.0 : BOOL;
    start AT %IX0.1 : BOOL;
    motor AT %QX0.0 : BOOL;
    ob_sensor AT %IX0.2 : BOOL;
    me_sensor AT %IX0.3 : BOOL;
    me_diverter AT %QX0.1 : BOOL;
    non_me_inverter AT %QX0.2 : BOOL;
  END_VAR

  motor := (motor OR start) AND NOT(stop);
  IF em_stop THEN
    motor := FALSE; (*reset*)
  END_IF;
  ob_flag := ob_sensor AND motor;
  me_diverter := NOT(non_me_diverter) AND me_sensor AND ob_sensor;
  non_me_inverter := NOT(me_diverter) AND NOT(me_sensor) AND ob_flag;
  TON0(IN := me_diverter, PT := PT1);
  IF t1_done THEN
    me_diverter := FALSE; (*reset*)
  END_IF;
  TON1(IN := non_me_inverter, PT := PT1);
  IF t2_done THEN
    non_me_inverter := FALSE; (*reset*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
