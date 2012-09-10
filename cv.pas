unit cv;

interface

uses
  cxtypes;

const
  CV_DLL = 'cv210.dll';

  CV_BGR2HSV = 40;

  CV_BLUR_NO_SCALE = 0;
  CV_BLUR = 1;
  CV_GAUSSIAN = 2;
  CV_MEDIAN = 3;
  CV_BILATERAL = 4;

{ Converts input array pixels from one color space to another }
procedure cvCvtColor(const src: PCvArr; dst: PCvArr; code: Integer); cdecl;

{ Smoothes array (removes noise) }
procedure cvSmooth(const src: PCvArr; dst: PCvArr; smoothtype: Integer = CV_GAUSSIAN; size1: Integer = 3; size2: Integer = 0;
                   sigma1: Double = 0; sigma2: Double = 0); cdecl;

implementation

procedure cvCvtColor; external CV_DLL name 'cvCvtColor';
procedure cvSmooth; external CV_DLL name 'cvSmooth';

end.
