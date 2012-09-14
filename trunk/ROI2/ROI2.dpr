program ROI2;

{$APPTYPE CONSOLE}

uses
  SysUtils, cv, highgui, cxtypes, cxcore;

var
  image, src: PIplImage;
  filename, filename2: PAnsiChar;
  x, y: Integer;
  width, height: Integer;

begin
  try
    if ParamCount > 0 then
      filename := PAnsiChar(AnsiString(ParamStr(1)))
    else
      filename := 'image0.jpg';

    // �������� ��������
    image := cvLoadImage(filename, 1);

    cvNamedWindow(PAnsiChar('origianl'), CV_WINDOW_AUTOSIZE);
    cvNamedWindow(PAnsiChar('ROI'), CV_WINDOW_AUTOSIZE);

    if ParamCount > 1 then
      x := StrToInt(ParamStr(2))
    else
      x := 120;

    if ParamCount > 2 then
      y := StrToInt(ParamStr(3))
    else
      y := 50;

    if ParamCount > 3 then
      filename2 := PAnsiChar(AnsiString(ParamStr(4)))
    else
      filename2 := 'eye.jpg';

    src := cvLoadImage(filename2, 1);

    width := src.Width;
    height := src.Height;

    cvShowImage(PAnsiChar('origianl'), image);
    // ������������� ROI
    cvSetImageROI(image, cvRect(x, y, width, height));

    // ������� �����������
    cvSetZero(image);

    // �������� �����������
    cvCopy(src, image, nil);

    // ���������� ROI
    cvResetImageROI(image);
    // ���������� �����������
    cvShowImage(PAnsiChar('ROI'), image);

    // ��� ������� �������
    cvWaitKey(0);

    // ����������� �������
    cvReleaseImage(@image);
    cvReleaseImage(@src);
    cvDestroyAllWindows();

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
