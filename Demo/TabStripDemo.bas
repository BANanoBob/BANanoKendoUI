B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 10, 11

Sub Class_Globals

	Private BANano As BANano
	Private Kendo As Kendo 'ignore
	
	Private Window1   As BANanoKendoWindow
	Private TabStrip1 As BANanoKendoTabStrip

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "TabStripLayout")
	
	Kendo.OpenConsole

	TabStrip1.SelectedTab = 0
	
End Sub

Sub TabStrip1_Activate(Event As Map)
	Kendo.ConsoleLog("TabStrip1_Activate")
End Sub

Sub TabStrip1_ContentLoad(Event As Map)
	Kendo.ConsoleLog("TabStrip1_ContentLoad")
End Sub

Sub TabStrip1_Error(Event As Map)
	Kendo.ConsoleLog("TabStrip1_Error")
End Sub

Sub TabStrip1_Select(Event As Map)
	Kendo.ConsoleLog("TabStrip1_Select")
End Sub

Sub TabStrip1_Show(Event As Map)
	Kendo.ConsoleLog("TabStrip1_Show")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
