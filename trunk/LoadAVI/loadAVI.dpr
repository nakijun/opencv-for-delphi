program loadAVI;

{$APPTYPE CONSOLE}

uses
  SysUtils, cv, highgui, cxtypes, cxcore;

var
  frame: PIplImage;
  filename: PAnsiChar;
  capture: PCvCapture;
  c: Integer;

begin
  try
    if ParamCount > 0 then
      filename := PAnsiChar(AnsiString(ParamStr(1)))
    else
      filename := 'test.avi';

    cvNamedWindow(PAnsiChar('original'), CV_WINDOW_AUTOSIZE);
    capture := cvCreateFileCapture(filename);

    while True do
    begin
      frame := cvQueryFrame(capture);

      if not Assigned(frame) then
        break;

      cvShowImage(PAnsiChar('original'), frame);

      c := cvWaitKey(33);
      if (c = 27) then
        break;
    end;

    cvReleaseCapture(@capture);
    cvDestroyWindow(PAnsiChar('original'));

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
