page 50110 "EIP Olympic Picture"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Olympic;


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
                field(Image; Rec.Image)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Image")
            {
                ApplicationArea = All;
                Image = Picture;

                trigger OnAction()
                var
                    Filename: Text;

                begin
                    //import picture
                end;

            }
        }
    }

    var
        myInt: Integer;
}