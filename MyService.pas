// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : E:\02_myProjects\00_qtPet\04_SOUP\06_Soap\Client\MyService.wsdl
//  >Import : E:\02_myProjects\00_qtPet\04_SOUP\06_Soap\Client\MyService.wsdl>0
// (04.04.2025 17:30:00 - - $Rev: 116709 $)
// ************************************************************************ //

unit MyService;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TMyEmployee          = class;                 { "urn:UninSoupServerIntf"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "urn:UninSoupServerIntf"[GblSmpl] }
  TEnumTest = (etNone, etAFew, etSome, etAlot);

  {$SCOPEDENUMS OFF}



  // ************************************************************************ //
  // XML       : TMyEmployee, global, <complexType>
  // Namespace : urn:UninSoupServerIntf
  // ************************************************************************ //
  TMyEmployee = class(TRemotable)
  private
    FLastName: string;
    FFirstName: string;
    FSalary: Double;
  published
    property LastName:  string  read FLastName write FLastName;
    property FirstName: string  read FFirstName write FFirstName;
    property Salary:    Double  read FSalary write FSalary;
  end;

  TDoubleArray = array of Double;               { "urn:UninSoupServerIntf"[GblCplx] }

  // ************************************************************************ //
  // Namespace : urn:UninSoupServerIntf-ISoapServer
  // soapAction: http://localhost:8080/TSoapServer/GetBankAccountInfo
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : ISoapServerbinding
  // service   : ISoapServerservice
  // port      : ISoapServerPort
  // URL       : http://localhost:8080/soap/ISoapServer
  // ************************************************************************ //
  ISoapServer = interface(IInvokable)
  ['{284AEEEE-8F6F-A2E7-8DFA-63AE9B459D3A}']
    function  echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function  echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function  echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function  echoDouble(const Value: Double): Double; stdcall;
    function  GetBankAccountInfo: string; stdcall;
  end;

function GetISoapServer(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ISoapServer;


implementation
  uses System.SysUtils;

function GetISoapServer(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ISoapServer;
const
//  defWSDL = 'E:\02_myProjects\00_qtPet\04_SOUP\06_Soap\Client\MyService.wsdl';

    defWSDL = 'E:\02_myProjects\00_qtPet\04_SOUP\07_Soap\Client\MyService.wsdl';
//           E:\02_myProjects\00_qtPet\04_SOUP\07_Soup\Client\Win32\Debug\MyService.wsdl

  defURL  = 'http://localhost:8080/soap/ISoapServer';
  defSvc  = 'ISoapServerservice';
  defPrt  = 'ISoapServerPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ISoapServer);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { ISoapServer }
  InvRegistry.RegisterInterface(TypeInfo(ISoapServer), 'urn:UninSoupServerIntf-ISoapServer', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISoapServer), 'http://localhost:8080/TSoapServer/GetBankAccountInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TEnumTest), 'urn:UninSoupServerIntf', 'TEnumTest');
  RemClassRegistry.RegisterXSClass(TMyEmployee, 'urn:UninSoupServerIntf', 'TMyEmployee');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TDoubleArray), 'urn:UninSoupServerIntf', 'TDoubleArray');

end.