CREATE OR REPLACE 
PACKAGE p_avalute
  IS
  procedure add_avalute
(
  v_VALUTE avalute.valute%type   
, v_VAL_NAME avalute.val_name%type
, v_VALU_NAME avalute.valu_name%type
, v_VALU_SHORT avalute.valu_short%type
, v_USTORG avalute.ustorg%type
, v_USTPOK avalute.ustpok%type
, v_VALU_GEN avalute.valu_gen%type
, v_VALU_AZ avalute.valu_az%type
, v_USING avalute.using%type
, v_VALU_OTHER avalute.valu_other%type
, v_VALU_INTER avalute.valu_inter%type
, v_VALU_BALA avalute.valu_bala%type
, v_PRISTAVKA avalute.pristavka%type
, v_COUNTRY avalute.country%type
, v_UST_POK1 avalute.ust_pok1%type
, v_OFFICAL avalute.offical%type
, v_LIMIT avalute.limit%type
, v_DEBET avalute.debet%type
, v_KREDIT avalute.kredit%type
, v_F5501P avalute.f5501p%type
, v_F5501V avalute.f5501v%type
, v_SDEBET avalute.sdebet%type
, v_SCREDIT avalute.SCREDIT%type
);
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY p_avalute
IS
-- Call from Trigger of view Avalute
procedure add_avalute
(
  v_VALUTE avalute.valute%type   
, v_VAL_NAME avalute.val_name%type
, v_VALU_NAME avalute.valu_name%type
, v_VALU_SHORT avalute.valu_short%type
, v_USTORG avalute.ustorg%type
, v_USTPOK avalute.ustpok%type
, v_VALU_GEN avalute.valu_gen%type
, v_VALU_AZ avalute.valu_az%type
, v_USING avalute.using%type
, v_VALU_OTHER avalute.valu_other%type
, v_VALU_INTER avalute.valu_inter%type
, v_VALU_BALA avalute.valu_bala%type
, v_PRISTAVKA avalute.pristavka%type
, v_COUNTRY avalute.country%type
, v_UST_POK1 avalute.ust_pok1%type
, v_OFFICAL avalute.offical%type
, v_LIMIT avalute.limit%type
, v_DEBET avalute.debet%type
, v_KREDIT avalute.kredit%type
, v_F5501P avalute.f5501p%type
, v_F5501V avalute.f5501v%type
, v_SDEBET avalute.sdebet%type
, v_SCREDIT avalute.SCREDIT%type
)
is
begin
    insert into avalute
(
VALUTE, VAL_NAME, VALU_NAME, VALU_SHORT, USTORG, USTPOK, VALU_GEN, VALU_AZ, 
USING, VALU_OTHER, VALU_INTER, VALU_BALA, PRISTAVKA, COUNTRY, UST_POK1, 
OFFICAL, LIMIT,DEBET, KREDIT,F5501P, F5501V, SDEBET,SCREDIT
)
values
(
v_VALUTE, v_VAL_NAME, v_VALU_NAME, v_VALU_SHORT, v_USTORG, v_USTPOK, v_VALU_GEN, v_VALU_AZ, 
v_USING, v_VALU_OTHER, v_VALU_INTER, v_VALU_BALA, v_PRISTAVKA, v_COUNTRY, v_UST_POK1, 
v_OFFICAL, v_LIMIT, v_DEBET, v_KREDIT, v_F5501P, v_F5501V, v_SDEBET, v_SCREDIT
);
commit;
end;

END;
/

