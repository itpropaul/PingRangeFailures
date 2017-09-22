# Simply outputs ping failures for a given ip address range to reveal currently available ip addresses
1..255 | % {Test-NetConnection 10.60.0.$_ -InformationLevel Quiet -WarningVariable wv -WarningAction SilentlyContinue| Out-Null; ($wv |sls '\b(?:\d{1,3}\.){3}\d{1,3}\b').Matches.Value}

# Verbose version of the above script
# 1..255 | ForEach-Object {Test-NetConnection 10.60.0.$_ -InformationLevel Quiet -WarningVariable wv -WarningAction SilentlyContinue| Out-Null; $wv |Select-String '\b(?:\d{1,3}\.){3}\d{1,3}\b' |Select-Object -ExpandProperty Matches |Select-Object -ExpandProperty Value}
