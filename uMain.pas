unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.Filter.Effects, FMX.Effects;

type
  TfMain = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Layout2: TLayout;
    btnLOAD: TButton;
    OpenDialog1: TOpenDialog;
    ContrastEffect1: TContrastEffect;
    InvertEffect1: TInvertEffect;
    btnSAVE: TButton;
    Layout3: TLayout;
    cbCONTRAST: TCheckBox;
    cbNONE: TCheckBox;
    cbINVERT: TCheckBox;
    procedure btnSAVEClick(Sender: TObject);
    procedure cbCONTRASTChange(Sender: TObject);
    procedure cbINVERTChange(Sender: TObject);
    procedure cbNONEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.fmx}

procedure TfMain.btnSAVEClick(Sender: TObject);
begin
  Layout1.MakeScreenshot.SaveToFile('finalImage.jpg');
end;

procedure TfMain.cbCONTRASTChange(Sender: TObject);
begin
  if cbCONTRAST.IsChecked = true then
  begin
    ContrastEffect1.Enabled := true;
    cbCONTRAST.Text := 'Contrast (ON)';
    Layout1.MakeScreenshot.SaveToFile('temp_image.jpg');
    Image1.Bitmap.LoadFromFile('temp_image.jpg');
    ContrastEffect1.Enabled := false;
    cbCONTRAST.Text := 'Contrast (OFF)';
  end
  else
  begin
    cbCONTRAST.Text := 'Contrast (OFF)';
    Image1.Bitmap.LoadFromFile('finalImage.jpg');
  end;
end;

procedure TfMain.cbINVERTChange(Sender: TObject);
begin
  if cbINVERT.IsChecked = true then
  begin
    // ContrastEffect1.Enabled := false;
    InvertEffect1.Enabled := true;
    cbINVERT.Text := 'Invert (ON)';
    Layout1.MakeScreenshot.SaveToFile('temp_image2.jpg');
    Image1.Bitmap.LoadFromFile('temp_image2.jpg');
    InvertEffect1.Enabled := false;
    cbINVERT.Text := 'Invert (OFF)';
  end
  else
  begin
    cbINVERT.Text := 'Invert (OFF)';
    Image1.Bitmap.LoadFromFile('temp_image.jpg');
  end;

end;

procedure TfMain.cbNONEChange(Sender: TObject);
begin
  ContrastEffect1.Enabled := false;
  InvertEffect1.Enabled := false;
  cbCONTRAST.IsChecked := InvertEffect1.Enabled;
  cbINVERT.IsChecked := InvertEffect1.Enabled;
  Image1.Bitmap.LoadFromFile('finalImage.jpg');
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  Layout1.MakeScreenshot.SaveToFile('finalImage.jpg');
end;

end.
