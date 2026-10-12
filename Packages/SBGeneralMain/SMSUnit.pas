unit SMSUnit;

interface
//uses CurrencyToHRImpl;
//   private ;
  function sms(id :integer):integer ;


implementation

 uses
   Dialogs ,SysUtils;

function sms(id :integer):integer ;
begin
if id>1 then

  showmessage('samir');
end;
end.
