unit cxtypes;

interface

const
  IPL_DEPTH_SIGN = $80000000;

  IPL_DEPTH_1U = 1;
  IPL_DEPTH_8U = 8;
  IPL_DEPTH_16U = 16;
  IPL_DEPTH_32F = 32;

  IPL_DEPTH_8S = IPL_DEPTH_SIGN or 8;
  IPL_DEPTH_16S = IPL_DEPTH_SIGN or 16;
  IPL_DEPTH_32S = IPL_DEPTH_SIGN or 32;

type
  PIplROI = ^TIplROI;
  TIplROI = record
    Coi     : Integer;
    XOffset : Integer;
    YOffset : Integer;
    Width   : Integer;
    Height  : Integer;
  end;

  PIplTileInfo = ^IplTileInfo;
  IplTileInfo = record
  end;

  PIplImage = ^TIplImage;
  P2PIplImage = ^PIplImage;
  TIplImage = record
    NSize           : Integer;                      // sizeof(IplImage)
    ID              : Integer;                      // version (=0)
    NChannels       : Integer;                      // Most of OpenCV functions support 1,2,3 or 4 channels
    AlphaChannel    : Integer;                      // Ignored by OpenCV
    Depth           : Integer;                      // Pixel depth in bits: IPL_DEPTH_8U, IPL_DEPTH_8S, IPL_DEPTH_16S, IPL_DEPTH_32S, IPL_DEPTH_32F and IPL_DEPTH_64F are supported.
    ColorModel      : array [0..3] of AnsiChar;     // Ignored by OpenCV
    ChannelSeq      : array [0..3] of AnsiChar;     // ditto
    DataOrder       : Integer;                      // 0 - interleaved color channels, 1 - separate color channels. cvCreateImage can only create interleaved images
    Origin          : Integer;                      // 0 - top-left origin, 1 - bottom-left origin (Windows bitmaps style).
    Align           : Integer;                      // Alignment of image rows (4 or 8). OpenCV ignores it and uses widthStep instead.
    Width           : Integer;                      // Image width in pixels.
    Height          : Integer;                      // Image height in pixels.
    Roi             : PIplROI;                      // Image ROI. If NULL, the whole image is selected.
    MaskROI         : PIplImage;                    // Must be NULL.
    ImageId         : Pointer;
    TileInfo        : PIplTileInfo;
    ImageSize       : Integer;                      // Image data size in bytes (==image->height*image->widthStep in case of interleaved data)
    ImageData       : PByte;                        // Pointer to aligned image data.
    WidthStep       : Integer;                      // Size of aligned image row in bytes.
    BorderMode      : array [0..3] of Integer;      // Ignored by OpenCV.
    BorderConst     : array [0..3] of Integer;      // Ditto.
    ImageDataOrigin : PByte;                        // Pointer to very origin of image data (not necessarily aligned) - needed for correct deallocation
  end;

  TCvSize = record
    width: Integer;
    height: Integer;
  end;

  PCvArr = Pointer;
  P2PCvArr = ^PCvArr;

  TCvPoint = record
    x: Integer;
    y: Integer;
  end;

  TCvScalar = record
    val: array [0..3] of Double;
  end;

function cvPoint(x, y: Integer): TCvPoint;
function cvSize(width, height: Integer): TCvSize;
function cvScalar(val0: Double; val1: Double = 0; val2: Double = 0; val3: Double = 0): TCvScalar;

implementation

function cvPoint(x, y: Integer): TCvPoint;
begin
  Result.x := x;
  Result.y := y;
end;

function cvSize(width, height: Integer): TCvSize;
begin
  Result.width := width;
  Result.height := height;
end;

function cvScalar(val0: Double; val1: Double = 0; val2: Double = 0; val3: Double = 0): TCvScalar;
begin
  Result.val[0] := val0;
  Result.val[1] := val1;
  Result.val[2] := val2;
  Result.val[3] := val3;
end;

end.
