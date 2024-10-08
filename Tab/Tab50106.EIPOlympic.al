table 50106 Olympic
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Type; Enum TypeEnum)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Year; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; City; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Post Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Country/Region Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Fun Fact"; Text[250])
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(9; Image; Media)
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
        Message('OnInsert');
    end;

    trigger OnModify()
    begin
        Message('OnModify');
    end;

    trigger OnDelete()
    begin
        Message('OnDelete');
    end;

    trigger OnRename()
    begin
        Message('OnRename');
    end;


}