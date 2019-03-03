B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 11, 12

Sub Class_Globals

	Private Kendo         As Kendo 'ignore
	Private BANano        As BANano

	Private Window1       As BANanoKendoWindow
	Private Dialog1       As BANanoKendoDialog
	Private Notification1 As BANanoKendoNotification

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "DialogLayout")
	
	Kendo.OpenConsole

	' Defining Dialog-Actions	(the buttons at the bottom of the dialog):
	
	Dim Actions As List
	Actions.Initialize
	
	Actions.Add(CreateMap("text": "OK",      "action": BANano.Callback(Me, "dialogactionok",      Null))) ' When clicked OK, DialogActionOK (see below) will be called
	Actions.Add(CreateMap("text": "NoClose", "action": BANano.Callback(Me, "dialogactionnoclose", Null))) ' When clicked NoClose, DialogActionNoClose (see below) will be called
	Actions.Add(CreateMap("text": "Cancel",  "action": BANano.Callback(Me, "dialogactioncancel",  Null))) ' When clicked Cancel, DialogActionCancel (see below) will be called

	Dialog1.Actions = Actions

	Dialog1.Content = "This is the dialog content"

End Sub

Sub btnOpenDialog_Click(Event As Map)
	
	Dialog1.Open

End Sub

Sub DialogActionOK(Event As Map)

	Notification1.ShowInfo("The Dialog was closed with 'OK'")

	Kendo.ConsoleLog("DialogActionOK-Event")

End Sub

Sub DialogActionCancel(Event As Map)

	Notification1.ShowInfo("The Dialog was closed with 'Cancel'")

	Kendo.ConsoleLog("DialogActionCancel-Event")

End Sub

Sub DialogActionNoClose(Event As Map) As Boolean

	Notification1.ShowInfo("'NoClose' was clicked, but the dialog does not close.")

	Kendo.ConsoleLog("DialogActionNoClose-Event")

	' If you want to prevent the dialog from closing, simply return False

	Return False

End Sub

Sub Dialog1_Close(Event As Map)
	Kendo.ConsoleLog("Dialog1_Close")
End Sub

Sub Dialog1_Hide(Event As Map)
	Kendo.ConsoleLog("Dialog1_Hide")
End Sub

Sub Dialog1_InitOpen(Event As Map)
	Kendo.ConsoleLog("Dialog1_InitOpen")
End Sub

Sub Dialog1_Open(Event As Map)
	Kendo.ConsoleLog("Dialog1_Open")
End Sub

Sub Dialog1_Show(Event As Map)
	Kendo.ConsoleLog("Dialog1_Show")
End Sub

Public Sub BeforeUnload()
	Dialog1.Close
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
