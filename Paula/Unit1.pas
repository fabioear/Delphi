unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxExportBaseDialog,
  frxExportPDF, frxRich, Vcl.StdCtrls, Data.DB, MemDS, DBAccess, MyAccess;

type
  TForm1 = class(TForm)
    frxReport1: TfrxReport;
    frxRichObject1: TfrxRichObject;
    frxPDFExport1: TfrxPDFExport;
    Button1: TButton;
    MyConnection1: TMyConnection;
    uniquery: TMyQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  caminho : string;
begin
  uniquery.Active := True;
  uniquery.Open();
  uniquery.First;
  while not uniquery.Eof do
    begin
    if  uniquery.Fields[2].text = '1' then
      begin
      CAMINHO := extractfilepath(Application.ExeName);
      frxReport.LoadFromFile('f:\Teste\rph2.fr3');

      frxReport.Variables['nome']     := '''' + uniquery.Fields[1].text + '''';
      frxReport.Variables['civil']    := '''' + uniquery.Fields[3].text + '''';
      frxReport.Variables['prof']     := '''' + uniquery.Fields[4].text + '''';
      frxReport.Variables['cpf']      := '''' + uniquery.Fields[6].text + '''';
      frxReport.Variables['iden']     := '''' + uniquery.Fields[5].text + '''';
      frxReport.Variables['cidade']   := '''' + uniquery.Fields[9].text + '''';
      frxReport.Variables['estado']   := '''' + uniquery.Fields[10].text + '''';
      frxReport.Variables['endereco'] := '''' + uniquery.Fields[7].text+ '''';
      frxReport.Variables['bairro']   := '''' + uniquery.Fields[8].text+ '''';
      frxReport.Variables['cep']      := '''' + uniquery.Fields[11].text + '''';
      frxReport.Variables['mat']      := '''' + uniquery.Fields[14].text + '''';
      frxReport.Variables['func']     := '''' + uniquery.Fields[12].text+ '''';
      frxReport.Variables['adm']      := '''' + uniquery.Fields[15].text+ '''';
      frxReport.Variables['lotado']   := '''' + uniquery.Fields[16].text + '''';
      frxreport.Variables['cargo']    := '''' + uniquery.Fields[13].Text + '''';

      frxreport.Preparereport();
      pdfExport.FileName := caminho + '\'+ uniquery.Fields[1].text + '.pdf';
      frxreport.Export(pdfExport);
      uniquery.Next;
      end
    else
      begin
      uniquery.Next;
      end;
    end;
end;

end.
end;

end.
