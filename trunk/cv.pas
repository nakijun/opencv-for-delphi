unit cv;

interface

uses
  cxtypes;

const
  CV_DLL = 'cv210.dll';

  CV_BGR2HSV = 40;

{ Converts input array pixels from one color space to another }
procedure cvCvtColor(const src: PCvArr; dst: PCvArr; code: Integer); cdecl;

implementation

procedure cvCvtColor; external CV_DLL name 'cvCvtColor';

end.
