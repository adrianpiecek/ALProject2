table 50115 EIPCarModel
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[15])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Brand; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Code; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Name; Text[15])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Body Type"; Enum BodyType)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Number of Door"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Weight; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[200])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}