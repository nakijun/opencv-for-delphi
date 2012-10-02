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

  CV_INTER_NN = 0;
  CV_INTER_LINEAR = 1;
  CV_INTER_CUBIC = 2;
  CV_INTER_AREA = 3;

  CV_SHAPE_RECT = 0;
  CV_SHAPE_CROSS = 1;
  CV_SHAPE_ELLIPSE = 2;
  CV_SHAPE_CUSTOM = 100;

{ Converts input array pixels from one color space to another }
procedure cvCvtColor(const src: PCvArr; dst: PCvArr; code: Integer); cdecl;

{ Smoothes array (removes noise) }
procedure cvSmooth(const src: PCvArr; dst: PCvArr; smoothtype: Integer = CV_GAUSSIAN; size1: Integer = 3; size2: Integer = 0;
                   sigma1: Double = 0; sigma2: Double = 0); cdecl;

{ equalizes histogram of 8-bit single-channel image }
procedure cvEqualizeHist(const src: PCvArr; dst: PCvArr); cdecl;

{ Resizes image (input array is resized to fit the destination array) }
procedure cvResize(const src: PCvArr; dst: PCvArr; interpolation: Integer = CV_INTER_LINEAR); cdecl;

{ creates structuring element used for morphological operations }
function cvCreateStructuringElementEx(cols: Integer; rows: Integer; anchor_x: Integer; anchor_y: Integer;
            shape: Integer; values: PInteger = nil): PIplConvKernel; cdecl;

{ erodes input image (applies minimum filter) one or more times.
   If element pointer is NULL, 3x3 rectangular element is used }
procedure cvErode(const src: PCvArr; dst: PCvArr; element: PIplConvKernel = nil;
   iterations: Integer = 1); cdecl;

{ dilates input image (applies maximum filter) one or more times.
   If element pointer is NULL, 3x3 rectangular element is used }
procedure cvDilate(const src: PCvArr; dst: PCvArr; element: PIplConvKernel = nil;
  iterations: Integer = 1); cdecl;

{ releases structuring element }
procedure cvReleaseStructuringElement(element: P2PIplConvKernel);

implementation

procedure cvCvtColor; external CV_DLL name 'cvCvtColor';
procedure cvSmooth; external CV_DLL name 'cvSmooth';
procedure cvEqualizeHist; external CV_DLL name 'cvEqualizeHist';
procedure cvResize; external CV_DLL name 'cvResize';
function cvCreateStructuringElementEx; external CV_DLL name 'cvCreateStructuringElementEx';
procedure cvErode; external CV_DLL name 'cvErode';
procedure cvDilate; external CV_DLL name 'cvDilate';
procedure cvReleaseStructuringElement; external CV_DLL name 'cvReleaseStructuringElement';

end.
