codeunit 50111 EIPSalesManagment
{
    TableNo = "Sales Invoice Header";


    procedure ShowInvoice(InvoiceNo: Code[20])
    var
        InvoiceRec: Record "Sales Invoice Header";
        CustomerRec: Record "Customer";
        InvoiceLineRec: Record "Sales Invoice Line";
        Text000: Label 'Invoice No. %1\Customer No. %2\Currency: %3\Count: %4';
    begin
        if InvoiceRec.Get(InvoiceNo) then begin
            InvoiceLineRec.SetRange("Document No.", InvoiceNo);
            InvoiceLineRec.SetRange(Type, InvoiceLineRec.Type::Item);
            InvoiceLineRec.LockTable();
            Message(Text000, InvoiceRec."No.", InvoiceRec."Sell-to Contact No.", CustomerRec."Currency Code", InvoiceLineRec.Count());
        end else begin
            Message('Invoice was not found');
        end;
    end;

    procedure LocationBalance(LocationCode: Code[10])
    var
        CustomerRec: Record "Customer";

    begin

    end;
}
