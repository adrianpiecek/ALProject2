page 50105 "Summer Olympics List" 

{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SummerOlympic;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                    
                }
                field(Inventory; Rec.Inventory)
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
            action("Get Olympic Items")
            {
                ApplicationArea = All;
                
                trigger OnAction()
                var
                    GetItems: Codeunit "GetItems";
                begin
                    GetItems.GetOlympicItems();
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}