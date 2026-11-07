{ Verbatim copy of Packages/SWIFT_MANAGER_IBAN_NEW/SWIFT_MAINImpl1.pas lines 5284-5325 (unchanged; executed by api/app/pascal.py) }
procedure TSWIFT_MAIN.cheskaccountExecute(Sender: TObject);
var
id,i:integer;
hdebet:string;
hkredit:string;
tramount:real;
trdescription,trdescription2:string;
inn:string;
begin
    Gridin.SetFocus;
    if Gridin.DataSource.DataSet.RecordCount<>0 then
    begin

           Gridin.DataSource.DataSet.First;
      for i:=0 to Gridin.DataSource.DataSet.RecordCount-1 do

        begin
   //Grid_out.SelectedRows.CurrentRowSelected:=Grid_out.DataSource.DataSet.RecordCount<>0;
   if (Gridin.DataSource.DataSet.FieldByName('status').asinteger=2)and (Gridin.DataSource.DataSet.FieldByName('MT').asstring='MT103') then

   begin
   id:=Gridin.DataSource.DataSet.fieldbyName('id').asinteger;
   //hdebet:=Gridin.DataSource.DataSet.fieldbyName('bic').AsString;
   hkredit:=Gridin.DataSource.DataSet.fieldbyName('ACOUNT').AsString;
   //tramount:=Gridin.DataSource.DataSet.fieldbyName('valu').AsFloat;
   //trdescription:=Gridin.DataSource.DataSet.fieldbyName('description').asstring;
   //trdescription2:=Gridin.DataSource.DataSet.fieldbyName('description2').asstring;
   //inn:=Gridin.DataSource.DataSet.fieldbyName('TAX').asstring;

                      // ShowMessage(hdebet+' '+hkredit+' '+floattostr(tramount));
                    SwDataModule.sw_in_insert.CallProcedure('check_account',[        id,

                                                                                          hkredit
                                                                                        ]);

    end;
             Gridin.DataSource.DataSet.Next;
              end;

              end;
              sboapiDataModule.SBSession.Commit;
              end;
