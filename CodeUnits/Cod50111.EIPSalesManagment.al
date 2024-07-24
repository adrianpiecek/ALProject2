codeunit 50111 EIPSalesManagment
{
    TableNo = "Sales Invoice Header";


    local procedure ShowInvoice("No.": Code[20])
    var
        InvoiceRec: Record "Sales Invoice Header";
        CustomerRec: Record "Customer";
        InvoiceLineRec: Record "Sales Invoice Line";
        Text000: Label 'Invoice No. %1\Customer No. %2\Currency: %3\Count: %4';
    begin
        InvoiceRec."No." := "No.";
        if InvoiceRec.Find('=') then begin

            InvoiceLineRec.SetRange("Document No.", "No.", "No.");
            //InvoiceLineRec.SetRange(Type,InvoiceRec.);
            Message(Text000, InvoiceRec."No.", InvoiceRec."Sell-to Contact No.", CustomerRec."Currency Code", InvoiceLineRec.Count());

        end else begin
            Message('Invoice was not found');
        end;
        ;
    end;

}
