unit cv;

interface

uses
  cxtypes, cvtypes;

const
  CV_DLL = 'cv210.dll';

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

  { Constants for color conversion }
  CV_BGR2BGRA   = 0;
  CV_RGB2RGBA   = CV_BGR2BGRA;

  CV_BGRA2BGR   = 1;
  CV_RGBA2RGB   = CV_BGRA2BGR;

  CV_BGR2RGBA   = 2;
  CV_RGB2BGRA   = CV_BGR2RGBA;

  CV_RGBA2BGR   = 3;
  CV_BGRA2RGB   = CV_RGBA2BGR;

  CV_BGR2RGB    = 4;
  CV_RGB2BGR    = CV_BGR2RGB;

  CV_BGRA2RGBA  = 5;
  CV_RGBA2BGRA  = CV_BGRA2RGBA;

  CV_BGR2GRAY   = 6;
  CV_RGB2GRAY   = 7;
  CV_GRAY2BGR   = 8;
  CV_GRAY2RGB   = CV_GRAY2BGR;
  CV_GRAY2BGRA  = 9;
  CV_GRAY2RGBA  = CV_GRAY2BGRA;
  CV_BGRA2GRAY  = 10;
  CV_RGBA2GRAY  = 11;

  CV_BGR2BGR565 = 12;
  CV_RGB2BGR565 = 13;
  CV_BGR5652BGR = 14;
  CV_BGR5652RGB = 15;
  CV_BGRA2BGR565 = 16;
  CV_RGBA2BGR565 = 17;
  CV_BGR5652BGRA = 18;
  CV_BGR5652RGBA = 19;

  CV_GRAY2BGR565 = 20;
  CV_BGR5652GRAY = 21;

  CV_BGR2BGR555 = 22;
  CV_RGB2BGR555 = 23;
  CV_BGR5552BGR = 24;
  CV_BGR5552RGB = 25;
  CV_BGRA2BGR555 = 26;
  CV_RGBA2BGR555 = 27;
  CV_BGR5552BGRA = 28;
  CV_BGR5552RGBA = 29;

  CV_GRAY2BGR555 = 30;
  CV_BGR5552GRAY = 31;

  CV_BGR2XYZ    = 32;
  CV_RGB2XYZ    = 33;
  CV_XYZ2BGR    = 34;
  CV_XYZ2RGB    = 35;

  CV_BGR2YCrCb  = 36;
  CV_RGB2YCrCb  = 37;
  CV_YCrCb2BGR  = 38;
  CV_YCrCb2RGB  = 39;

  CV_BGR2HSV    = 40;
  CV_RGB2HSV    = 41;

  CV_BGR2Lab    = 44;
  CV_RGB2Lab    = 45;

  CV_BayerBG2BGR = 46;
  CV_BayerGB2BGR = 47;
  CV_BayerRG2BGR = 48;
  CV_BayerGR2BGR = 49;

  CV_BayerBG2RGB = CV_BayerRG2BGR;
  CV_BayerGB2RGB = CV_BayerGR2BGR;
  CV_BayerRG2RGB = CV_BayerBG2BGR;
  CV_BayerGR2RGB = CV_BayerGB2BGR;

  CV_BGR2Luv    = 50;
  CV_RGB2Luv    = 51;
  CV_BGR2HLS    = 52;
  CV_RGB2HLS    = 53;

  CV_HSV2BGR    = 54;
  CV_HSV2RGB    = 55;

  CV_Lab2BGR    = 56;
  CV_Lab2RGB    = 57;
  CV_Luv2BGR    = 58;
  CV_Luv2RGB    = 59;
  CV_HLS2BGR    = 60;
  CV_HLS2RGB    = 61;

  CV_COLORCVT_MAX = 100;

  CV_WARP_FILL_OUTLIERS = 8;
  CV_WARP_INVERSE_MAP   = 16;

{ Converts input array pixels from one color space to another }
procedure cvCvtColor(const src: PCvArr; dst: PCvArr; code: Integer); cdecl;

{ Smoothes array (removes noise) }
procedure cvSmooth(const src: PCvArr; dst: PCvArr; smoothtype: Integer = CV_GAUSSIAN; size1: Integer = 3; size2: Integer = 0;
                   sigma1: Double = 0; sigma2: Double = 0); cdecl;

{ equalizes histogram of 8-bit single-channel image }
procedure cvEqualizeHist(const src: PCvArr; dst: PCvArr); cdecl;

{ Resizes image (input array is resized to fit the destination array) }
procedure cvResize(const src: PCvArr; dst: PCvArr; interpolation: Integer = CV_INTER_LINEAR); cdecl;



            shape: Integer; values: PInteger = nil): PIplConvKernel; cdecl;



procedure cvErode(const src: PCvArr; dst: PCvArr; element: PIplConvKernel = nil;
   iterations: Integer = 1); cdecl;

{ dilates input image (applies maximum filter) one or more times.
   If element pointer is NULL, 3x3 rectangular element is used }
procedure cvDilate(const src: PCvArr; dst: PCvArr; element: PIplConvKernel = nil;
  iterations: Integer = 1); cdecl;

{ releases structuring element }
procedure cvReleaseStructuringElement(element: P2PIplConvKernel); cdecl;

{ Convolves the image with the kernel }
procedure cvFilter2D(const src: PCvArr; dst: PCvArr; const kernel: PCvMat; anchor: TCvPoint); cdecl;

{ Runs canny edge detector }
procedure cvCanny(const image: PCvArr; edges: PCvArr; threshold1, threshold2: Double;
   aperture_size: Integer = 3); cdecl;

{
   Smoothes the input image with gaussian kernel and then down-samples it.
   dst_width = floor(src_width/2)[+1],
   dst_height = floor(src_height/2)[+1]
}
procedure cvPyrDown(const src: PCvArr; dst: PCvArr; filter: Integer = CV_GAUSSIAN_5x5); cdecl;

implementation

procedure cvCvtColor; external CV_DLL name 'cvCvtColor';
procedure cvSmooth; external CV_DLL name 'cvSmooth';
procedure cvEqualizeHist; external CV_DLL name 'cvEqualizeHist';
procedure cvResize; external CV_DLL name 'cvResize';
function cvCreateStructuringElementEx; external CV_DLL name 'cvCreateStructuringElementEx';
procedure cvErode; external CV_DLL name 'cvErode';
procedure cvDilate; external CV_DLL name 'cvDilate';
procedure cvReleaseStructuringElement; external CV_DLL name 'cvReleaseStructuringElement';
procedure cvFilter2D; external CV_DLL name 'cvFilter2D';
procedure cvCanny; external CV_DLL name 'cvCanny';
procedure cvPyrDown; external CV_DLL name 'cvPyrDown';

end.