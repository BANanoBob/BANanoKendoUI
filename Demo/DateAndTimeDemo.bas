B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 11

Sub Class_Globals

	Private BANano       As BANano
	Private Kendo        As Kendo 'ignore
	
	Private Window1      As BANanoKendoWindow

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "DateAndTimeLayout")
	
	Kendo.OpenConsole
	
End Sub

Sub TimePicker1_Change(Event As Map)
	Kendo.ConsoleLog("TimePicker1_Change")
End Sub

Sub TimePicker1_Close(Event As Map)
	Kendo.ConsoleLog("TimePicker1_Close")
End Sub

Sub TimePicker1_Open(Event As Map)
	Kendo.ConsoleLog("TimePicker1_Open")
End Sub

Sub DateTimePicker1_Change(Event As Map)
	Kendo.ConsoleLog("DateTimePicker1_Change")
End Sub

Sub DateTimePicker1_Close(Event As Map)
	Kendo.ConsoleLog("DateTimePicker1_Close")
End Sub

Sub DateTimePicker1_Open(Event As Map)
	Kendo.ConsoleLog("DateTimePicker1_Open")
End Sub

Sub DatePicker1_Change(Event As Map)
	Kendo.ConsoleLog("DatePicker1_Change")
End Sub

Sub DatePicker1_Close(Event As Map)
	Kendo.ConsoleLog("DatePicker1_Close")
End Sub

Sub DatePicker1_Open(Event As Map)
	Kendo.ConsoleLog("DatePicker1_Open")
End Sub

Sub Calendar1_Change(Event As Map)
	Kendo.ConsoleLog("Calendar1_Change")
End Sub

Sub Calendar1_Navigate(Event As Map)
	Kendo.ConsoleLog("Calendar1_Navigate")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub


