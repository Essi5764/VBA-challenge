Attribute VB_Name = "Module1"
Sub Stock()
'Set initial variable for the first open date
 Dim First_Open As Double
 First_Open = Cells(2, 3).Value

'Set initial variable for the last close date
 Dim Last_Close As Double

'Set an initial variable for holding the ticket Synmbol
 Dim Ticker_Symbol As String

'Set an initial variable for holding the yearly change per ticket Synmbol
 Dim Yearly_Change As Double

'Set an initial variable for holding the percent change per ticket Synmbol
 Dim Percent_Change As Double

'Set an initial variable for holding The total stock volume per ticket Synmbol
 Dim Total_stock_Vol As Double

'Keep track of the location for each ticket in the summary table
 Dim Summary_Table_Row As Integer
 Summary_Table_Row = 2
'Loop through all the ticket Synmbol
 For i = 2 To 70926
'Add to the total stock volume
 Total_stock_Vol = Total_stock_Vol + Cells(i, 7).Value
'Check if we are still within the same ticket Synmbol, if it is not...
 If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
'Set the ticket Synmbol
 Ticker_Symbol = Cells(i, 1).Value
'Set last close
 Last_Close = Cells(i, 6).Value
'Add to the yearly change
 Yearly_Change = Last_Close - First_Open
'Add to the percent change
 Percent_Change = Yearly_Change / First_Open
'Print the tiket symbol in the Summary Table
 Range("J" & Summary_Table_Row).Value = Ticker_Symbol
'Print the yearly change in the Summary Table
 Range("K" & Summary_Table_Row).Value = Yearly_Change
'Print the percent change to the Summary Table
 Range("L" & Summary_Table_Row).Value = Percent_Change
'Print the total stock volume to the Summary Table
 Range("M" & Summary_Table_Row).Value = Total_stock_Vol
'Add one to the summary table row
 Summary_Table_Row = Summary_Table_Row + 1
'Set first open to go to the next  ticket
 First_Open = Cells(i + 1, 3).Value
'Reset the total stock volume
 Total_stock_Vol = 0
'If the cell immediately following a row is the same brand...
End If
Next i
End Sub
