page 50108 "EIP Olympics Info List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Olympic;
    CardPageId = 50107;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
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

                }
                field("Country/Region Code"; rec."Country/Region Code")
                {
                    ApplicationArea = All;

                }
                field("Fun Fact"; rec."Fun Fact")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                field(Image; rec.Image)
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
                    //InfoLink := 'https://www.bing.com/search?q=' + rec.Name + ' ' + rec.City + ' ' + (rec.Type) + ' ' + rec.Year + 'Olympics';
                    //Hyperlink(InfoLink);
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
        end;
    end;
}