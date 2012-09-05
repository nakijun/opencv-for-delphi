unit highgui;

interface

uses
  cxtypes;

const
  HighGUI_DLL = 'highgui210.dll';

  CV_WINDOW_AUTOSIZE = 1;

type
  CvCapture = record
  end;
  PCvCapture = ^CvCapture;
  P2PCvCapture = ^PCvCapture;

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
function cvWaitKey(delay: Integer = 0): Integer;

{ destroy window and all the trackers associated with it }
procedure cvDestroyWindow(const name: PAnsiChar);

implementation

function cvCreateCameraCapture; external HighGUI_DLL name 'cvCreateCameraCapture';
procedure cvReleaseCapture; external HighGUI_DLL name 'cvReleaseCapture';
function cvQueryFrame; external HighGUI_DLL name 'cvQueryFrame';
function cvNamedWindow; external HighGUI_DLL name 'cvNamedWindow';
procedure cvShowImage; external HighGUI_DLL name 'cvShowImage';
function cvWaitKey; external HighGUI_DLL name 'cvWaitKey';
procedure cvDestroyWindow; external HighGUI_DLL name 'cvDestroyWindow';

end.
