Rem 1.           Filialin bazasinda
Rem 2. Butun Trigger ve Constraint leri sondurmek
Rem 3. Bu Scripti filialin tablichalari uchun ! Buraxmaq
Rem 4. DELTA  Boyuk bir reqem )

Rem  --- Esas Table-lar 

update SBCM_CONTRACT_ACCOUNTS
   set ID# = ID# + :DELTA
/   
update SBCM_CONTRACT_STATE
   set ID# = ID# + :DELTA
/   
update SBCM_CONTRACTS
   set ID# = ID# + :DELTA
/   
update SBCM_EXPIRES
   set ID# = ID# + :DELTA
/   
update SBCM_INTERESTS
   set ID# = ID# + :DELTA
/   
update SBCM_OVERDUEINTERESTS
   set ID# = ID# + :DELTA
/   
update SBCM_PAYMENTS
   set ID# = ID# + :DELTA
/   
update SBCM_PROLONGATIONS
   set ID# = ID# + :DELTA
/   
update SBCM_TRANCHES
   set ID# = ID# + :DELTA
/   

Rem 5. Seg_SbCm_Contracts sequensesini 
Rem    CURRVAL = select MAX(ID) + 1  from UMUMIBAZA.SBCM_CONTRACTS elemek

Rem 6.   Mumkun sehvler :
Rem 6.1 Eger filial bazadaki (SBCM_CREDIT_TYPES, SBCM_DEPOSIT_TYPES, SBCM_PLEDGETYPES) tablerinin
Rem     hansisa birinde ele yazi varsa ki Umumi bazadaki uygun table-lerde 
Rem     Perebroska elemekden evvel 
Rem     olmasin onlari 1ci novbede perebroska olunmalidi

Rem 7. Yuxarida gosterilmish "Esas Table-lari" Perebroska elemek
Rem 8. Trigger ve Constraintleri enable elemek 
Rem 9. Ugurlar ve eger problem olsa 497-03-58 nomreli telefonla bizi arayin ))

/*SBCM_CATEGORIES
SBCM_CONTRACT_ACCOUNTS
SBCM_CONTRACT_STATE
SBCM_CONTRACTS
SBCM_CREDIT_TYPES
SBCM_DEPOSIT_TYPES
SBCM_EXPIRES
SBCM_INTERESTS
SBCM_OVERDUEINTERESTS
SBCM_PAYMENTS
SBCM_PLEDGETYPES
SBCM_PROLONGATIONS
SBCM_TRANCHES
*/
