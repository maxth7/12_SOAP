unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  MyService,
   Xml.XMLDoc, Xml.XMLIntf;
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
  MyService:ISoapServer;// TMyService;
  XMLResponse: string;
begin
  //MyService := TSoapServer.Create(nil);
//  try
//    XMLResponse := MyService.GetBankAccountInfo;
//    Memo1.Lines.Text := XMLResponse;
//  finally
//    MyService.Free;
//  end;

//    MyService := GetISoapServer('http://localhost:8080/soap/ISoapServer');
    MyService := GetISoapServer(False, 'http://localhost:8080/soap/ISoapServer');
   // ShowMessage(MyService.GetBankAccountInfo);
  //   MemoMess.Clear;

     //MemoMess.Lines.Add(MyService.GetBankAccountInfo);
   //   MemoMess.Lines.Text :=MyService.GetBankAccountInfo;
//      MemoMess.Lines.Text :=MyService.echoEnum();
     ParseXML(MyService.GetBankAccountInfo);
end;


procedure TForm1.ParseXML(const AXML: string);
var
  XMLDocument: IXMLDocument;
  RootNode, INNNode, AccountNumberNode, BICNode, PaymentPurposeNode, AmountNode: IXMLNode;
begin
 MemoOutParseXML.Clear;
  // Создаем XML-документ
  XMLDocument := LoadXMLData(AXML);

  // Получаем корневой узел
  RootNode := XMLDocument.DocumentElement;

  // Читаем значения из узлов
  INNNode := RootNode.ChildNodes.FindNode('INN');
  if Assigned(INNNode) then
  MemoOutParseXML.Lines.Add('INN: ' + INNNode.Text);
    //Writeln('INN: ' + INNNode.Text);


  AccountNumberNode := RootNode.ChildNodes.FindNode('AccountNumber');
  if Assigned(AccountNumberNode) then
  MemoOutParseXML.Lines.Add('AccountNumber: ' + AccountNumberNode.Text);
//    Writeln('AccountNumber: ' + AccountNumberNode.Text);

  BICNode := RootNode.ChildNodes.FindNode('BIC');
  if Assigned(BICNode) then
   MemoOutParseXML.Lines.Add('BIC: ' + BICNode.Text);
    //Writeln('BIC: ' + BICNode.Text);

  PaymentPurposeNode := RootNode.ChildNodes.FindNode('PaymentPurpose');
  if Assigned(PaymentPurposeNode) then
     MemoOutParseXML.Lines.Add( 'PaymentPurpose: ' + PaymentPurposeNode.Text);
    //Writeln('PaymentPurpose: ' + PaymentPurposeNode.Text);

  AmountNode := RootNode.ChildNodes.FindNode('Amount');
  if Assigned(AmountNode) then
   MemoOutParseXML.Lines.Add('Amount: ' + AmountNode.Text);
//    Writeln('Amount: ' + AmountNode.Text);
end;

end.
