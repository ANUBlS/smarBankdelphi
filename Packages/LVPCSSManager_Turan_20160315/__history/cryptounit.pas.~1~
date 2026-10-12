{*****************************************************************************}
{*****************************************************************************}
{********************** SMART SYSTEM TECHNOLOGY LTD **************************}
{**********************        10 jun 2004          **************************}
{*****************************************************************************}
{**********************        20 MAY 2006          **************************}
{**********************    MODIFIED BY L-CHIN       **************************}
{*****************************************************************************}
{*****************************************************************************}


unit CryptoUnit;

interface

uses
  Messages, SysUtils,  Dialogs,CRYPTOMODELLib_TLB;





  Function SetSign  (secret_key,base_key: WideString;DataString: AnsiString) : STRING;
  Function SignCheck(secret_key,base_key: WideString;DataString,
                     SignString: AnsiString;var GetAbonent: WideString) : Boolean;

implementation
  var
      SBCryptoSession: TCryptoSession;
      i,k,j: integer;
      SetPos:_LARGE_INTEGER;//TGUID;
      NewPos:TGUID;//_ULARGE_INTEGER;
      piinSession,pioutSession,piEndSession :IStream;
      Str,DoubleStr:AnsiString;
      ByteCount,ByteWrited: cardinal;
      ReadArray :array[1..500] Of byte;
      byt :BYTE;
      tagSt:tagSTATSTG;//  TGUID;
         car  : Cardinal;
      ch : char;
{*****************************************************************************}
{***********************SET SIGN TO STRING************************************}
{*****************************************************************************}
Function SetSign(secret_key,base_key: WideString;DataString: AnsiString) : STRING;
     var SignString: String;
BEGIN
     SBCryptoSession:=TCryptoSession.Create(nil);
     SBCryptoSession.Init(secret_key,base_key);
     SBCryptoSession.CreateStreamOnMemory(piinSession);
     SBCryptoSession.CreateStreamOnMemory(pioutSession);
     TRY
          Str:=DataString;
         {Write to Stream}
          for i :=1 to length(str) do
          begin
            ch:=str[i];
            byt:=ord(ch);
            if byt<> 13 then
              begin
                piinSession.RemoteWrite(byt,1,ByteWrited);
                byt:=ord(#0);
                piinSession.RemoteWrite(byt,1,ByteWrited);
              end;
          end;
          {Set position -0}
          SetPos.QuadPart:=0;
          piinSession.RemoteSeek (SetPos,0,NewPos);
          pioutSession.RemoteSeek(SetPos,0,NewPos);
          {Sign for String}
              SBCryptoSession.Sign(piinSession,pioutSession);
          {Read from Stream}
          pioutSession.Stat (tagSt,car);
          k:=tagSt.cbSize.D1;

          for i:=1 to k do
          begin
              SetPos.QuadPart:=i-1;
              pioutSession.RemoteSeek(SetPos,0,NewPos);
              pioutSession.RemoteRead(readarray[i] ,1,ByteCount);
              SignString:=SignString+ IntToHex(readarray[i],2);
          end;
     FINALLY
     SBCryptoSession.DeleteStreamOnMemory(piinSession);
     SBCryptoSession.DeleteStreamOnMemory(pioutSession);
     SBCryptoSession.Close;
     SBCryptoSession.Free;
     Result:=SignString;
     end;
END;
{*****************************************************************************}
{***********************    CHECK SIGN    ************************************}
{*****************************************************************************}
Function SignCheck(secret_key,base_key: WideString;DataString,
                   SignString: AnsiString;var GetAbonent: WideString) : Boolean;

     var CheckResult : WordBool;
BEGIN
     SBCryptoSession:=TCryptoSession.Create(nil);
     SBCryptoSession.Init(secret_key,base_key);
     SBCryptoSession.CreateStreamOnMemory(piinSession);
     SBCryptoSession.CreateStreamOnMemory(pioutSession);
     TRY
           SetPos.QuadPart:=0;
           piinSession.RemoteSeek(SetPos,0,NewPos);
           pioutSession.RemoteSeek(SetPos,0,NewPos);
           {WRITE DATA TO STREAM}
           str:=DataString;
           for i :=1 to length(str) do
           begin
              ch:=str[i];
              byt:=ord(ch);
              if byt<> 13 then
                begin
                  piinSession.RemoteWrite(byt,1,ByteWrited);
                  byt:=ord(#0);
                  piinSession.RemoteWrite(byt,1,ByteWrited);
                end;
           end;
           {WRITE SIGN STRING TO STREAM}
           str:=SignString; j:=0;
           for i :=0 to 140 do
           begin
              DoubleStr:=('$'+copy(str,j+1,2));
              byt:=byte(strtoint(DoubleStr));
              pioutSession.RemoteWrite(byt,1,ByteWrited);
              inc(j,2);
           end;
           {}
           Result:=false;
           {Set stream position 0}
           SetPos.QuadPart:=0;
           piinSession.RemoteSeek(SetPos,0,NewPos);
           pioutSession.RemoteSeek(SetPos,0,NewPos);
           { CHECK SIGN }
           SBCryptoSession.CheckSign(piinSession,pioutSession,GetAbonent,CheckResult);
           {Showing Result}
           if CheckResult then ShowMessage('Sign OK') else ShowMessage('Bad Sign');

     FINALLY
     SBCryptoSession.DeleteStreamOnMemory(piinSession);
     SBCryptoSession.DeleteStreamOnMemory(pioutSession);
     SBCryptoSession.Close;
     SBCryptoSession.Free;
     Result:=CheckResult;
     end;
END;



end.
