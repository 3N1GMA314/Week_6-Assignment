USE AP;
GO

CREATE OR ALTER PROCEDURE dbo.uspGetInvoicesDrillDown
    @VendorID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        InvoiceID,
        VendorID,
        InvoiceNumber,
        InvoiceDate,
        InvoiceTotal,
        PaymentTotal,
        CreditTotal,
        TermsID,
        InvoiceDueDate,
        PaymentDate
    FROM dbo.Invoices
    WHERE @VendorID IS NULL
       OR VendorID = @VendorID
    ORDER BY VendorID, InvoiceID;
END;
GO
