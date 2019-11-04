set computerName to computer name of (system info)
on date_to_iso(dt)
	set {year:y, month:m, day:d} to dt
	set y to text 2 through -1 of ((y + 10000) as text)
	set m to text 2 through -1 of ((m + 100) as text)
	set d to text 2 through -1 of ((d + 100) as text)
	return y & "-" & m & "-" & d
end date_to_iso

on date_time_to_iso(dt)
	set {year:y, month:m, day:d, hours:h, minutes:min, seconds:s} to dt
	set y to text 2 through -1 of ((y + 10000) as text)
	set m to text 2 through -1 of ((m + 100) as text)
	set d to text 2 through -1 of ((d + 100) as text)
	set h to text 2 through -1 of ((h + 100) as text)
	set min to text 2 through -1 of ((min + 100) as text)
	set s to text 2 through -1 of ((s + 100) as text)
	return y & "-" & m & "-" & d & "T" & h & "_" & min & "_" & s
end date_time_to_iso

set dt to current date
set fileName to "screen-recording." & computerName & "." & date_time_to_iso(dt)

set screenRecordingFile to fileName & ".mov"
set savePath to (path to documents folder as string)
set screenRecordingPath to (savePath & screenRecordingFile)

close access (open for access file screenRecordingPath with write permission)



tell application "QuickTime Player"
	close front document saving in file screenRecordingPath
end tell




