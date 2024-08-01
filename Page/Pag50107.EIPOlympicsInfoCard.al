page 50107 "EIP Olympics Info Card"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Olympic;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Type; rec.Type)
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Year; rec.Year)
                {
                    ApplicationArea = All;

                }
                field(City; rec.City)
                {
                    ApplicationArea = All;

                }
                field("Post Code"; rec."Post Code")
                {
                    ApplicationArea = All;
                    /*trigger OnValidate()
                    begin
                        Message('OnValidate');
                    end;

                    trigger OnAfterLookup(Selected: RecordRef)
                    begin
                        Message('OnAfterLookup');
                    end;

                    trigger OnAssistEdit()
                    begin
                        Message('OnAssistEdit');
                    end;

                    trigger OnControlAddIn(Index: Integer; Data: Text)
                    begin
                        Message('OnControlAddIn');
                    end;

                    trigger OnDrillDown()
                    begin
                        Message('OnDrillDown');
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Message('OnLookup');
                    end;*/

                }
                field("Country/Region Code"; rec."Country/Region Code")
                {
                    ApplicationArea = All;

                }

                field(Image; rec.Image)
                {
                    ApplicationArea = All;
                }

            }
            group(Information)
            {
                field("Fun Fact"; rec."Fun Fact")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
            }
        }

        area(FactBoxes)
        {
            part("Attached Media"; "EIP Olympic Picture")
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ShowMap)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    MapLink: Text;
                begin
                    MapLink := 'https://www.bing.com/maps?q=' + rec.City + ' ' + rec."Country/Region Code";
                    Hyperlink(MapLink);
                end;
            }
            action("Get Informations")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    InfoLink: Text;
                begin
                    InfoLink := 'https://www.bing.com/search?q=' + rec.Name + ' ' + rec.City + ' ' + format(rec.Type) + ' ' + format(rec.Year) + 'Olympics';
                    Hyperlink(InfoLink);
                end;
            }
            action("Get Olympic")
            {
                ApplicationArea = All;
                trigger OnAction()

                begin
                    GetOlympic();
                end;
            }
            action("Import Fun Fact")
            {
                ApplicationArea = All;
                Caption = 'Import Fun Fact';
                Image = Import;
                trigger OnAction()
                var
                    FactFile: File;
                    StringLine: Text;
                    varSize: Integer;
                    FileMgt: Codeunit "File Management";
                    FilePath: Text;
                    FactFileInStream: InStream;
                    Buffor: text;
                begin
                    if File.UploadIntoStream('Select File', '', 'All Files (*.*)|*.*', Buffor, FactFileInStream) then begin
                        FactFileInStream.ReadText(Buffor);
                        Rec."Fun Fact" := Buffor;
                        Rec.Modify();
                    end;
                end;

            }
        }
    }

    local procedure GetOlympic()
    var
        WinterOlympics: Record WinterOlympic;
        SummerOlympics: Record SummerOlympic;
    begin
        if WinterOlympics.FindSet() then begin
            repeat
                Rec.Init();
                Rec."No." := WinterOlympics."No.";
                Rec.Type := TypeEnum::Winter;
                Rec.Name := WinterOlympics.Description;
                Rec.Year := WinterOlympics.Year;
                Rec.Insert();
            //insert PK, potem pozostale pola i modify - dobra praktyka, ale tak jak jest tez jest dobrze
            until WinterOlympics.Next = 0;
        end;
        if SummerOlympics.FindSet() then begin
            repeat
                Rec.Init();
                Rec."No." := SummerOlympics."No.";
                Rec.Type := TypeEnum::Summer;
                Rec.Name := SummerOlympics.Description;
                Rec.Year := SummerOlympics.Year;
                Rec.Insert();
            until SummerOlympics.Next = 0;
            CurrPage.Update();
        end;
    end;
    /*
        trigger OnAfterGetCurrRecord()
        begin
            Message('OnAfterGetCurrRecord');
        end;

        trigger OnAfterGetRecord()
        begin
            Message('OnAfterGetRecord');
        end;

        trigger OnClosePage()
        begin
            Message('OnClosePage');
        end;

        trigger OnDeleteRecord(): Boolean
        begin
            Message('OnDeleteRecord');
        end;

        trigger OnFindRecord(Which: Text): Boolean
        begin
            Message('OnFindRecord');
        end;

        trigger OnInit()
        begin
            Message('OnInit');
        end;

        trigger OnInsertRecord(BelowxRec: Boolean): Boolean
        begin
            Message('OnInsertRecord');
        end;

        trigger OnModifyRecord(): Boolean
        begin
            Message('OnModifyRecord');
        end;

        trigger OnNewRecord(BelowxRec: Boolean)
        begin
            Message('OnNewRecord');
        end;

        trigger OnNextRecord(Steps: Integer): Integer
        begin
            Message('OnNextRecord');
        end;

        trigger OnOpenPage()
        begin
            Message('OnOpenPage');
        end;

        trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
        begin
            Message('OnPageBackgroundTaskCompleted');
        end;

        trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
        begin
            Message('OnPageBackgroundTaskError');
        end;

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        begin
            Message('OnQueryClosePage');
        end;
    */


}