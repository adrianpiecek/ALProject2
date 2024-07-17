table 50106 Olympic
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"No."; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; Type; Option)
        {
            OptionMembers = "Letnia","Zimowa";
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