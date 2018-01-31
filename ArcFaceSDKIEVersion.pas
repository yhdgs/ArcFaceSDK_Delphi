(* ******************************************************
  * ��������ʶ��SDK��װ ImageEN ��
  * ��Ȩ���� (C) 2017 NJTZ  eMail:yhdgs@qq.com
  ****************************************************** *)

unit ArcFaceSDKIEVersion;

interface

uses Windows, Messages, SysUtils, System.Classes, amcomdef, ammemDef,
  arcsoft_fsdk_face_detection,
  arcsoft_fsdk_face_recognition,
  arcsoft_fsdk_face_tracking, asvloffscreendef, merrorDef,
  arcsoft_fsdk_age_estimation, arcsoft_fsdk_gender_estimation,
  Vcl.Graphics, Vcl.Imaging.jpeg, System.Generics.Collections, ArcFaceSDK,
  hyieutils, hyiedefs, imageenio, imageenproc, imageenview, System.Math;

type

  TResampleOptions = record
    NewWidth: Integer;
    NewHeight: Integer;
    Filter: TResampleFilter;
  end;

  TArcFaceSDKIEVersion = class(TArcFaceSDK)
  private
    FContrastRatio: Double;
    FResampleFilter: TResampleFilter;
    FResampleHeight: Integer;
    FResampleWidth: Integer;
    FImgDataInfoCache: TImgdataInfo;
  public
    constructor Create;
    destructor Destroy; override;
    class function CropFace(ASouceIEBitmap, ADestBitmap: TIEBitmap; AFaceRegion:
      AFR_FSDK_FACEINPUT; AExtendRatio, AResampleWidth, AResampleHeight: Integer;
      AResampleFilter: TResampleFilter): Boolean;
    function DetectAndRecognitionFacesFromIEBitmap(ABitmap: TIEBitmap; var
      AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels;
      AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer;
      AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean):
      Boolean; overload;
    function DetectAndRecognitionFacesFromIEBitmap(ABitmap: TIEBitmap; var
      AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels;
      AOutIEBitmp: TIEBitmap; AUseCache: Boolean): Boolean; overload;
    function DetectAndRecognitionFacesFromBitmapEX(ABitmap: TBitmap; var
      AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels;
      AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer;
      AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean):
      Boolean; overload;
    function DetectFacesAndAgeGenderFromBitmapEX(ABitmap: TBitmap;
      var AFaceInfos:
      TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AResampleWidth,
      AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast:
      Double; AUseCache: Boolean): Boolean; overload;
    function DetectAndRecognitionFacesFromFileEx(AFileName: string; var
      AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels;
      AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer;
      AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean):
      Boolean; overload;
    function DRAGfromIEBitmap(ABitmap: TIEBitmap; var AFaceInfos:
      TList<TFaceBaseInfo>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap;
      AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
      AContrast: Double; AUseCache: Boolean): Boolean; overload;
    function DetectFacesAndAgeGenderFromIEBitmap(ABitmap: TIEBitmap; var
      AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AUseCache:
      Boolean): Boolean; overload;
    function DetectFacesAndAgeGenderFromFileEx(AFileName: string; var AFaceInfos:
      TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AResampleWidth,
      AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast:
      Double; AUseCache: Boolean): Boolean; overload;
    function DetectFacesFromIEBitmap(ABitmap: TIEBitmap; var AFaceRegions:
      TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap; AResampleWidth,
      AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast:
      Double; AUseCache: Boolean): Boolean; overload;
    function DetectFacesFromFile(AFile: string; var AFaceRegions:
      TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap; AResampleWidth,
      AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast:
      Double; AUseCache: Boolean): Boolean; overload;
    function DetectFacesFromFile(AFile: string; var AFaceRegions:
      TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap; AUseCache: Boolean):
      Boolean; overload;
    function DetectFacesFromIEBitmap(ABitmap: TIEBitmap; var AFaceRegions:
      TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap; AUseCache: Boolean):
      Boolean; overload;
    class procedure DrawFaceRectAgeGender(AView: TImageEnView; AFaceIdx: Integer;
      AFaceInfo: TFaceBaseInfo; AColor: TColor = clBlue; AWidth: Integer = 2;
      ADrawIndex: Boolean = true; ATextSize: Integer = 0);
    class procedure DrawFaceRect(AView: TImageEnView; AFaceIdx: Integer;
      AFaceInfo:
      AFR_FSDK_FACEINPUT; AColor: TColor = clBlue; AWidth: Integer = 2;
      ADrawIndex: Boolean = true; ATextSize: Integer = 0);
    function ExtractFaceFeatureFromIEBitmap(AIEBitmap: TIEBitmap; AFaceRegion:
      AFR_FSDK_FACEINPUT; var AFaceModel: AFR_FSDK_FACEMODEL; AOutIEBitmp:
      TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter:
      TResampleFilter; AUseCache: Boolean): Boolean;
    function MatchFaceWithIEBitmaps(AInBitmap1, AInBitmap2, AOutIEBitmp1,
      AOutIEBitmp2: TIEBitmap; AResampleWidth, AResampleHeight: Integer;
      AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean):
      Single; overload;
    function MatchFaceWithIEBitmaps(AInBitmap1, AInBitmap2, AOutIEBitmp1,
      AOutIEBitmp2: TIEBitmap; AContrast: Double; AUseCache: Boolean): Single;
      overload;
    function TrackFacesFromIEBitmap(ABitmap: TIEBitmap; var AFaceRegions:
      TList<AFR_FSDK_FACEINPUT>; AUseCache: Boolean): Boolean;
    class function ReadFromFile(AFileName: string; var AImgData: TImgdataInfo;
      AOutIEBitmp: TIEBitmap; AResampleWidth: Integer = 0; AResampleHeight:
      Integer = 0; AResampleFilter: TResampleFilter = rfNone; AContrast: Double =
      0): Boolean;
    class function ReadIEBitmap(ABitmap: TIEBitmap;
      var AImgDataInfo: TImgdataInfo;
      AOutIEBitmp: TIEBitmap; AResampleWidth: Integer = 0; AResampleHeight:
      Integer = 0; AResampleFilter: TResampleFilter = rfNone; AContrast: Double =
      0): Boolean; overload;
    function TrackFacesAndAgeGenderFromIEBitmap(ABitmap: TIEBitmap;
      var AFaceInfos:
      TList<TFaceBaseInfo>; AUseCache: Boolean): Boolean;
    function DetectFacesAndAgeGenderFromIEBitmap(ABitmap: TIEBitmap; var
      AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AResampleWidth,
      AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast:
      Double; AUseCache: Boolean): Boolean; overload;
    function DRAGfromIEBitmap(ABitmap: TIEBitmap; var AFaceInfos:
      TList<TFaceBaseInfo>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap;
      AUseCache: Boolean): Boolean; overload;
    function DRAGfromFile(AFileName: string;
      var AFaceInfos: TList<TFaceBaseInfo>;
      var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AUseCache: Boolean):
      Boolean; overload;
    function DRAGfromFile(AFileName: string;
      var AFaceInfos: TList<TFaceBaseInfo>;
      var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth,
      AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast:
      Double; AUseCache: Boolean): Boolean; overload;
  published
    property ContrastRatio: Double read FContrastRatio write FContrastRatio;
    property ResampleFilter: TResampleFilter read FResampleFilter write
      FResampleFilter;
    property ResampleHeight: Integer read FResampleHeight write FResampleHeight;
    property ResampleWidth: Integer read FResampleWidth write FResampleWidth;
  end;

implementation

constructor TArcFaceSDKIEVersion.Create;
begin
  inherited;
  FResampleFilter := rfLanczos3;
  FResampleWidth := 0;
  FResampleHeight := 0;
  FContrastRatio := 0;
  FImgDataInfoCache.pImgData := nil;
end;

destructor TArcFaceSDKIEVersion.Destroy;
begin
  if FImgDataInfoCache.pImgData <> nil then
    FreeMem(FImgDataInfoCache.pImgData);
  inherited;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.CropFace
  ����:      ������������Ϣ�ü����������ļ�
  ����:      DelphiDX10
  ����:      2017.09.26
  ����:
  ASouceIEBitmap, //ԴBMP
  ADestBitmap: TIEBitmap;//Ŀ��BMP
  AFaceRegion: AFR_FSDK_FACEINPUT;//��������
  AExtendRatio, //��չ���ʣ���СΪ0��ʵ��Ӧ���ٳ���100
  AResampleWidth, //Ŀ��ͼ�����,0��ʾ�������߶ȱ䶯
  AResampleHeight: Integer; //Ŀ��ͼ��߶�,0��ʾ���������ȱ䶯
  AResampleFilter: TResampleFilter//�����˾�
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
class function TArcFaceSDKIEVersion.CropFace(ASouceIEBitmap, ADestBitmap:
  TIEBitmap; AFaceRegion: AFR_FSDK_FACEINPUT; AExtendRatio, AResampleWidth,
  AResampleHeight: Integer; AResampleFilter: TResampleFilter): Boolean;
var
  iLeft, iTop, iRight, iBottom, iWidthExtend, iHeightExtend, iTmp: Integer;
  fHvsW: Double;
  iWidth, iHeight: Integer;
begin
  Result := False;
  if ASouceIEBitmap = nil then
    Exit;

  //ͼ��߿��ȣ�������Ÿ߿�������һΪ0��ʾά�ֱ��ʲ���
  if (AResampleWidth <= 0) or (AResampleHeight <= 0) then
    fHvsW := 0
  else
    fHvsW := AResampleHeight / AResampleWidth;

  //ͼ�����������������ɢ������
  iWidthExtend := Round((AFaceRegion.rcFace.right - AFaceRegion.rcFace.left) *
    (AExtendRatio / 100));
  iHeightExtend :=
    Round((AFaceRegion.rcFace.bottom - AFaceRegion.rcFace.top) *
    (AExtendRatio / 100));

  //��������չ
  iLeft := AFaceRegion.rcFace.left - iWidthExtend;
  iRight := AFaceRegion.rcFace.right + iWidthExtend;
  iTop := AFaceRegion.rcFace.top - iHeightExtend;
  iBottom := AFaceRegion.rcFace.bottom + iHeightExtend;

  //��ʱ����
  iWidth := Abs(iRight - iLeft);
  iHeight := Abs(iBottom - iTop);

  //��� ��/�� > 1������ȱ��ֲ��䣬�ٴ���չ�߶�
  if fHvsW > 1 then
  begin
    iTmp := (Max(Round(iWidth * fHvsW), iHeight) - iHeight) div 2;
    //���¶�Ϊ������
    iTop := iTop - iTmp;
    iBottom := iBottom + iTmp;
  end
  //��� 0 < ��/�� <= 1����߶ȱ��ֲ��䣬�ٴ���չ����
  else if fHvsW > 0 then
  begin
    iTmp := (Max(Round(iHeight / fHvsW), iWidth) - iWidth) div 2;
    iLeft := iLeft - iTmp;
    iRight := iRight + iTmp;
  end;

  //�����С��0���ҵ״���ԭʼͼ��߶�
  if (iTop < 0) and (iBottom > ASouceIEBitmap.Height) then
  begin
    //����0
    iTop := 0;
    //����ԭʼͼ��߶�
    iBottom := ASouceIEBitmap.Height;
  end
  //����С��0
  else if iTop < 0 then
  begin
    //��չ��
    iBottom := Min(iBottom - iTop, ASouceIEBitmap.Height);
    iTop := 0;
  end
  //���״���ԭʼͼ��߶�
  else if iBottom > ASouceIEBitmap.Height then
  begin
    //��չ��
    iTop := Max(iTop - (iBottom - ASouceIEBitmap.Height), 0);
    iBottom := ASouceIEBitmap.Height;
  end;

  //������С��0�����ұߴ���ԭʼͼ�����
  if (iLeft < 0) and (iRight > ASouceIEBitmap.Width) then
  begin
    iLeft := 0;
    iRight := ASouceIEBitmap.Width;
  end
  //�����С��0
  else if iLeft < 0 then
  begin
    iRight := Min(iRight - iLeft, ASouceIEBitmap.Width);
    iLeft := 0;
  end
  //���ұߴ���ԭʼͼ�����
  else if iRight > ASouceIEBitmap.Width then
  begin
    iLeft := Max(iLeft - (iRight - ASouceIEBitmap.Width), 0);
    iRight := ASouceIEBitmap.Width;
  end;

  if ADestBitmap = nil then
    ADestBitmap := TIEBitmap.Create;

  //����Ŀ��ͼ�����
  ADestBitmap.Width := Abs(iRight - iLeft);
  ADestBitmap.Height := Abs(iBottom - iTop);

  //����ͼ��
  ASouceIEBitmap.CopyRectTo(ADestBitmap, iLeft, iTop, 0, 0, Abs(iRight - iLeft),
    Abs(iBottom - iTop));

  //

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromIEBitmap
  ����:      ��IEBitmap�л�ȡ����λ�ú�������Ϣ�б�
  ����:      Bird
  ����:      2017.09.25
  ����:      ABitmap: TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromIEBitmap(ABitmap:
  TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels:
  TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight:
  Integer; AResampleFilter: TResampleFilter; AContrast: Double; AUseCache:
  Boolean): Boolean;
var
  lImgData: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFD_FSDK_FACERES;
  nRet: MRESULT;
{$IFDEF DEBUG}
  T: Cardinal;
{$ENDIF}
begin
  Result := False;

  if FFaceDetectionEngine = nil then
    Exit;

  if AFaceRegions = nil then
    AFaceRegions := TList<AFR_FSDK_FACEINPUT>.Create;

  //ʹ�û���
  if AUseCache then
    lImgData := FImgDataInfoCache
  else
    lImgData.pImgData := nil;

{$IFDEF DEBUG}
  T := GetTickCount;
{$ENDIF}
  if not ReadIEBitmap(ABitmap, lImgData, AOutIEBitmp, AResampleWidth,
    AResampleHeight, AResampleFilter, AContrast) then
    Exit;
{$IFDEF DEBUG}
  T := GetTickCount - T;
  DoLog('�������ݺ�ʱ��' + IntToStr(T));
{$ENDIF}
  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgData.Width;
  offInput.i32Height := lImgData.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgData.pImgData);
  offInput.pi32Pitch[0] := lImgData.LineBytes;
  //�������
{$IFDEF DEBUG}
  T := GetTickCount;
{$ENDIF}
  nRet := AFD_FSDK_StillImageFaceDetection(FFaceDetectionEngine, @offInput,
    pFaceRes);
{$IFDEF DEBUG}
  T := GetTickCount - T;
  DoLog('���������ʱ��' + IntToStr(T));
{$ENDIF}
  if nRet = MOK then
  begin
    ExtractFaceBoxs(pFaceRes^, AFaceRegions);

    if AFaceModels = nil then
      AFaceModels := TFaceModels.Create;
{$IFDEF DEBUG}
    T := GetTickCount;
{$ENDIF}
    Result := ExtractFaceFeatures(offInput, AFaceRegions, AFaceModels);
{$IFDEF DEBUG}
    T := GetTickCount - T;
    DoLog('��ȡ������ʱ��' + IntToStr(T));
{$ENDIF}
  end;

  if not AUseCache then
  begin
    if lImgData.pImgData <> nil then
      FreeMem(lImgData.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgData;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromIEBitmap
  ����:      ��IEBitmap�л�ȡ����λ�ú�������Ϣ�б������Ų���ʹ�ñ�����ʵ�������Ų�������
  ����:      Bird
  ����:      2017.09.25
  ����:      ABitmap: TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap = nil
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromIEBitmap(ABitmap:
  TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels:
  TFaceModels; AOutIEBitmp: TIEBitmap; AUseCache: Boolean): Boolean;
begin
  Result := DetectAndRecognitionFacesFromIEBitmap(ABitmap, AFaceRegions,
    AFaceModels, AOutIEBitmp, FResampleWidth, FResampleHeight, FResampleFilter,
    FContrastRatio, AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromBitmapEX
  ����:      �ӱ�׼Bitmap��ȡ����λ�ú�������Ϣ�б�
  ����:      Bird
  ����:      2017.09.25
  ����:      ABitmap: TBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromBitmapEX(ABitmap:
  TBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels:
  TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight:
  Integer; AResampleFilter: TResampleFilter; AContrast: Double; AUseCache:
  Boolean): Boolean;
var
  lIEBitmap: TIEBitmap;
begin
  lIEBitmap := TIEBitmap.Create;
  try
    lIEBitmap.Assign(ABitmap);
    Result := DetectAndRecognitionFacesFromIEBitmap(lIEBitmap, AFaceRegions,
      AFaceModels, AOutIEBitmp, AResampleWidth, AResampleHeight,
      AResampleFilter, AContrast, AUseCache);
  finally
    lIEBitmap.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromBitmapEX
  ����:      �ӱ�׼λͼ�л�ȡ����λ�á��Ա��������Ϣ�б�
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      ABitmap: TBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromBitmapEX(ABitmap:
  TBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap;
  AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
  AContrast: Double; AUseCache: Boolean): Boolean;
var
  lIEBitmap: TIEBitmap;
begin
  lIEBitmap := TIEBitmap.Create;
  try
    lIEBitmap.Assign(ABitmap);
    Result := DetectFacesAndAgeGenderFromIEBitmap(lIEBitmap, AFaceInfos,
      AOutIEBitmp, AResampleWidth, AResampleHeight, AResampleFilter, AContrast,
      AUseCache);
  finally
    lIEBitmap.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromFileEx
  ����:      ��ͼ���ļ��м������λ����Ϣ�б�����ȡ���м�⵽������������Ϣ
  ����:      Bird
  ����:      2017.11.19
  ����:      AFileName: string; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectAndRecognitionFacesFromFileEx(AFileName:
  string; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels:
  TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight:
  Integer; AResampleFilter: TResampleFilter; AContrast: Double; AUseCache:
  Boolean): Boolean;
var
  lIEBitmap: TIEBitmap;
  io: TImageEnIO;
begin
  Result := False;
  if not FileExists(AFileName) then
    Exit;

  lIEBitmap := TIEBitmap.Create;
  io := TImageEnIO.Create(nil);
  try
    io.AttachedIEBitmap := lIEBitmap;
    io.LoadFromFile(AFileName);
    Result := DetectAndRecognitionFacesFromIEBitmap(lIEBitmap, AFaceRegions,
      AFaceModels, AOutIEBitmp, AResampleWidth, AResampleHeight,
      AResampleFilter, AContrast, AUseCache);
  finally
    lIEBitmap.Free;
    io.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DRAGfromIEBitmap
  ����:      ��IEBitmap�л�ȡ����λ�á����䡢�Ա��������Ϣ�б�
  ����:      Bird
  ����:      2017.09.25
  ����:      ABitmap: TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DRAGfromIEBitmap(ABitmap: TIEBitmap; var
  AFaceInfos: TList<TFaceBaseInfo>; var AFaceModels: TFaceModels;
  AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer;
  AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean):
  Boolean;
var
  lImgData: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFD_FSDK_FACERES;
  lFaceRes_Age: ASAE_FSDK_AGEFACEINPUT;
  lFaceRes_Gender: ASGE_FSDK_GENDERFACEINPUT;
  nRet: MRESULT;
  lFaceRegions: TList<AFR_FSDK_FACEINPUT>;
  lAgeRes: ASAE_FSDK_AGERESULT;
  lGenderRes: ASGE_FSDK_GENDERRESULT;
  lAges: TArray<Integer>;
  lGenders: TArray<Integer>;
  lFaceInfo: TFaceBaseInfo;
  i, iFaces: Integer;
  ArrFaceOrient: array of AFD_FSDK_OrientCode;
  ArrFaceRect: array of MRECT;
{$IFDEF DEBUG}
  T: Cardinal;
{$ENDIF}
begin
  Result := False;

  if AFaceInfos = nil then
    AFaceInfos := TList<TFaceBaseInfo>.Create;
  if AFaceModels = nil then
    AFaceModels := TFaceModels.Create;

  if FFaceDetectionEngine = nil then
    Exit;

  //ʹ�û���
  if AUseCache then
    lImgData := FImgDataInfoCache
  else
    lImgData.pImgData := nil;

{$IFDEF DEBUG}
  T := GetTickCount;
{$ENDIF}
  if not ReadIEBitmap(ABitmap, lImgData, AOutIEBitmp, AResampleWidth,
    AResampleHeight, AResampleFilter, AContrast) then
    Exit;
{$IFDEF DEBUG}
  T := GetTickCount - T;
  DoLog('�������ݺ�ʱ��' + IntToStr(T));
{$ENDIF}
  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgData.Width;
  offInput.i32Height := lImgData.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgData.pImgData);
  offInput.pi32Pitch[0] := lImgData.LineBytes;
  //�������
{$IFDEF DEBUG}
  T := GetTickCount;
{$ENDIF}
  nRet := AFD_FSDK_StillImageFaceDetection(FFaceDetectionEngine, @offInput,
    pFaceRes);
{$IFDEF DEBUG}
  DoLog('���������ʱ��' + IntToStr(GetTickCount - T));
{$ENDIF}
  if nRet = MOK then
  begin

    Result := true;

    lFaceRegions := TList<AFR_FSDK_FACEINPUT>.Create;
    try

      ExtractFaceBoxs(pFaceRes^, lFaceRegions);

      if lFaceRegions.Count > 0 then
      begin

        iFaces := lFaceRegions.Count;
        SetLength(ArrFaceOrient, iFaces);
        SetLength(ArrFaceRect, iFaces);
        for i := 0 to iFaces - 1 do
        begin
          ArrFaceOrient[i] := lFaceRegions.Items[i].lOrient;
          ArrFaceRect[i] := lFaceRegions.Items[i].rcFace;
        end;
        //===================================================
        //�������
        //===================================================
        if (FFaceAgeEngine <> nil) then
        begin
          with lFaceRes_Age do
          begin
            pFaceRectArray := @ArrFaceRect[0];
            pFaceOrientArray := @ArrFaceOrient[0];
            lFaceNumber := iFaces;
          end;

{$IFDEF DEBUG}
          T := GetTickCount;
{$ENDIF}
          if ASAE_FSDK_AgeEstimation_StaticImage(
            FFaceAgeEngine, //[in] age estimation engine
            @offInput, //[in] the original image information
            //[in] the face rectangles information
            @lFaceRes_Age,
            //[out] the results of age estimation
            lAgeRes
            ) = MOK then
            //�ֽ���������
            ExtractFaceAges(lAgeRes, lAges)
          else
            Result := False;
{$IFDEF DEBUG}
          DoLog('��������ʱ��' + IntToStr(GetTickCount - T));
{$ENDIF}
        end
        else
          Result := False;

        //===================================================
        //����Ա�
        //===================================================
        if (FFaceGenderEngine <> nil) then
        begin
          with lFaceRes_Gender do
          begin
            pFaceRectArray := @ArrFaceRect[0];
            pFaceOrientArray := @ArrFaceOrient[0];
            lFaceNumber := iFaces;
          end;

{$IFDEF DEBUG}
          T := GetTickCount;
{$ENDIF}
          if ASGE_FSDK_GenderEstimation_StaticImage(
            FFaceGenderEngine, //[in] Gender estimation engine
            @offInput, //[in] the original imGender information
            //[in] the face rectangles information
            @lFaceRes_Gender,
            //[out] the results of Gender estimation
            lGenderRes
            ) = MOK then
            //�ֽ������Ա�
            ExtractFaceGenders(lGenderRes, lGenders)
          else
            Result := False;
{$IFDEF DEBUG}
          DoLog('����Ա��ʱ��' + IntToStr(GetTickCount - T));
{$ENDIF}
        end
        else
          Result := False;

        for i := 0 to iFaces - 1 do
        begin
          lFaceInfo.Init;
          lFaceInfo.FaceRect := ArrFaceRect[i];
          lFaceInfo.FaceOrient := ArrFaceOrient[i];
          if i < Length(lAges) then
            lFaceInfo.Age := lAges[i];
          if i < Length(lGenders) then
            lFaceInfo.Gender := lGenders[i];
          AFaceInfos.Add(lFaceInfo);
        end;


        //===================================================
        //��ȡ����
        //===================================================

{$IFDEF DEBUG}
        T := GetTickCount;
{$ENDIF}
        if not ExtractFaceFeatures(offInput, lFaceRegions, AFaceModels) then
          Result := False;
{$IFDEF DEBUG}
        DoLog('��ȡ������ʱ��' + IntToStr(GetTickCount - T));
{$ENDIF}
      end;

    finally
      lFaceRegions.Free;
    end;
  end;

  if not AUseCache then
  begin
    if lImgData.pImgData <> nil then
      FreeMem(lImgData.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgData;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromIEBitmap
  ����:      ��TIEBitmap�л�ȡ����λ�á��Ա��������Ϣ�б�,���ֲ���ʹ�ñ���������
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      ABitmap: TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromIEBitmap(ABitmap:
  TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap;
  AUseCache: Boolean): Boolean;
begin
  Result := DetectFacesAndAgeGenderFromIEBitmap(ABitmap, AFaceInfos,
    AOutIEBitmp, FResampleWidth, FResampleHeight, FResampleFilter,
    FContrastRatio, AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromFileEx
  ����:      ��ͼ���ļ��л�ȡ����λ�á��Ա��������Ϣ�б�
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      AFileName: string; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter; AContrast: Double; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromFileEx(AFileName:
  string; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap;
  AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
  AContrast: Double; AUseCache: Boolean): Boolean;
var
  lIEBitmap: TIEBitmap;
  io: TImageEnIO;
begin
  Result := False;
  if not FileExists(AFileName) then
    Exit;

  lIEBitmap := TIEBitmap.Create;
  io := TImageEnIO.Create(nil);
  try
    io.AttachedIEBitmap := lIEBitmap;
    io.LoadFromFile(AFileName);
    Result := DetectFacesAndAgeGenderFromIEBitmap(lIEBitmap, AFaceInfos,
      AOutIEBitmp, AResampleWidth, AResampleHeight, AResampleFilter, AContrast,
      AUseCache);
  finally
    lIEBitmap.Free;
    io.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesFromBmp
  ����:      ��IEBitmam�л�ȡ����λ����Ϣ�б�
  ����:      Bird
  ����:      2017.09.24
  ����:
  ABitmap: TBitmap;
  var AFaceRegions: TList<AFR_FSDK_FACEINPUT> //����λ����Ϣ�б�
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesFromIEBitmap(ABitmap: TIEBitmap; var
  AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap;
  AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
  AContrast: Double; AUseCache: Boolean): Boolean;
var
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFD_FSDK_FACERES;
  lImgData: TImgdataInfo;
begin
  Result := False;

  if FFaceDetectionEngine = nil then
    Exit;

  if AUseCache then
    lImgData := FImgDataInfoCache
  else
    lImgData.pImgData := nil;

  if not ReadIEBitmap(ABitmap, lImgData, AOutIEBitmp, AResampleWidth,
    AResampleHeight, AResampleFilter, AContrast) then
    Exit;

  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgData.Width;
  offInput.i32Height := lImgData.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgData.pImgData);
  offInput.pi32Pitch[0] := lImgData.LineBytes;
  //�������
  if AFD_FSDK_StillImageFaceDetection(FFaceDetectionEngine, @offInput, pFaceRes)
    = MOK then
  begin
    ExtractFaceBoxs(pFaceRes^, AFaceRegions);
  end;

  if not AUseCache then
  begin
    if lImgData.pImgData <> nil then
      FreeMem(lImgData.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgData;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesFromBmpFile
  ����:      ��ͼ���ļ��л�ȡ����λ����Ϣ�б�
  ����:      Bird
  ����:      2017.09.24
  ����:      AFile: String; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesFromFile(AFile: string; var
  AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap;
  AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
  AContrast: Double; AUseCache: Boolean): Boolean;
var
  lImgData: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFD_FSDK_FACERES;
begin
  Result := False;

  if FFaceDetectionEngine = nil then
    Exit;

  if AUseCache then
    lImgData := FImgDataInfoCache
  else
    lImgData.pImgData := nil;

  if not ReadFromFile(AFile, lImgData, AOutIEBitmp,
    AResampleWidth, AResampleHeight, AResampleFilter, AContrast) then
    Exit;

  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgData.Width;
  offInput.i32Height := lImgData.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgData.pImgData);
  offInput.pi32Pitch[0] := lImgData.LineBytes;

  //�������
  if AFD_FSDK_StillImageFaceDetection(FFaceDetectionEngine, @offInput, pFaceRes)
    = MOK then
  begin
    ExtractFaceBoxs(pFaceRes^, AFaceRegions);
  end;

  if not AUseCache then
  begin
    if lImgData.pImgData <> nil then
      FreeMem(lImgData.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgData;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesFromBmpFile
  ����:      ���ļ��л�ȡ����λ����Ϣ�б�
  ����:      Bird
  ����:      2017.09.24
  ����:      AFile: String; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesFromFile(AFile: string; var
  AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap; AUseCache:
  Boolean): Boolean;
begin
  Result := DetectFacesFromFile(AFile, AFaceRegions, AOutIEBitmp,
    FResampleWidth, FResampleHeight, FResampleFilter, FContrastRatio,
    AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DetectFacesFromIEBitmap
  ����:      ��IEBitmap�л�ȡ����λ����Ϣ�б�
  ����:      Bird
  ����:      2017.09.25
  ����:      ABitmap: TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap = nil
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesFromIEBitmap(ABitmap: TIEBitmap; var
  AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AOutIEBitmp: TIEBitmap; AUseCache:
  Boolean): Boolean;
begin
  Result := DetectFacesFromIEBitmap(ABitmap, AFaceRegions, AOutIEBitmp,
    FResampleWidth, FResampleHeight, FResampleFilter, FContrastRatio,
    AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.TrackFacesFromIEBitmap
  ����:      ��IEBitmap�л�ȡ����λ����Ϣ�б���׷��ģʽ��
  ����:      Bird
  ����:      2017.11.19
  ����:      ABitmap: TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.TrackFacesFromIEBitmap(ABitmap: TIEBitmap; var
  AFaceRegions: TList<AFR_FSDK_FACEINPUT>; AUseCache: Boolean): Boolean;
var
  lImgDataInfo: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFT_FSDK_FACERES;
begin
  Result := False;

  if FFaceDetectionEngine = nil then
    Exit;

  if AUseCache then
    lImgDataInfo := FImgDataInfoCache
  else
    lImgDataInfo.pImgData := nil;

  if not ReadIEBitmap(ABitmap, lImgDataInfo, nil) then
    Exit;

  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgDataInfo.Width;
  offInput.i32Height := lImgDataInfo.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgDataInfo.pImgData);
  offInput.pi32Pitch[0] := lImgDataInfo.LineBytes;

  //�������
  if AFT_FSDK_FaceFeatureDetect(FFaceTrackingEngine, @offInput, pFaceRes)
    = MOK then
  begin
    ExtractFaceBoxs(pFaceRes^, AFaceRegions);
  end;

  if not AUseCache then
  begin
    if lImgDataInfo.pImgData <> nil then
      FreeMem(lImgDataInfo.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgDataInfo;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DrawFaceRectAgeGender
  ����:      ��ImageEnView�ϻ�������
  ����:      Bird
  ����:      2017.11.19
  ����:      AView: TImageEnView; AFaceIdx: Integer; AFaceInfo: AFR_FSDK_FACEINPUT; AColor: TColor = clBlue; AWidth: Integer = 2; ADrawIndex: Boolean = true; ATextSize: Integer = 12
  ����ֵ:    ��
  ------------------------------------------------------------------------------- }
class procedure TArcFaceSDKIEVersion.DrawFaceRectAgeGender(AView: TImageEnView;
  AFaceIdx: Integer; AFaceInfo: TFaceBaseInfo; AColor: TColor = clBlue;
  AWidth: Integer = 2; ADrawIndex: Boolean = true; ATextSize: Integer = 0);
var
  sText: string;
  iTextHeight, iTextWidth: Integer;
begin
  ATextSize := 0;
  AView.IEBitmap.Canvas.Pen.Color := AColor;
  AView.IEBitmap.Canvas.Pen.Width := AWidth;
  AView.IEBitmap.Canvas.Brush.Style := bsClear;
  if ATextSize = 0 then
    AView.IEBitmap.Canvas.Font.Size :=
      Round((AFaceInfo.FaceRect.bottom - AFaceInfo.FaceRect.top) / (10 * 1.5))
  else
    AView.IEBitmap.Canvas.Font.Size := ATextSize;
  AView.IEBitmap.Canvas.Font.Color := AColor;
  AView.IEBitmap.Canvas.RoundRect(AFaceInfo.FaceRect.left,
    AFaceInfo.FaceRect.top,
    AFaceInfo.FaceRect.right, AFaceInfo.FaceRect.bottom, 0, 0);

  sText := '';
  case AFaceInfo.Gender of
    0:
      sText := '�Ա�:��';
    1:
      sText := '�Ա�:Ů';
  else
    sText := '�Ա�:δ֪';
  end;

  sText := sText + ' ����:' + IntToStr(AFaceInfo.Age);

  if ADrawIndex then
  begin
    if AFaceIdx <> -1 then
      sText := IntToStr(AFaceIdx) + ' ' + sText;
  end;

  if sText <> '' then
  begin
    iTextWidth := AView.IEBitmap.Canvas.TextWidth(sText);
    iTextHeight := AView.IEBitmap.Canvas.TextHeight(sText);

    AView.IEBitmap.Canvas.Brush.Style := bsSolid;
    AView.IEBitmap.Canvas.Brush.Color := AColor;
    if AView.IEBitmap.Canvas.Brush.Color = clWhite then
      AView.IEBitmap.Canvas.Font.Color := clBlack
    else
      AView.IEBitmap.Canvas.Font.Color := clWhite;
    AView.IEBitmap.Canvas.Font.Quality := fqClearType;

    AView.IEBitmap.Canvas.RoundRect(AFaceInfo.FaceRect.left,
      AFaceInfo.FaceRect.top - iTextHeight - 6,
      Max(AFaceInfo.FaceRect.right,
      AFaceInfo.FaceRect.left + iTextWidth + 10),
      AFaceInfo.FaceRect.top, 0, 0);

    AView.IEBitmap.Canvas.TextOut(AFaceInfo.FaceRect.left + 5,
      AFaceInfo.FaceRect.top - 3 - iTextHeight, sText);
  end;

  AView.Update;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DrawFaceRect
  ����:      ��ImageEnView�ϻ�������
  ����:      Bird
  ����:      2017.11.19
  ����:      AView: TImageEnView; AFaceIdx: Integer; AFaceInfo: AFR_FSDK_FACEINPUT; AColor: TColor = clBlue; AWidth: Integer = 2; ADrawIndex: Boolean = true; ATextSize: Integer = 12
  ����ֵ:    ��
  ------------------------------------------------------------------------------- }
class procedure TArcFaceSDKIEVersion.DrawFaceRect(AView: TImageEnView;
  AFaceIdx: Integer; AFaceInfo: AFR_FSDK_FACEINPUT; AColor: TColor = clBlue;
  AWidth: Integer = 2; ADrawIndex: Boolean = true; ATextSize: Integer = 0);
var
  sText: string;
  iTextHeight, iTextWidth: Integer;
begin
  ATextSize := 0;
  AView.IEBitmap.Canvas.Pen.Color := AColor;
  AView.IEBitmap.Canvas.Pen.Width := AWidth;
  AView.IEBitmap.Canvas.Brush.Style := bsClear;
  if ATextSize = 0 then
    AView.IEBitmap.Canvas.Font.Size :=
      Round((AFaceInfo.rcFace.bottom - AFaceInfo.rcFace.top) / (10 * 1.5))
  else
    AView.IEBitmap.Canvas.Font.Size := ATextSize;
  AView.IEBitmap.Canvas.Font.Color := AColor;
  AView.IEBitmap.Canvas.RoundRect(AFaceInfo.rcFace.left,
    AFaceInfo.rcFace.top,
    AFaceInfo.rcFace.right, AFaceInfo.rcFace.bottom, 0, 0);

  sText := '';
  if ADrawIndex then
  begin
    if AFaceIdx <> -1 then
      sText := IntToStr(AFaceIdx);
  end;

  if sText <> '' then
  begin
    iTextWidth := AView.IEBitmap.Canvas.TextWidth(sText);
    iTextHeight := AView.IEBitmap.Canvas.TextHeight(sText);

    AView.IEBitmap.Canvas.Brush.Style := bsSolid;
    AView.IEBitmap.Canvas.Brush.Color := AColor;
    if AView.IEBitmap.Canvas.Brush.Color = clWhite then
      AView.IEBitmap.Canvas.Font.Color := clBlack
    else
      AView.IEBitmap.Canvas.Font.Color := clWhite;
    AView.IEBitmap.Canvas.Font.Quality := fqClearType;

    AView.IEBitmap.Canvas.RoundRect(AFaceInfo.rcFace.left,
      AFaceInfo.rcFace.top - iTextHeight - 6,
      Max(AFaceInfo.rcFace.right,
      AFaceInfo.rcFace.left + iTextWidth + 10),
      AFaceInfo.rcFace.top, 0, 0);

    AView.IEBitmap.Canvas.TextOut(Round((AFaceInfo.rcFace.left - iTextWidth) /
      2), AFaceInfo.rcFace.top - 3 - iTextHeight, sText);

  end;

  AView.Update;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.ExtractFaceFeatureFromBmp
  ����:      ��IEBitmap����ȡ������������
  ����:      Bird
  ����:      2017.09.24
  ����:
  AFaceInput: ASVLOFFSCREEN; //ͼƬ����
  AFaceRegion: AFR_FSDK_FACEINPUT; //����λ����Ϣ
  var AFaceModel: AFR_FSDK_FACEMODEL //�������������������ڴ����ֶ�ʹ��freemem�ͷ�
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.ExtractFaceFeatureFromIEBitmap(AIEBitmap:
  TIEBitmap;
  AFaceRegion:
  AFR_FSDK_FACEINPUT;
  var
  AFaceModel:
  AFR_FSDK_FACEMODEL;
  AOutIEBitmp: TIEBitmap;
  AResampleWidth,
  AResampleHeight: Integer;
  AResampleFilter: TResampleFilter;
  AUseCache:
  Boolean): Boolean;
var
  lImgData: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFD_FSDK_FACERES;
begin
  Result := False;

  if FFaceRecognitionEngine = nil then
    Exit;

  if AUseCache then
    lImgData := FImgDataInfoCache
  else
    lImgData.pImgData := nil;

  if not ReadIEBitmap(AIEBitmap, lImgData, AOutIEBitmp, AResampleWidth,
    AResampleHeight, AResampleFilter) then
    Exit;

  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);
  offInput.i32Width := lImgData.Width;
  offInput.i32Height := lImgData.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgData.pImgData);
  offInput.pi32Pitch[0] := lImgData.LineBytes;

  //����������ȡ
  Result := ExtractFaceFeature(offInput, AFaceRegion, AFaceModel);

  if not AUseCache then
  begin
    if lImgData.pImgData <> nil then
      FreeMem(lImgData.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgData;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.MatchFaceWithIEBitmaps
  ����:      �ȶ���������IEBitmap��ֻ�ȶԵ�һ��������
  ����:      Bird
  ����:      2017.11.19
  ����:      AInBitmap1, AInBitmap2, AOutIEBitmp1, AOutIEBitmp2: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter; AUseCache: Boolean
  ����ֵ:    Single
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.MatchFaceWithIEBitmaps(AInBitmap1,
  AInBitmap2,
  AOutIEBitmp1, AOutIEBitmp2: TIEBitmap;
  AResampleWidth, AResampleHeight:
  Integer;
  AResampleFilter: TResampleFilter;
  AContrast: Double;
  AUseCache:
  Boolean): Single;
var
  AFaceRegions1, AFaceRegions2: TList<AFR_FSDK_FACEINPUT>;
  AFaceModels1, AFaceModels2: TFaceModels;
  i: Integer;
  T: Cardinal;
begin
  Result := 0;

  if (AInBitmap1 = nil) or (AInBitmap2 = nil) then
    Exit;

  AFaceRegions1 := TList<AFR_FSDK_FACEINPUT>.Create;
  AFaceRegions2 := TList<AFR_FSDK_FACEINPUT>.Create;
  AFaceModels1 := TFaceModels.Create;
  AFaceModels2 := TFaceModels.Create;
  try
{$IFDEF DEBUG}
    T := GetTickCount;
{$ENDIF}
    DetectAndRecognitionFacesFromIEBitmap(AInBitmap1, AFaceRegions1,
      AFaceModels1, AOutIEBitmp1, AResampleWidth, AResampleHeight,
      AResampleFilter, AContrast, AUseCache);
{$IFDEF DEBUG}
    T := GetTickCount - T;
    DoLog('ȡͼһ������ʱ��' + IntToStr(T));
{$ENDIF}

{$IFDEF DEBUG}
    T := GetTickCount;
{$ENDIF}
    DetectAndRecognitionFacesFromIEBitmap(AInBitmap2, AFaceRegions2,
      AFaceModels2, AOutIEBitmp2, AResampleWidth, AResampleHeight,
      AResampleFilter, AContrast, AUseCache);
{$IFDEF DEBUG}
    T := GetTickCount - T;
    DoLog('ȡͼ��������ʱ��' + IntToStr(T));
{$ENDIF}
    if (AFaceModels1.Count > 0) and (AFaceModels2.Count > 0) then
    begin
{$IFDEF DEBUG}
      T := GetTickCount;
{$ENDIF}
      Result := MatchFace(AFaceModels1.FaceModel[0],
        AFaceModels2.FaceModel[0]);
{$IFDEF DEBUG}
      T := GetTickCount - T;
      DoLog('�ȶԺ�ʱ��' + IntToStr(T));
{$ENDIF}
    end;

  finally
    AFaceRegions1.Free;
    AFaceRegions2.Free;
    AFaceModels1.Free;
    AFaceModels2.Free;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.MatchFaceWithIEBitmaps
  ����:      �ȶ���������IEBitmap��ֻ�ȶԵ�һ��������
  ����:      Bird
  ����:      2017.11.19
  ����:      AInBitmap1, AInBitmap2, AOutIEBitmp1, AOutIEBitmp2: TIEBitmap; AUseCache: Boolean
  ����ֵ:    Single
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.MatchFaceWithIEBitmaps(AInBitmap1, AInBitmap2,
  AOutIEBitmp1, AOutIEBitmp2: TIEBitmap;
  AContrast:
  Double;
  AUseCache:
  Boolean): Single;
begin
  Result := MatchFaceWithIEBitmaps(AInBitmap1, AInBitmap2, AOutIEBitmp1,
    AOutIEBitmp2, FResampleWidth, FResampleHeight, FResampleFilter, AContrast,
    AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.ReadFromFile
  ����:      ���ļ��ж�ȡ��֧������ImageEN֧�ֵĸ�ʽ
  ����:      Bird
  ����:      2017.09.25
  ����:      AFilename: string; var AImgData: TImgdataInfo; AOutIEBitmp: TIEBitmap; AResampleWidth: Integer = 0; AResampleHeight: Integer = 0; AResampleFilter: TResampleFilter = rfNone
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
class
  function TArcFaceSDKIEVersion.ReadFromFile(AFileName: string;
  var
  AImgData: TImgdataInfo;
  AOutIEBitmp: TIEBitmap;
  AResampleWidth: Integer =
  0;
  AResampleHeight: Integer = 0;
  AResampleFilter: TResampleFilter = rfNone;
  AContrast:
  Double = 0): Boolean;
var
  lBitMap: TIEBitmap;
  io: TImageEnIO;
begin
  Result := False;

  if not FileExists(AFileName) then
    Exit;

  lBitMap := TIEBitmap.Create;
  io := TImageEnIO.Create(nil);
  try
    io.AttachedIEBitmap := lBitMap;
    io.LoadFromFile(AFileName);

    Result := ReadIEBitmap(lBitMap, AImgData, AOutIEBitmp,
      AResampleWidth, AResampleHeight, AResampleFilter, AContrast);

  finally
    io.Free;
    lBitMap.Free;
  end;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.ReadIEBitmap
  ����:      ��IEBitmap�ж�ȡ
  ����:      Bird
  ����:      2017.11.19
  ����:      ABitmap: TIEBitmap; var AImgDataInfo: TImgdataInfo; AOutIEBitmp: TIEBitmap; AResampleWidth: Integer = 0; AResampleHeight: Integer = 0; AResampleFilter: TResampleFilter = rfNone
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
class
  function TArcFaceSDKIEVersion.ReadIEBitmap(ABitmap: TIEBitmap;
  var
  AImgDataInfo: TImgdataInfo;
  AOutIEBitmp: TIEBitmap;
  AResampleWidth: Integer
  = 0;
  AResampleHeight: Integer = 0;
  AResampleFilter: TResampleFilter =
  rfNone;
  AContrast:
  Double = 0): Boolean;
var
  iLineByte: Integer;
  iBitCount: Integer;
  i: Integer;
  lBitMap: TIEBitmap;
  proc: TImageEnProc;
  LastLP: Pointer;
  iNewWidth, iNewHeight: Integer;
begin
  Result := False;
  if ABitmap = nil then
    Exit;

  if (AResampleWidth <> 0) or (AResampleHeight <> 0) then
  begin
    lBitMap := TIEBitmap.Create;
    //��������
    lBitMap.Assign(ABitmap);
    proc := TImageEnProc.Create(nil);
    try
      proc.AttachedIEBitmap := lBitMap;
      //���ָ�����Ⱥ͸߶Ⱦ�����0
      if (AResampleWidth > 0) and (AResampleHeight > 0) then
      begin
        //�������>�߱����Կ�Ϊ��׼���е����������Ը�Ϊ��׼���е������൱�ڿ�����
        if AResampleWidth / AResampleHeight > lBitMap.Width / lBitMap.Height
        then
        begin
          iNewWidth := AResampleWidth;
          iNewHeight := Round(AResampleWidth / lBitMap.Width * lBitMap.Height);
        end
        else
        begin
          iNewWidth := Round(AResampleHeight / lBitMap.Height * lBitMap.Width);
          iNewHeight := AResampleHeight;
        end;
        proc.Resample(iNewWidth, iNewHeight, AResampleFilter);
      end
      {
        else if (AResampleWidth < 0) and (AResampleHeight < 0) then
        begin
        if lBitMap.Width < Abs(AResampleWidth) then
        proc.Resample(Abs(AResampleWidth),
        Round(Abs(AResampleWidth) / lBitMap.Width *
        lBitMap.Height), AResampleFilter)
        else if lBitMap.Height < Abs(AResampleHeight) then
        proc.Resample(Round(Abs(AResampleHeight) / lBitMap.Height *
        lBitMap.Width), Abs(AResampleHeight), AResampleFilter)
        end
      }
      //���ָ����С��0�����鵱ǰ���Ƿ�С��ָ�����ľ���ֵ��
      //���С�ڵ����Կ���Ϊ��׼���е���
      else if (AResampleWidth < 0) then
      begin
        if lBitMap.Width < Abs(AResampleWidth) then
          proc.Resample(Abs(AResampleWidth),
            Round(Abs(AResampleWidth) / lBitMap.Width *
            lBitMap.Height), AResampleFilter)
      end
      //���ָ����С��0�����鵱ǰ���Ƿ�С��ָ���ߵľ���ֵ��
      //���С�ڵ����Ը߶�Ϊ��׼���е���
      else if (AResampleHeight < 0) then
      begin
        if lBitMap.Height < Abs(AResampleHeight) then
          proc.Resample(Round(Abs(AResampleHeight) / lBitMap.Height *
            lBitMap.Width), Abs(AResampleHeight), AResampleFilter)
      end
      //���ָ��������0�����Կ���Ϊ��׼���е���
      else if AResampleWidth > 0 then
        proc.Resample(AResampleWidth, Round(AResampleWidth / lBitMap.Width *
          lBitMap.Height), AResampleFilter)
        //���ָ���ߴ���0�����Ը߶�Ϊ��׼���е���
      else if AResampleHeight > 0 then
        proc.Resample(Round(AResampleHeight / lBitMap.Height * lBitMap.Width),
          AResampleHeight, AResampleFilter);
      //�����Աȶ�
      if AContrast > 0 then
        proc.Contrast(AContrast);

    finally
      proc.Free;
    end;

  end
  else
    lBitMap := ABitmap;

  Result := False;
  iBitCount := lBitMap.BitCount;
  if iBitCount = 0 then
    Exit;

  iLineByte := Trunc((lBitMap.Width * iBitCount / 8 + 3) / 4) * 4;

  if
    (AImgDataInfo.BitCount <> iBitCount) or
    (AImgDataInfo.Width <> lBitMap.Width) or
    (AImgDataInfo.Height <> lBitMap.Height) then
  begin

    AImgDataInfo.BitCount := iBitCount;
    AImgDataInfo.Width := lBitMap.Width;
    AImgDataInfo.Height := lBitMap.Height;
    AImgDataInfo.LineBytes := iLineByte;

    if AImgDataInfo.pImgData <> nil then
      FreeMem(AImgDataInfo.pImgData);
    GetMem(AImgDataInfo.pImgData, iLineByte * lBitMap.Height);
  end
  else
  begin
    if AImgDataInfo.pImgData = nil then
      GetMem(AImgDataInfo.pImgData, iLineByte * lBitMap.Height);
  end;

  {
    LastLP := lBitMap.ScanLine[lBitMap.Height - 1];
    for i := 0 to lBitMap.Height - 1 do
    begin
    CopyMemory(Pointer(AImgDataInfo.pImgData + i * iLineByte),
    Pointer(Int64(LastLP) - i * iLineByte), iLineByte);
    end;
  }

  for i := lBitMap.Height - 1 downto 0 do
  begin
    CopyMemory(Pointer(AImgDataInfo.pImgData + i * iLineByte),
      lBitMap.ScanLine[i], iLineByte);
  end;

  if AOutIEBitmp <> nil then
    AOutIEBitmp.Assign(lBitMap);

  if lBitMap <> ABitmap then
    lBitMap.Free;

  Result := true;
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.TrackFacesAndAgeGenderFromIEBitmap
  ����:      ��IEBitmap�л�ȡ����λ�á��Ա��������Ϣ�б���׷��ģʽ��
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      ABitmap: TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.TrackFacesAndAgeGenderFromIEBitmap(ABitmap:
  TIEBitmap;
  var
  AFaceInfos: TList<TFaceBaseInfo>;
  AUseCache:
  Boolean):
  Boolean;
var
  lImgDataInfo: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFT_FSDK_FACERES;
  lFaceRes_Age: ASAE_FSDK_AGEFACEINPUT;
  lFaceRes_Gender: ASGE_FSDK_GENDERFACEINPUT;
  lFaceRegions: TList<AFR_FSDK_FACEINPUT>;
  lAgeRes: ASAE_FSDK_AGERESULT;
  lGenderRes: ASGE_FSDK_GENDERRESULT;
  lAges: TArray<Integer>;
  lGenders: TArray<Integer>;
  lFaceInfo: TFaceBaseInfo;
  i, iFaces: Integer;
  ArrFaceOrient: array of AFT_FSDK_OrientCode;
  ArrFaceRect: array of MRECT;
  R: MRESULT;
begin
  Result := False;

  if AFaceInfos = nil then
    AFaceInfos := TList<TFaceBaseInfo>.Create;

  if FFaceDetectionEngine = nil then
    Exit;

  if AUseCache then
    lImgDataInfo := FImgDataInfoCache
  else
    lImgDataInfo.pImgData := nil;

  if not ReadIEBitmap(ABitmap, lImgDataInfo, nil) then
    Exit;

  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgDataInfo.Width;
  offInput.i32Height := lImgDataInfo.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgDataInfo.pImgData);
  offInput.pi32Pitch[0] := lImgDataInfo.LineBytes;

  lFaceRegions := TList<AFR_FSDK_FACEINPUT>.Create;
  try
    //�������
    R := AFT_FSDK_FaceFeatureDetect(FFaceTrackingEngine, @offInput, pFaceRes);
    if R = MOK then
    begin
      //�ֽ�����λ����Ϣ
      ExtractFaceBoxs(pFaceRes^, lFaceRegions);
      if lFaceRegions.Count > 0 then
      begin
        iFaces := lFaceRegions.Count;
        SetLength(ArrFaceOrient, iFaces);
        SetLength(ArrFaceRect, iFaces);
        for i := 0 to iFaces - 1 do
        begin
          ArrFaceOrient[i] := lFaceRegions.Items[i].lOrient;
          ArrFaceRect[i] := lFaceRegions.Items[i].rcFace;
        end;

        //�������
        if (FFaceAgeEngine <> nil) then
        begin
          with lFaceRes_Age do
          begin
            pFaceRectArray := @ArrFaceRect[0];
            pFaceOrientArray := @ArrFaceOrient[0];
            lFaceNumber := iFaces;
          end;

          if ASAE_FSDK_AgeEstimation_Preview(
            FFaceAgeEngine, //[in] age estimation engine
            @offInput, //[in] the original image information
            //[in] the face rectangles information
            @lFaceRes_Age,
            //[out] the results of age estimation
            lAgeRes
            ) = MOK then
            //�ֽ���������
            ExtractFaceAges(lAgeRes, lAges);

        end;

        //����Ա�
        if (FFaceGenderEngine <> nil) then
        begin
          with lFaceRes_Gender do
          begin
            pFaceRectArray := @ArrFaceRect[0];
            pFaceOrientArray := @ArrFaceOrient[0];
            lFaceNumber := iFaces;
          end;

          if ASGE_FSDK_GenderEstimation_Preview(
            FFaceGenderEngine, //[in] Gender estimation engine
            @offInput, //[in] the original imGender information
            //[in] the face rectangles information
            @lFaceRes_Gender,
            //[out] the results of Gender estimation
            lGenderRes
            ) = MOK then
            //�ֽ������Ա�
            ExtractFaceGenders(lGenderRes, lGenders);

        end;

        for i := 0 to iFaces - 1 do
        begin
          lFaceInfo.Init;
          lFaceInfo.FaceRect := ArrFaceRect[i];
          lFaceInfo.FaceOrient := ArrFaceOrient[i];
          if i < Length(lAges) then
            lFaceInfo.Age := lAges[i];
          if i < Length(lGenders) then
            lFaceInfo.Gender := lGenders[i];
          AFaceInfos.Add(lFaceInfo);
        end;
      end;

    end;
  finally
    FreeAndNil(lFaceRegions);
  end;

  if not AUseCache then
  begin
    if lImgDataInfo.pImgData <> nil then
      FreeMem(lImgDataInfo.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgDataInfo;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.TrackFacesAndAgeGenderFromIEBitmap1
  ����:      ��IEBitmap�л�ȡ����λ�á��Ա��������Ϣ�б�
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      ABitmap: TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DetectFacesAndAgeGenderFromIEBitmap(ABitmap:
  TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap;
  AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
  AContrast: Double; AUseCache: Boolean): Boolean;
var
  lImgDataInfo: TImgdataInfo;
  offInput: ASVLOFFSCREEN;
  pFaceRes: LPAFD_FSDK_FACERES;
  lFaceRes_Age: ASAE_FSDK_AGEFACEINPUT;
  lFaceRes_Gender: ASGE_FSDK_GENDERFACEINPUT;
  lFaceRegions: TList<AFR_FSDK_FACEINPUT>;
  lAgeRes: ASAE_FSDK_AGERESULT;
  lGenderRes: ASGE_FSDK_GENDERRESULT;
  lAges: TArray<Integer>;
  lGenders: TArray<Integer>;
  lFaceInfo: TFaceBaseInfo;
  i, iFaces: Integer;
  ArrFaceOrient: array of AFD_FSDK_OrientCode;
  ArrFaceRect: array of MRECT;
begin
  Result := False;

  if AFaceInfos = nil then
    AFaceInfos := TList<TFaceBaseInfo>.Create;

  if FFaceDetectionEngine = nil then
    Exit;

  if AUseCache then
    lImgDataInfo := FImgDataInfoCache
  else
    lImgDataInfo.pImgData := nil;

  if not ReadIEBitmap(ABitmap, lImgDataInfo, AOutIEBitmp, AResampleWidth,
    AResampleHeight, AResampleFilter, AContrast) then
    Exit;

  offInput.u32PixelArrayFormat := ASVL_PAF_RGB24_B8G8R8;
  FillChar(offInput.pi32Pitch, SizeOf(offInput.pi32Pitch), 0);
  FillChar(offInput.ppu8Plane, SizeOf(offInput.ppu8Plane), 0);

  offInput.i32Width := lImgDataInfo.Width;
  offInput.i32Height := lImgDataInfo.Height;

  offInput.ppu8Plane[0] := IntPtr(lImgDataInfo.pImgData);
  offInput.pi32Pitch[0] := lImgDataInfo.LineBytes;

  lFaceRegions := TList<AFR_FSDK_FACEINPUT>.Create;
  try
    //�������
    if AFD_FSDK_StillImageFaceDetection(FFaceDetectionEngine, @offInput,
      pFaceRes) = MOK then
    begin
      //�ֽ�����λ����Ϣ
      ExtractFaceBoxs(pFaceRes^, lFaceRegions);
      if lFaceRegions.Count > 0 then
      begin
        iFaces := lFaceRegions.Count;
        SetLength(ArrFaceOrient, iFaces);
        SetLength(ArrFaceRect, iFaces);
        for i := 0 to iFaces - 1 do
        begin
          ArrFaceOrient[i] := lFaceRegions.Items[i].lOrient;
          ArrFaceRect[i] := lFaceRegions.Items[i].rcFace;
        end;

        //�������
        if (FFaceAgeEngine <> nil) then
        begin
          with lFaceRes_Age do
          begin
            pFaceRectArray := @ArrFaceRect[0];
            pFaceOrientArray := @ArrFaceOrient[0];
            lFaceNumber := iFaces;
          end;

          if ASAE_FSDK_AgeEstimation_StaticImage(
            FFaceAgeEngine, //[in] age estimation engine
            @offInput, //[in] the original image information
            //[in] the face rectangles information
            @lFaceRes_Age,
            //[out] the results of age estimation
            lAgeRes
            ) = MOK then
            //�ֽ���������
            ExtractFaceAges(lAgeRes, lAges);

        end;

        //����Ա�
        if (FFaceGenderEngine <> nil) then
        begin
          with lFaceRes_Gender do
          begin
            pFaceRectArray := @ArrFaceRect[0];
            pFaceOrientArray := @ArrFaceOrient[0];
            lFaceNumber := iFaces;
          end;

          if ASGE_FSDK_GenderEstimation_StaticImage(
            FFaceGenderEngine, //[in] Gender estimation engine
            @offInput, //[in] the original imGender information
            //[in] the face rectangles information
            @lFaceRes_Gender,
            //[out] the results of Gender estimation
            lGenderRes
            ) = MOK then
            //�ֽ������Ա�
            ExtractFaceGenders(lGenderRes, lGenders);

        end;

        for i := 0 to iFaces - 1 do
        begin
          lFaceInfo.Init;
          lFaceInfo.FaceRect := ArrFaceRect[i];
          lFaceInfo.FaceOrient := ArrFaceOrient[i];
          if i < Length(lAges) then
            lFaceInfo.Age := lAges[i];
          if i < Length(lGenders) then
            lFaceInfo.Gender := lGenders[i];
          AFaceInfos.Add(lFaceInfo);
        end;
      end;

    end;
  finally
    FreeAndNil(lFaceRegions);
  end;

  if not AUseCache then
  begin
    if lImgDataInfo.pImgData <> nil then
      FreeMem(lImgDataInfo.pImgData)
  end
  else
  begin
    FImgDataInfoCache := lImgDataInfo;
  end;

end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DRAGfromIEBitmap
  ����:      ��TIEBitmap�л�ȡ����λ�á��Ա��������Ϣ�б�,���ֲ���ʹ�ñ���������
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      ABitmap: TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DRAGfromIEBitmap(ABitmap: TIEBitmap; var
  AFaceInfos: TList<TFaceBaseInfo>; var AFaceModels: TFaceModels;
  AOutIEBitmp: TIEBitmap; AUseCache: Boolean): Boolean;
begin
  Result := DRAGfromIEBitmap(ABitmap, AFaceInfos, AFaceModels,
    AOutIEBitmp, FResampleWidth, FResampleHeight, FResampleFilter,
    FContrastRatio, AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DRAGfromFile
  ����:      ��TIEBitmap�л�ȡ����λ�á��Ա��������Ϣ�б�,���ֲ���ʹ�ñ���������
  ����:      DelphiDX10
  ����:      2018.01.31
  ����:      AFileName: TIEBitmap; var AFaceInfos: TList<TFaceBaseInfo>; AOutIEBitmp: TIEBitmap; AUseCache: Boolean
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DRAGfromFile(AFileName: string; var AFaceInfos:
  TList<TFaceBaseInfo>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap;
  AUseCache: Boolean): Boolean;
begin
  Result := DRAGfromFile(AFileName, AFaceInfos, AFaceModels,
    AOutIEBitmp, FResampleWidth, FResampleHeight, FResampleFilter,
    FContrastRatio, AUseCache);
end;

{ -------------------------------------------------------------------------------
  ������:    TArcFaceSDKIEVersion.DRAGfromFile
  ����:      ��IEBitmap�л�ȡ����λ�á����䡢�Ա��������Ϣ�б�
  ����:      Bird
  ����:      2017.09.25
  ����:      AFileName: TIEBitmap; var AFaceRegions: TList<AFR_FSDK_FACEINPUT>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap; AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter
  ����ֵ:    Boolean
  ------------------------------------------------------------------------------- }
function TArcFaceSDKIEVersion.DRAGfromFile(AFileName: string; var AFaceInfos:
  TList<TFaceBaseInfo>; var AFaceModels: TFaceModels; AOutIEBitmp: TIEBitmap;
  AResampleWidth, AResampleHeight: Integer; AResampleFilter: TResampleFilter;
  AContrast: Double; AUseCache: Boolean): Boolean;
var
  lIEBitmap: TIEBitmap;
  io: TImageEnIO;
begin
  Result := False;
  if not FileExists(AFileName) then
    Exit;

  lIEBitmap := TIEBitmap.Create;
  io := TImageEnIO.Create(nil);
  try
    io.AttachedIEBitmap := lIEBitmap;
    io.LoadFromFile(AFileName);
    Result := DRAGfromIEBitmap(lIEBitmap, AFaceInfos,
      AFaceModels, AOutIEBitmp, AResampleWidth, AResampleHeight,
      AResampleFilter, AContrast, AUseCache);
  finally
    lIEBitmap.Free;
    io.Free;
  end;
end;

end.