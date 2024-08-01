table 50113 EIPCarBrand
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[5])
        {

        }
        field(2; Name; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Class; Enum CarClass)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Number of Cars"; Integer)
        {
            Caption = 'Number of Cars of that Brand';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Count(EIPCarModel where(Brand = field(Name)));
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