update smart.sysdat set tek_dat='18-dec-2006', pred_dat='15-dec-2006', arc_day='14-dec-2006'
/
update smart.tenostat set datdate='18-dec-2006'
/
update smart.provarch set dat='18-dec-2006' where dat='16-dec-2006'
/
update smart.operkurs set dat='18-dec-2006' where dat='16-dec-2006'
/
update creditsmgr.cm_curr_state set hdate='18-dec-2006' where hdate='16-dec-2006'
/
update creditsmgr.cm_int_currstate set hdate='18-dec-2006' where hdate='16-dec-2006'