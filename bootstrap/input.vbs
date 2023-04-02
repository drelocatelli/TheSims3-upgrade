Dim message
message = WScript.Arguments.Item(0)
message = Replace(message, "\n", vbNewLine)
Dim input
input = InputBox(message)
WScript.Echo input