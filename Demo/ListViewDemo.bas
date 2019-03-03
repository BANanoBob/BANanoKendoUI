B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 11

Sub Class_Globals

	Private BANano As BANano
	Private Kendo As Kendo
	
	Private Window1 As BANanoKendoWindow
	Private ListView1 As BANanoKendoListView
	Private Pager1 As BANanoKendoPager

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "ListViewLayout")

	Kendo.OpenConsole

	' ###
	
	ListView1.Template = $"<div class="k-block" style="float:left;margin:10px;width:180px;text-align:center"><div class="k-header">#:firstName# #:lastName#</div><img style="width:128px;height:128px" src="#:avatar#" /></div>"$

	Dim DataSource As BANanoKendoDataSource
	DataSource.Initialize(Me, "DS")
	
	Dim faker As BANanoObject
	faker.Initialize("faker")
	
	For Counter = 1 To 50
		DataSource.Add(CreateMap("firstName": faker.GetField("name").RunMethod("firstName", Null), _
                             "lastName":  faker.GetField("name").RunMethod("lastName", Null), _
                             "avatar":    faker.GetField("internet").RunMethod("avatar", Null) ))
	Next
	
	DataSource.PageSize = 10
	
	ListView1.DataSource = DataSource
	
	Pager1.DataSource = DataSource

End Sub

Sub Pager1_Change(Event As Map)
	Kendo.ConsoleLog("Pager1_Change")
End Sub

Sub ListView1_Cancel(Event As Map)
	Kendo.ConsoleLog("ListView1_Cancel")
End Sub

Sub ListView1_Change(Event As Map)
	Kendo.ConsoleLog("ListView1_Change")
End Sub

Sub ListView1_DataBound(Event As Map)
	Kendo.ConsoleLog("ListView1_DataBound")
End Sub

Sub ListView1_DragBinding(Event As Map)
	Kendo.ConsoleLog("ListView1_DragBinding")
End Sub

Sub ListView1_Edit(Event As Map)
	Kendo.ConsoleLog("ListView1_Edit")
End Sub

Sub ListView1_Remove(Event As Map)
	Kendo.ConsoleLog("ListView1_Remove")
End Sub

Sub ListView1_Save(Event As Map)
	Kendo.ConsoleLog("ListView1_Save")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
