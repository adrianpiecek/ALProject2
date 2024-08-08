pageextension 50112 EIPPostedInvoiceManagment extends "Posted Sales Invoices"
{
    actions
    {
        addfirst(Processing)
        {

            action("Show Invoice Details")
            {
                Image = View;
                ApplicationArea = All;
                Caption = 'Show Invoice Details';
                trigger OnAction()
                var
                    InvoiceMngmntCU: Codeunit EIPSalesManagment;
                begin
                    InvoiceMngmntCU.ShowInvoice(Rec."No.");
                end;
            }

        }
        addlast(Category_Category4)
        {
            actionref("Show Invoice Details_Promoted"; "Show Invoice Details")
            {

            }
        }
    }
}
