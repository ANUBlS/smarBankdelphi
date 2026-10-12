unit CustAnalyseLoader;

interface

procedure InitPlugin(S:String);export;

implementation
   uses   CustanalysUnit,CommonDecls;

   procedure ShowCust;
   begin
      with TCustanalysForm.Create(CommonApplication) do
      try
         ShowModal;
      finally
        Release;
      end;
   end;

   procedure  InitPlugin(S:string);Export;
   const scost='CUSTANALYS';
   BEGIN
      if s=scost then ShowCust;
   END;

 exports
  InitPlugin;

end.
 