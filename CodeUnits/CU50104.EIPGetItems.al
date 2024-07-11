codeunit 50104 GetItems
{
    trigger OnRun()
    begin
        
    end;
    
    procedure GetOlympicItems()
    var
        ItemRec: Record Item;
        StrYear: Text;
        i: Integer;
        WinterOlympicsRec: Record WinterOlympics;
        SummerOlympicsRec: Record SummerOlympics;

    begin
        //czyszczenie tabel
        if WinterOlympicsRec.FindSet() then begin
            repeat
                WinterOlympicsRec.Delete();
            until WinterOlympicsRec.Next()=0;
        end;
        if SummerOlympicsRec.FindSet() then begin
            repeat
                SummerOlympicsRec.Delete();
            until SummerOlympicsRec.Next()=0;
        end;
        //pobieranie rekordów z tabeli Item
        //sprawdzanie czy ostatni znak w polu No. jest równy S czy W
        if ItemRec.FindSet() then begin
            repeat
                if ItemRec."No."[StrLen(ItemRec."No.")] = 'W' then begin
                    WinterOlympicsRec."No." := ItemRec."No.";
                    WinterOlympicsRec.Description := ItemRec.Description;
                    Evaluate(WinterOlympicsRec.Year,CopyStr(ItemRec."No.",1,4));
                    WinterOlympicsRec.Inventory := ItemRec.Inventory;
                    WinterOlympicsRec.Insert();
                end
                else if ItemRec."No."[StrLen(ItemRec."No.")] = 'S' then begin
                    SummerOlympicsRec."No." := ItemRec."No.";
                    SummerOlympicsRec.Description := ItemRec.Description;
                    Evaluate(SummerOlympicsRec.Year,CopyStr(ItemRec."No.",1,4));
                    SummerOlympicsRec.Inventory := ItemRec.Inventory;
                    SummerOlympicsRec.Insert();
                end;
            until ItemRec.Next()=0;
        end;

    end;
}