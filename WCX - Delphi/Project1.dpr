program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  WCaptureXLib_TLB in 'WCaptureXLib_TLB.pas',
  WMonitorXLib_TLB in 'WMonitorXLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
