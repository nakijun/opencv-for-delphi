program ResizeImage;

{$APPTYPE CONSOLE}

uses
  SysUtils, cv, highgui, cxtypes, cxcore;

var
  image: PIplImage;
  dst: array [0..3] of PIplImage;
  filename: PAnsiChar;
  i: Integer;

begin
  try
    if ParamCount > 0 then
      filename := PAnsiChar(AnsiString(ParamStr(1)))
    else
      filename := 'image0.jpg';

    image := cvLoadImage(filename, 1);

    if Assigned(image) then
    begin
      for i := 0 to 3 do
      begin
        dst[i] := cvCreateImage( cvSize(image.width div 3, image.height div 3), image.depth, image.nChannels );
        cvResize(image, dst[i], i);
      end;

      // ���� ��� ����������� ��������
      cvNamedWindow(PAnsiChar('original'), CV_WINDOW_AUTOSIZE);
      cvShowImage(PAnsiChar('original'), image);

      // ���������� ���������
      for i := 0 to 3 do
      begin
        cvNamedWindow(PAnsiChar(AnsiString(IntToStr(i))), CV_WINDOW_AUTOSIZE);
        cvShowImage(PAnsiChar(AnsiString(IntToStr(i))), dst[i]);
      end;

      // ��� ������� �������
      cvWaitKey(0);

      // ����������� �������
      cvReleaseImage(@image);

      // ������� ����
      cvDestroyAllWindows();
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
