unit cxcore;

interface

uses
  cxtypes;

const
  CX_Core_DLL = 'cxcore210.dll';

  CV_FONT_HERSHEY_COMPLEX = 3;
  CV_AA = 16;

type
  TCvFont = record
    font_face: Integer;         // =CV_FONT_*
    ascii: PInteger;            // font data and metrics
    greek: PInteger;
    cyrillic: PInteger;
    hscale: Single;
    vscale: Single;
    shear: Single;              // slope coefficient: 0 - normal, >0 - italic
    thickness: Integer;         // letters thickness
    dx: Single;                 // horizontal interval between letters
    line_type: Integer;
  end;
  PCvFont = ^TCvFont;

{ Creates IPL image (header and data) }
function cvCreateImage(size: TCvSize; depth, channels: Integer): PIplImage; cdecl;

{ Copies source array to destination array }
procedure cvCopy(const src: PCvArr; dst: PCvArr; const mask: PCvArr); cdecl;

{ Releases (i.e. deallocates) IPL image header }
procedure cvReleaseImage(image: P2PIplImage); cdecl;

{ Sets all or "masked" elements of input array to the same value }
procedure cvSet(arr: PCvArr; value: TCvScalar; const mask: PCvArr); cdecl;

{ Initializes font structure used further in cvPutText }
procedure cvInitFont( font: PCvFont; font_face: Integer; hscale: Double; vscale: Double; shear: Double = 0;
    thickness: Integer = 1; line_type: Integer = 8); cdecl;

{ Renders text stroke with specified font and color at specified location.  CvFont should be initialized with cvInitFont }
procedure cvPutText(img: PCvArr; const text: PAnsiChar; org: TCvPoint; const font: PCvFont; color: TCvScalar); cdecl;

function CV_RGB(r, g, b: Double): TCvScalar;

implementation

function cvCreateImage; external CX_Core_DLL name 'cvCreateImage';
procedure cvCopy; external CX_Core_DLL name 'cvCopy';
procedure cvReleaseImage; external CX_Core_DLL name 'cvReleaseImage';
procedure cvSet; external CX_Core_DLL name 'cvSet';
procedure cvInitFont; external CX_Core_DLL name 'cvInitFont';
procedure cvPutText; external CX_Core_DLL name 'cvPutText';

function CV_RGB(r, g, b: Double): TCvScalar;
begin
  Result.val[0] := r;
  Result.val[1] := g;
  Result.val[2] := b;
end;

end.
