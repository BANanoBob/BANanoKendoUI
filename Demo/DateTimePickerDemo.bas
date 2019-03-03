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
	
	BANano.LoadLayout("#maincontainer", "DateTimePickerLayout")
	
	Kendo.OpenConsole
	
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
