{ Verbatim copy of Packages/SWIFT_MANAGER_IBAN_NEW/SWIFT_MAINImpl1.pas lines 3115-3203 (unchanged; executed by api/app/pascal.py) }
procedure TSWIFT_MAIN.CreateFileClick(Sender: TObject);
begin
//SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT_CREATEFILE']);

if SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat<=10000 then  SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT10']);
if (SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat<=100000) and(SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat>10000)then  SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT100']);
if (SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat<=1500000)and(SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat>100000) then  SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT15']);
if (SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat<=2500000 ) and ( SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat>1500000)then  SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT25']);
if (SWDataModule.SW_OUT3.FieldByName('mf32a_amount').AsFloat>2500000)  then  SWDataModule.SB_ACA.CallProcedure('CheckAdvancedObjectAccess', ['SW_OUT250']);




       SWDataModule.MT102data.Close;
       SWDataModule.MT102data.SetVariable('refer',GRIDOUT3.DataSource.DataSet.FieldByName('mf20_reference').AsString);
       SWDataModule.MT102data.open;

       SWDataModule.MT102sum.Close;
       SWDataModule.MT102sum.SetVariable('refer',GRIDOUT3.DataSource.DataSet.FieldByName('mf20_reference').AsString);
       SWDataModule.MT102sum.open;

       if GRIDOUT3.DataSource.DataSet.RecordCount<>0 then
       begin
        SWDataModule.sw_in_insert.CallProcedure('updout',[GRIDOUT3.DataSource.DataSet.FieldByName('id').AsInteger]);


      {if (gridout3.DataSource.DataSet.FieldByName('senderlt').AsString<>'103')
      then
             begin
             if (gridout3.DataSource.DataSet.FieldByName('senderlt').AsString='26') then
              CreateFile2.Execute
             ELSE
             BEGIN

                 v_refrsh:=inttostr(gridout3.DataSource.DataSet.FieldByName('id').asinteger);
                //Pluginloader('filereport.bpl','Azipsnew','-'+v_refrsh);
                SWDataModule.sw_out.Refresh;
               //CreateFile2.Execute;
                PACS0008.Execute;
             END;
     end
     else
       //CreateFile2.Execute;
       PACS0008.Execute;
       }

       if (gridout3.DataSource.DataSet.FieldByName('MESSAGETYPE').AsString='MT102')  then
         begin
         v_refrsh:=inttostr(gridout3.DataSource.DataSet.FieldByName('id').asinteger);



       Pluginloader('filereport.bpl','Azipsnew','-'+v_refrsh);
                    PACS0008.Execute;
         end;

        if (gridout3.DataSource.DataSet.FieldByName('MESSAGETYPE').AsString='MT103')  then

          begin
           v_refrsh:=inttostr(gridout3.DataSource.DataSet.FieldByName('id').asinteger);


       Pluginloader('filereport.bpl','Azipsnew','-'+v_refrsh);
                    PACS0008.Execute;
          end;
        if (gridout3.DataSource.DataSet.FieldByName('MESSAGETYPE').AsString='MT205')  then
          begin
           v_refrsh:=inttostr(gridout3.DataSource.DataSet.FieldByName('id').asinteger);


       Pluginloader('filereport.bpl','Azipsnew','-'+v_refrsh);
                    PACS0008.Execute;
          end;

        if (gridout3.DataSource.DataSet.FieldByName('MESSAGETYPE').AsString='MT999')  then
                    PACS0008.Execute;

       if (gridout3.DataSource.DataSet.FieldByName('MESSAGETYPE').AsString='MT298')  then
                    PACS0008.Execute;

       end

        else ShowMessage('Heç bir format yoxdur!')



end;


