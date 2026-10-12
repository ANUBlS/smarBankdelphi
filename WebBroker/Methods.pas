unit Methods;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp, Data.FMTBcd, Xml.xmldom,
  Xml.XMLIntf, Xml.XMLDoc, Data.DB, Data.SqlExpr,system.JSON, Data.DBXOracle,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef, FireDAC.VCLUI.Wait;

type
  TWeb = class(TWebModule)
    conn: TSQLConnection;
    queries: TSQLQuery;
    XMLDoc: TXMLDocument;
    FDQuery1: TFDQuery;
    FDMemTable1: TFDMemTable;
    FDConnection1: TFDConnection;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    function conn_salary(): string;
    function nocors():string;
    function convertingjson (querytext :String):string ;
    procedure WebotdelAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebkategrAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebkpnAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebprfsAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebdoljAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebrazrdAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebixtisasAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebbudjetAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebogranAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebvidoplAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebpodrzdAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebuchzvnAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebuchstpAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure Webn01p04Action(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
    procedure WebtrAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWeb;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TWeb.conn_salary(): string;
var RootNode, xmlNode: IXMLNode;
i,j,k,tr,sr:Integer;
 dbname,dbuser,dbpass:String;

begin

{XMLDoc.LoadFromFile('C:\xampp\apache\modules\webservice_connection.xml');
XMLDoc.Active := True;
RootNode := XMLDoc.DocumentElement;
         dbname:= RootNode.ChildNodes['Salary'].ChildNodes['dbname'].Text;
         dbuser:= RootNode.ChildNodes['Salary'].ChildNodes['dbuser'].Text;
         dbpass:= RootNode.ChildNodes['Salary'].ChildNodes['dbpass'].Text;

   XMLDoc.Active := False; }
   conn.Params.Values['User_Name'] := 'salary';
   conn.Params.Values['Password'] := 'salary';
   conn.Params.Values['Database'] := 'pdbnbc';
   conn.DriverName:='Oracle';

   conn.Connected:=true;

   if conn.Connected then
      result:='connected'
   else
      result:='not connected';


end;

       function MemoryStreamToString(M: TMemoryStream): string;
begin
  SetString(Result, PChar(M.Memory), M.Size div SizeOf(Char));
end;



function Tweb.nocors:string;
var Handled: Boolean ;
begin
 Response.SetCustomHeader('Access-Control-Allow-Origin','*');

  if Trim(Request.GetFieldByName('Access-Control-Request-Headers')) <> '' then
  begin
    Response.SetCustomHeader('Access-Control-Allow-Headers', Request.GetFieldByName('Access-Control-Request-Headers'));
    Handled := True;
  end;
end;

  function TWeb.convertingjson (querytext :String):string ;
 Var
field_name,nameColunm,valueColunm,rt: String;
I: Integer;
LJSONObject:TJsonObject;
jsonitems,JSONObject:TJSONObject;
    JSONArray:TJSONArray;
    p : TFDQuery;

  fMStream:TMemoryStream;


begin

  conn_salary();
        queries.Close;
         Queries.SQLConnection:=conn;
      queries.sql.Clear;
      queries.SQL.Text := querytext;
      queries.Active := True;
      queries.First;
         // jsonitems:=TJSONObject.Create;
      while (not queries.EOF) do
      begin

        rt := rt+'{';
        for I := 0 to queries.FieldDefs.Count-1 do
        begin
          nameColunm  := queries.FieldDefs[I].Name;
          valueColunm := queries.FieldByName(nameColunm).AsString;
          rt := rt+'"'+nameColunm+'":"'+valueColunm+'",';
         { jsonitems.AddPair( nameColunm,valueColunm);
         JSONArray := TJSONArray.Create;
         JSONArray.Add(jsonitems);
           JSONObject := TJSONObject.Create;
           JSONObject.AddPair('Items', JSONArray);     }





        end;
        Delete(rt, Length(rt), 1);
        rt := rt+'},';
        queries.Next;
      end;
      queries.Refresh;
      Delete(rt, Length(rt), 1);

      result:='{"items":['+rt+']}';

    end;


procedure TWeb.WebbudjetAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin

    nocors;

st := ' select Id, Dok from budjet order by id';
Response.Content :=
    convertingjson(st);

end;

procedure TWeb.WebdoljAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from dolj order by id';
Response.Content :=
    convertingjson(st)
end;

procedure TWeb.WebixtisasAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from ixtisas order by id';
Response.Content :=
    convertingjson(st)


end;

procedure TWeb.WebkategrAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
 var st:string;
begin
nocors;
st := ' select Id, Dok from kategr order by id';
Response.Content :=
    convertingjson(st)
end;

procedure TWeb.WebkpnAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
   var st:string;
  begin
  nocors;
      st := ' select Id, Dok from kpn order by id';
Response.Content :=
    convertingjson(st)
end;

procedure TWeb.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
nocors;
  Response.Content :=
    '<html>' +
    '<head><title>Web Server Application</title></head>' +
    '<body>Web Server Application</body>' +    '</html>';
end;

procedure TWeb.Webn01p04Action(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from    n01p04 order by id';
Response.Content :=
    convertingjson(st)

end;

procedure TWeb.WebogranAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from ogran order by id';
Response.Content :=
   convertingjson(st)
end;

procedure TWeb.WebotdelAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin

     nocors;
st := ' select Id, Dok from otdel order by id';
Response.Content :=
    convertingjson(st);

end;

procedure TWeb.WebpodrzdAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from podrzd order by id';
Response.Content :=
    convertingjson(st)
end;

procedure TWeb.WebprfsAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
     var st:string;
begin
nocors;
st := ' select Id, Dok from prfs order by id';
Response.Content :=
    convertingjson(st)
end;

procedure TWeb.WebrazrdAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from razrd order by id';
Response.Content :=
    convertingjson(st)
end;

procedure TWeb.WebtrAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
var
  i: Integer;
begin
    nocors;
     if Request.QueryFields.Values['Myfielss']=inttostr(55) then
        i:=66;


  Response.Content :=
    '<html>' +
    '<head><title>Tesss</title></head>' +
    '<body>' +Request.Method+'----'+ inttostr(i)+'***'+Request.QueryFields.Values['Myfields']+'</body>' + '</html>';

end;

procedure TWeb.WebuchstpAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from uchstp order by id';
Response.Content :=
   convertingjson(st)
end;

procedure TWeb.WebuchzvnAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from uchzvn order by id';
Response.Content :=
  convertingjson(st)
end;

procedure TWeb.WebvidoplAction(Sender: TObject; Request: TWebRequest;
  Response: TWebResponse; var Handled: Boolean);
  var st:string;
begin
nocors;
st := ' select Id, Dok from vidopl order by id';
Response.Content :=
  convertingjson(st)

end;

end.
