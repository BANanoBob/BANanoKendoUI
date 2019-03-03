B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 11

Sub Class_Globals

	Private BANano As BANano
	Private Kendo As Kendo 'ignore
	
	Private Window1 As BANanoKendoWindow
	Private ModalWindow1 As BANanoKendoWindow
	
End Sub

Public Sub Initialize
		
	BANano.LoadLayout("#maincontainer", "WindowLayout")

	Kendo.OpenConsole

	Window1.Top = "100px"
	Window1.Left = "200px"

End Sub

Sub btnCenterWindow_Click(Event As Map)
	Window1.Center
End Sub
	
Sub btnOpenWindowModal_Click(Event As Map)
	ModalWindow1.Open
End Sub

Sub Window1_Activate(Event As Map)
	Kendo.ConsoleLog("Window1_Activate")
End Sub

Sub Window1_Close(Event As Map)
	Kendo.ConsoleLog("Window1_Close")
End Sub

Sub Window1_Deactivate(Event As Map)
	Kendo.ConsoleLog("Window1_Deactivate")
End Sub

Sub Window1_Dragend(Event As Map)
	Kendo.ConsoleLog("Window1_Dragend")
End Sub

Sub Window1_Dragstart(Event As Map)
	Kendo.ConsoleLog("Window1_Dragstart")
End Sub

Sub Window1_Error(Event As Map)
	Kendo.ConsoleLog("Window1_Error")
End Sub

Sub Window1_Maximize(Event As Map)
	Kendo.ConsoleLog("Window1_Maximize")
End Sub

Sub Window1_Minimize(Event As Map)
	Kendo.ConsoleLog("Window1_Minimize")
End Sub

Sub Window1_Open(Event As Map)
	Kendo.ConsoleLog("Window1_Open")
End Sub

Sub Window1_Refresh(Event As Map)
	Kendo.ConsoleLog("Window1_Refresh")
End Sub

Sub Window1_Resize(Event As Map)
	Kendo.ConsoleLog("Window1_Resize")
End Sub

Public Sub BeforeUnload()
	
	Window1.Close
	Kendo.CloseConsole
	
	BANano.ReturnThen(True)
	
End Sub

