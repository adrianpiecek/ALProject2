codeunit 50121 EIPImportExcel
{
    procedure ImportExcel()
    var
        FileName: Text;
        SheetName: Text;
        TmpExcelBuf: Record "Excel Buffer" temporary;
        InStream: InStream;
        NoSeriesRec: Record "No. Series";
        NoSeriesLineRec: Record "No. Series Line";
        CarModelRec: Record EIPCarModel;
        CarBrandRec: Record EIPCarBrand;
        NoSeries: Codeunit "No. Series";
        NoSeriesManagment: Codeunit "No. Series - Setup";
    begin
        UploadIntoStream('Import Excel', '', 'Excel (.xlsx)|*.xlsx', FileName, InStream);
        SheetName := TmpExcelBuf.SelectSheetsNameStream(InStream);
        TmpExcelBuf.OpenBookStream(InStream, SheetName);
        TmpExcelBuf.ReadSheet();

        TmpExcelBuf.Reset();
        TmpExcelBuf.SetFilter("Row No.", '>1'); // pierwszy wiersz jest nagłówkiem
        if TmpExcelBuf.FindSet() then
            repeat
                case TmpExcelBuf."Column No." of
                    1:
                        begin
                            //NoSeriesLineRec.Init();
                            //NoSeriesRec."Code" := CopyStr(TmpExcelBuf."Cell Value as Text", 1, 3);
                            //NoSeriesLineRec."Series Code" := NoSeriesRec."Code";
                            if not NoSeriesRec.Get(CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3)) then begin
                                NoSeriesRec.Init();
                                NoSeriesRec.Code := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3);
                                NoSeriesRec.Insert();
                            end;
                            NoSeriesLineRec."Series Code" := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3);
                            if NoSeriesLineRec.FindFirst() then begin
                                if NoSeriesLineRec."Starting No." = '' then begin
                                    NoSeriesLineRec."Series Code" := NoSeriesRec.Code;
                                    NoSeriesLineRec."Starting No." := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3) + '0001';
                                    NoSeriesLineRec."Ending No." := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3) + '1000';
                                    NoSeriesLineRec.Modify();
                                end;
                            end else begin
                                NoSeriesLineRec.Init();
                                NoSeriesLineRec."Series Code" := NoSeriesRec.Code;
                                NoSeriesLineRec."Starting No." := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3) + '0001';
                                NoSeriesLineRec."Ending No." := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3) + '1000';
                                NoSeriesLineRec.Insert();
                            end;

                            if not CarBrandRec.Get(UpperCase(TmpExcelBuf."Cell Value as Text")) then begin
                                CarBrandRec.Init();
                                CarBrandRec."No." := UpperCase(TmpExcelBuf."Cell Value as Text");
                                //CarBrandRec."Number Series" := CopyStr(UpperCase(TmpExcelBuf."Cell Value as Text"), 1, 3);
                                CarBrandRec."Number Series" := NoSeriesRec.Code;
                                CarBrandRec.Name := TmpExcelBuf."Cell Value as Text";
                                CarBrandRec.Insert();
                            end;
                        end;
                    4:
                        begin
                            CarModelRec."No." := NoSeries.GetNextNo(NoSeriesLineRec."Series Code");
                            CarModelRec.Name := TmpExcelBuf."Cell Value as Text";
                            CarModelRec.Insert();
                        end;


                end;
            until TmpExcelBuf.Next() = 0;



    end;
}