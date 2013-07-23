unit cvtypes;

interface

const
  CV_GAUSSIAN_5x5 = 7;

type
  { spatial and central moments }
  TCvMoments = record
    m00, m10, m01, m20, m11, m02, m30, m21, m12, m03: Double;   { spatial moments }
    mu20, mu11, mu02, mu30, mu21, mu12, mu03: Double;           { central moments }
    inv_sqrt_m00: Double;                                       { m00 != 0 ? 1/sqrt(m00) : 0 }
  end;
  PCvMoments = ^TCvMoments;

  { Hu invariants }
  TCvHuMoments = record
    hu1, hu2, hu3, hu4, hu5, hu6, hu7: Double;                  { Hu invariants }
  end;
  PCvHuMoments = ^TCvHuMoments;

  TCvDistanceFunction = function (const a: PSingle; const b: PSingle; user_param: Pointer): Single; cdecl;

implementation

end.
