page 50103 WinterOlympicsList "Winter Olympics List"

{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = WinterOlympics;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; WinterOlympics."No.")
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