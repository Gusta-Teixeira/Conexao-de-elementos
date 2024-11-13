unit uMenuPrincipal;

interface

uses
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms, 
  QDialogs, QStdCtrls, QExtCtrls, uNetwork;
  

type
  TfrMenuPrincipal = class(TForm)
    pnFundo: TPanel;
    edTamanhoArray: TEdit;
    Label1: TLabel;
    edPrimeiroNumero: TEdit;
    Label2: TLabel;
    edSegundoNumero: TEdit;
    Label3: TLabel;
    btConectar: TButton;
    btCriarArray: TButton;
    btMostrarConexao: TButton;
    btLimpa: TButton;
    procedure btConectarClick(Sender: TObject);
    procedure btCriarArrayClick(Sender: TObject);
    procedure btMostrarConexaoClick(Sender: TObject);
    procedure btLimpaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wRede: TNetwork;
  end;

var
  frMenuPrincipal: TfrMenuPrincipal;

implementation

{$R *.xfm}

procedure TfrMenuPrincipal.btConectarClick(Sender: TObject);
begin
  wRede.pConectar(StrToInt(Trim(edPrimeiroNumero.Text)), StrToInt(Trim(edSegundoNumero.Text)));
end;

procedure TfrMenuPrincipal.btCriarArrayClick(Sender: TObject);
begin
  wRede := TNetwork.Create(StrToInt(Trim(edTamanhoArray.Text)));
end;

procedure TfrMenuPrincipal.btMostrarConexaoClick(Sender: TObject);
begin
  if wRede.fConsultar(StrToInt(Trim(edPrimeiroNumero.Text)), StrToInt(Trim(edSegundoNumero.Text))) then
    ShowMessage(Trim(edPrimeiroNumero.Text) + ' e ' + Trim(edSegundoNumero.Text) + ' estão conectados')
  else
    ShowMessage(Trim(edPrimeiroNumero.Text) + ' e ' + Trim(edSegundoNumero.Text) + 'não estão conectados');
end;

procedure TfrMenuPrincipal.btLimpaClick(Sender: TObject);
begin
  if Assigned(wRede) then
     FreeAndNil(wRede);

  edTamanhoArray.Text   := '';
  edPrimeiroNumero.Text := '';
  edSegundoNumero.Text  := '';
end;

end.
