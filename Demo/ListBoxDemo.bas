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
	Private Listbox1 As BANanoKendoListbox

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "ListboxLayout")
	
	Kendo.OpenConsole

	Dim DataSource As BANanoKendoDataSource
	DataSource.Initialize(Me, "DataSource")
	
	Dim faker As BANanoObject
	faker.Initialize("faker")

	For Counter = 0 To 50
		
		DataSource.Add(CreateMap("firstName": faker.GetField("name").RunMethod("firstName", Null), _
                             "lastName":  faker.GetField("name").RunMethod("lastName", Null)))
		
	Next
	
	Listbox1.Template = "<div>#:firstName# #:lastName#</div>"

	Listbox1.DataSource = DataSource

	Listbox1.SelectItem(0)

End Sub

Sub DataSource_Change(Event As Map)
	
	Dim Action As String = Event.Get("action")
	
	Kendo.ConsoleLog("DataSource_Change: " & Action)
	
End Sub

Sub Listbox1_Add(Event As Map)
	
	Kendo.ConsoleLog("Listbox1_Add")
	
End Sub

Sub Listbox1_Change(Event As Map)

	Kendo.ConsoleLog("Listbox1_Change")
	
	Dim SelectedItems As List = Listbox1.GetSelectedDataSourceItems
	
	For Counter = 0 To SelectedItems.Size - 1
		
		Dim SelectedItem As Map = SelectedItems.Get(Counter)
		
		Kendo.ConsoleLog(SelectedItem.Get("lastName") & ", " & SelectedItem.Get("firstName"))
		
	Next
	
End Sub

Sub Listbox1_DataBound(Event As Map)
	Kendo.ConsoleLog("Listbox1_DataBound")
End Sub

Sub Listbox1_DragStart(Event As Map)
	Kendo.ConsoleLog("Listbox1_DragStart")
End Sub

Sub Listbox1_Drag(Event As Map)
	Kendo.ConsoleLog("Listbox1_Drag")
End Sub

Sub Listbox1_Drop(Event As Map)
	Kendo.ConsoleLog("Listbox1_Drop")
End Sub

Sub Listbox1_DragEnd(Event As Map)
	Kendo.ConsoleLog("Listbox1_DragEnd")
End Sub

Sub Listbox1_Remove(Event As Map)
	Kendo.ConsoleLog("Listbox1_Remove")
End Sub

Sub Listbox1_ReOrder(Event As Map)
	Kendo.ConsoleLog("Listbox1_ReOrder")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
