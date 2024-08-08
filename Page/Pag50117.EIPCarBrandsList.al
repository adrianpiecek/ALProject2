page 50117 "EIP Car Brands List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EIPCarBrand;
    CardPageId = "EIP Car Brand Card";
    Caption = 'Car Brands List';


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                }
                field("Number of Cars"; Rec."Number of Cars")
                {
                    ApplicationArea = All;
                }
                field("Number Series"; Rec."Number Series")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import from Excel")
            {
                ApplicationArea = All;
                Image = ImportExcel;

                trigger OnAction()
                var
                    ImportCodeUnit: Codeunit EIPImportExcel;
                begin
                    ImportCodeUnit.ImportExcel();
                end;
            }
            action("Drop Table")
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                var
                    CarBrandRec: Record EIPCarBrand;
                begin
                    repeat
                        CarBrandRec.Delete();
                    until CarBrandRec.Next() = 0;
                end;
            }
        }
    }

    var
        myInt: Integer;
}