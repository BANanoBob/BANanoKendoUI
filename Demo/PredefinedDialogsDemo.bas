B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 11, 12

Sub Class_Globals

	Private BANano As BANano
	Private Kendo As Kendo 'ignore
	
	Private Window1 As BANanoKendoWindow

End Sub

Public Sub Initialize
	
	Kendo.Initialize
	
	BANano.LoadLayout("#maincontainer", "PredefinedDialogsLayout")
	
	Window1.Center
	
End Sub

Sub btnAlert_Click(Event As Map)
	
	Kendo.Alert("Hello!", "This is an predefined Alert dialog.")
	
End Sub

Sub ConfirmOK()
	
	Kendo.Alert("Confirm-Result:", "You have clicked OK")
	
End Sub

Sub ConfirmCancel()
	
	Kendo.Alert("Confirm-Result:", "You have clicked Cancel")
	
End Sub

Sub btnConfirm_Click(Event As Map)
	
	Kendo.Confirm("Hello!", "This is a predefined Confirm dialog", _
									BANano.CallBack(Me, "confirmok", Null), _
									BANano.CallBack(Me, "confirmcancel", Null))
									
End Sub

Sub PromptOK(Data As String)
	
	Kendo.Alert("Prompt-Result:", "You have entered '" & Data & "' and clicked OK")
	
End Sub

Sub PromptCancel()
	
	Kendo.Alert("Prompt-Result:", "You have clicked Cancel")
	
End Sub

Sub btnPrompt_Click(Event As Map)
	
	Dim Data As Map = CreateMap()
	
	Kendo.Prompt("This is the prompt dialog title", "This is the prompt dialog content", "Hello BANano!", _
									BANano.CallBack(Me, "promptok", Array(Data)), _
									BANano.CallBack(Me, "promptcancel", Null))
									
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
