unit highgui;

interface

uses
  cxtypes;

const
  HighGUI_DLL = 'highgui210.dll';

  CV_WINDOW_AUTOSIZE = 1;
  CV_LOAD_IMAGE_COLOR = 1;

  CV_EVENT_MOUSEMOVE = 0;
  CV_EVENT_LBUTTONDOWN = 1;
  CV_EVENT_RBUTTONDOWN = 2;
  CV_EVENT_MBUTTONDOWN = 3;
  CV_EVENT_LBUTTONUP = 4;
  CV_EVENT_RBUTTONUP = 5;
  CV_EVENT_MBUTTONUP = 6;
  CV_EVENT_LBUTTONDBLCLK = 7;
  CV_EVENT_RBUTTONDBLCLK = 8;
  CV_EVENT_MBUTTONDBLCLK = 9;

type
  CvCapture = record
  end;
  PCvCapture = ^CvCapture;
  P2PCvCapture = ^PCvCapture;

  TCvMouseCallback = procedure (event: Integer; x, y, flags: Integer; param: pointer); cdecl;

{ start capturing frames from camera: index = camera_index + domain_offset (CV_CAP_*) }
function cvCreateCameraCapture(index: Longint): PCvCapture; cdecl;

{ stop capturing/reading and free resources }
procedure cvReleaseCapture(capture: P2PCvCapture); cdecl;

{ Just a combination of cvGrabFrame and cvRetrieveFrame
 !!!DO NOT RELEASE or MODIFY the retrieved frame!!!      }
function cvQueryFrame(capture: PCvCapture): PIplImage; cdecl;

{ create window }
function cvNamedWindow(const name: PAnsiChar; flags: Integer = CV_WINDOW_AUTOSIZE): Integer; cdecl;

{ display image within window (highgui windows remember their content) }
procedure cvShowImage(const name: PAnsiChar; const image: PCvArr); cdecl;

{ wait for key event infinitely (delay<=0) or for "delay" milliseconds }
function cvWaitKey(delay: Integer = 0): Integer; cdecl;

{ destroy window and all the trackers associated with it }
procedure cvDestroyWindow(const name: PAnsiChar); cdecl;

{ load image from file
  iscolor can be a combination of above flags where CV_LOAD_IMAGE_UNCHANGED
  overrides the other flags
  using CV_LOAD_IMAGE_ANYCOLOR alone is equivalent to CV_LOAD_IMAGE_UNCHANGED
  unless CV_LOAD_IMAGE_ANYDEPTH is specified images are converted to 8bit }
function cvLoadImage(const filename: PAnsiChar; iscolor: Integer = CV_LOAD_IMAGE_COLOR): PIplImage; cdecl;

{ start capturing frames from video file }
function cvCreateFileCapture(const filename: PAnsiChar): PCvCapture; cdecl;

{ assign callback for mouse events }
procedure cvSetMouseCallback(const window_name: PAnsiChar; on_mouse: TCvMouseCallback;
                             param: pointer = nil); cdecl;

implementation

function cvCreateCameraCapture; external HighGUI_DLL name 'cvCreateCameraCapture';
procedure cvReleaseCapture; external HighGUI_DLL name 'cvReleaseCapture';
function cvQueryFrame; external HighGUI_DLL name 'cvQueryFrame';
function cvNamedWindow; external HighGUI_DLL name 'cvNamedWindow';
procedure cvShowImage; external HighGUI_DLL name 'cvShowImage';
function cvWaitKey; external HighGUI_DLL name 'cvWaitKey';
procedure cvDestroyWindow; external HighGUI_DLL name 'cvDestroyWindow';
function cvLoadImage; external HighGUI_DLL name 'cvLoadImage';
function cvCreateFileCapture; external HighGUI_DLL name 'cvCreateFileCapture';
procedure cvSetMouseCallback; external HighGUI_DLL name 'cvSetMouseCallback';

end.
