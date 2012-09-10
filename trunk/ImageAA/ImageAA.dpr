program ImageAA;

{$APPTYPE CONSOLE}

uses
  SysUtils, cv, highgui, cxtypes, cxcore;

var
  image, dst: PIplImage;
  filename: PAnsiChar;

begin
  try
    // ��� �������� ������� ������ ����������
    if ParamCount > 0 then
      filename := PAnsiChar(AnsiString(ParamStr(1)))
    else
      filename := 'image0.jpg';

    // �������� ��������
    image := cvLoadImage(filename, 1);
    // ��������� ��������
    dst := cvCloneImage(image);

    // ���� ��� ����������� ��������
    cvNamedWindow(PAnsiChar('original'), CV_WINDOW_AUTOSIZE);
    cvNamedWindow(PAnsiChar('smooth'), CV_WINDOW_AUTOSIZE);

    // ���������� �������� ��������
    cvSmooth(image, dst, CV_GAUSSIAN, 3, 3);

    cvShowImage(PAnsiChar('original'), image);
    cvShowImage(PAnsiChar('smooth'), dst);

     // ��� ������� �������
     cvWaitKey(0);

     // ����������� �������
     cvReleaseImage(@image);
     cvReleaseImage(@dst);
     // ������� ����
     cvDestroyWindow(PAnsiChar('original'));
     cvDestroyWindow(PAnsiChar('smooth'));

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
