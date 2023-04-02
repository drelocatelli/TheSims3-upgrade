Dim message
message = WScript.Arguments.Item(0)
message = Replace(message, "\n", vbNewLine)
MsgBox message
