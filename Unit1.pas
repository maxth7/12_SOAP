unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  MyService,
   Xml.XMLDoc, Xml.XMLIntf;
const
  URL_LOCAL_SERVER='http://localhost:8080/';
type
  TForm1 = class(TForm)
    Button1: TButton;
    MemoOutParseXML: TMemo;
    Label1: TLabel;

    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    procedure ParseXML(const AXML: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  MyService:ISoapServer;
  XMLResponse: string;
begin
    MyService := GetISoapServer(False, URL_LOCAL_SERVER+'soap/ISoapServer');
    ParseXML(MyService.GetBankAccountInfo);
end;

procedure TForm1.ParseXML(const AXML: string);
var
  XMLDocument: IXMLDocument;
  RootNode, INNNode, AccountNumberNode, BICNode, PaymentPurposeNode, AmountNode: IXMLNode;
begin
  MemoOutParseXML.Clear;
  XMLDocument := LoadXMLData(AXML);
  RootNode := XMLDocument.DocumentElement;
  INNNode := RootNode.ChildNodes.FindNode('INN');
  if Assigned(INNNode) then
  MemoOutParseXML.Lines.Add('INN: ' + INNNode.Text);
  AccountNumberNode := RootNode.ChildNodes.FindNode('AccountNumber');
  if Assigned(AccountNumberNode) then
  MemoOutParseXML.Lines.Add('AccountNumber: ' + AccountNumberNode.Text);
  BICNode := RootNode.ChildNodes.FindNode('BIC');
  if Assigned(BICNode) then
   MemoOutParseXML.Lines.Add('BIC: ' + BICNode.Text);
  PaymentPurposeNode := RootNode.ChildNodes.FindNode('PaymentPurpose');
  if Assigned(PaymentPurposeNode) then
     MemoOutParseXML.Lines.Add( 'PaymentPurpose: ' + PaymentPurposeNode.Text);
  AmountNode := RootNode.ChildNodes.FindNode('Amount');
  if Assigned(AmountNode) then
   MemoOutParseXML.Lines.Add('Amount: ' + AmountNode.Text);
end;

end.
