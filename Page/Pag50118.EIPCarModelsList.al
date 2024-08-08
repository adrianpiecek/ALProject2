page 50118 "EIP Car Models List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EIPCarModel;
    CardPageId = "EIP Car Model Card";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Body Type"; Rec."Body Type")
                {
                    ApplicationArea = All;
                }
                field("Number of Doors"; Rec."Number of Door")
                {
                    ApplicationArea = All;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}