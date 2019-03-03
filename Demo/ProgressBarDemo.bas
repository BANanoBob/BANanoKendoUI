B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 10, 11

Sub Class_Globals

	Private BANano As BANano
	Private Kendo  As Kendo 'ignore
	
	Private Window1 As BANanoKendoWindow

	Private ProgressBarRegular1       As BANanoKendoProgressBar
	Private ProgressBarRegular2       As BANanoKendoProgressBar
	Private ProgressBarPercent1       As BANanoKendoProgressBar
	Private ProgressBarPercent2       As BANanoKendoProgressBar
	Private ProgressBarChunked1       As BANanoKendoProgressBar
	Private ProgressBarChunked2       As BANanoKendoProgressBar
	Private ProgressBarIndeterminate1 As BANanoKendoProgressBar
	Private ProgressBarIndeterminate2 As BANanoKendoProgressBar
	
	Private TimerIncreaseRegularValue As Timer
	Private TimerIncreasePercentValue As Timer
	Private TimerIncreaseChunkedValue As Timer

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "ProgressBarLayout")
	
	Kendo.OpenConsole

	TimerIncreaseRegularValue.Initialize("TimerIncreaseRegularValue", 1000)
	TimerIncreaseRegularValue.Enabled = True
	
	TimerIncreasePercentValue.Initialize("TimerIncreasePercentValue", 1000)
	TimerIncreasePercentValue.Enabled = True
	
	TimerIncreaseChunkedValue.Initialize("TimerIncreaseChunkedValue", 1000)
	TimerIncreaseChunkedValue.Enabled = True
	
End Sub

Sub TimerIncreaseRegularValue_Tick()
	
	ProgressBarRegular1.IncreaseValue
	ProgressBarRegular2.IncreaseValue
	
End Sub

Sub TimerIncreasePercentValue_Tick()
	
	ProgressBarPercent1.IncreaseValue
	ProgressBarPercent2.IncreaseValue
	
End Sub

Sub TimerIncreaseChunkedValue_Tick()
	
	ProgressBarChunked1.IncreaseValue
	ProgressBarChunked2.IncreaseValue
	
End Sub

' Regular

Sub ProgressBarRegular_Change(Event As Map)

	' Dim ProgressBar As BANanoKendoProgressBar = Sender
	' Kendo.ConsoleLog(ProgressBar.Name & ": ProgressBarRegular_Change()")
	
End Sub

Sub ProgressBarRegular_Complete(Event As Map)
	
	Dim ProgressBar As BANanoKendoProgressBar = Sender

	Kendo.ConsoleLog(ProgressBar.Name & ": ProgressBarRegular_Complete()")

	'	Kendo.ConsoleLog("ProgressBarRegular1.Value: " & ProgressBarRegular1.Value)
	'	Kendo.ConsoleLog("ProgressBarRegular1.Max: " & ProgressBarRegular1.MaxValue)
	'	Kendo.ConsoleLog("ProgressBarRegular2.Value: " & ProgressBarRegular2.Value)
	'	Kendo.ConsoleLog("ProgressBarRegular2.Max: " & ProgressBarRegular2.MaxValue)
	
	If (ProgressBarRegular1.Value = ProgressBarRegular1.MaxValue) And (ProgressBarRegular2.Value = ProgressBarRegular2.MaxValue) Then
		Kendo.ConsoleLog("-> Stopping TimerIncreaseRegularValue")
		TimerIncreaseRegularValue.Enabled = False
	End If

End Sub

' Percent

Sub ProgressBarPercent_Change(Event As Map)
	
	' Dim ProgressBar As BANanoKendoProgressBar = Sender
	' Kendo.ConsoleLog(ProgressBar.Name & ": ProgressBarPercent_Change()")

End Sub

Sub ProgressBarPercent_Complete(Event As Map)
	
	Dim ProgressBar As BANanoKendoProgressBar = Sender

	Kendo.ConsoleLog(ProgressBar.Name & ": ProgressBarPercent_Complete()")

	'	Kendo.ConsoleLog("ProgressBarPercent1.Value: " & ProgressBarPercent1.Value)
	'	Kendo.ConsoleLog("ProgressBarPercent1.Max: " & ProgressBarPercent1.MaxValue)
	'	Kendo.ConsoleLog("ProgressBarPercent2.Value: " & ProgressBarPercent2.Value)
	'	Kendo.ConsoleLog("ProgressBarPercent2.Max: " & ProgressBarPercent2.MaxValue)
	
	If (ProgressBarPercent1.Value = ProgressBarPercent1.MaxValue) And (ProgressBarPercent2.Value = ProgressBarPercent2.MaxValue) Then
		Kendo.ConsoleLog("-> Stopping TimerIncreasePercentValue")
		TimerIncreasePercentValue.Enabled = False
	End If

End Sub

' Chunked

Sub ProgressBarChunked_Change(Event As Map)

	' Dim ProgressBar As BANanoKendoProgressBar = Sender
	' Kendo.ConsoleLog(ProgressBar.Name & ": ProgressBarChunked_Change()")
	
End Sub

Sub ProgressBarChunked_Complete(Event As Map)

	Dim ProgressBar As BANanoKendoProgressBar = Sender

	Kendo.ConsoleLog(ProgressBar.Name & ": ProgressBarChunked_Complete()")
	
	'	Kendo.ConsoleLog("ProgressBarChunked1.Value: " & ProgressBarChunked1.Value)
	'	Kendo.ConsoleLog("ProgressBarChunked1.Max: " & ProgressBarChunked1.MaxValue)
	'	Kendo.ConsoleLog("ProgressBarChunked2.Value: " & ProgressBarChunked2.Value)
	'	Kendo.ConsoleLog("ProgressBarChunked2.Max: " & ProgressBarChunked2.MaxValue)
	
	If (ProgressBarChunked1.Value = ProgressBarChunked1.MaxValue) And (ProgressBarChunked2.Value = ProgressBarChunked2.MaxValue) Then
		Kendo.ConsoleLog("-> Stopping TimerIncreaseChunkedValue")
		TimerIncreaseChunkedValue.Enabled = False
	End If
	
End Sub

Sub Window1_Refresh(Event As Map)
	
	TimerIncreaseRegularValue.Enabled = False
	ProgressBarRegular1.Value = 0
	ProgressBarRegular2.Value = 0
	TimerIncreaseRegularValue.Initialize("TimerIncreaseRegularValue", 1000)
	TimerIncreaseRegularValue.Enabled = True

	' ####

	TimerIncreasePercentValue.Enabled = False
	ProgressBarPercent1.Value = 0
	ProgressBarPercent2.Value = 0
	TimerIncreasePercentValue.Initialize("TimerIncreasePercentValue", 1000)
	TimerIncreasePercentValue.Enabled = True
	
	' ####

	TimerIncreaseChunkedValue.Enabled = False
	ProgressBarChunked1.Value = 0
	ProgressBarChunked2.Value = 0
	TimerIncreaseChunkedValue.Initialize("TimerIncreaseChunkedValue", 1000)
	TimerIncreaseChunkedValue.Enabled = True
	
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
