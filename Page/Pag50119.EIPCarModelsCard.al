page 50119 "EIP Car Models Card"
{
    ApplicationArea = All;
    Caption = 'EIP Car Models Card';
    PageType = Card;
    SourceTable = EIPCarModel;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Body Type"; Rec."Body Type")
                {
                    ToolTip = 'Specifies the value of the Body Type field.', Comment = '%';
                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.', Comment = '%';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Number of Door"; Rec."Number of Door")
                {
                    ToolTip = 'Specifies the value of the Number of Door field.', Comment = '%';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the value of the Weight field.', Comment = '%';
                }
            }
        }
    }
}
