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
	Private ToolBar1 As BANanoKendoToolBar

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "ToolbarLayout")
	
	Kendo.OpenConsole

	' let's add some Toolbar-Items:

	Dim Items As List
	Items.Initialize
	
	Items.Add(CreateMap("type":"button", "id":"button1", "text":"Button1"))
	Items.Add(CreateMap("type":"button", "id":"button2", "text":"Button2"))
	Items.Add(CreateMap("type":"button", "id":"button3", "text":"Button3"))
	Items.Add(CreateMap("type":"separator"))
	
	ToolBar1.Items = Items

	' you can also add a single item:

	ToolBar1.AddItem(CreateMap("type":"button", "id":"togglebutton1", "text":"Toggle Button", "togglable":True))

	' let's add a split-button with menuitems:
	
	Dim MenuButtons As List
	MenuButtons.Initialize
	
	MenuButtons.Add(CreateMap("text":"Menu1", "id":"Menu1"))
	MenuButtons.Add(CreateMap("text":"Menu2", "id":"Menu2"))
	MenuButtons.Add(CreateMap("text":"Menu3", "id":"Menu3"))
	
	ToolBar1.AddItem(CreateMap("type":"splitButton", "id":"splitbutton1", "text":"SplitButton", "menuButtons": MenuButtons))

	' ... and some overflow buttons

	ToolBar1.AddItem(CreateMap("type":"button", "id":"obutton1", "text":"Overflow Button1", "overflow":"always"))
	ToolBar1.AddItem(CreateMap("type":"button", "id":"obutton2", "text":"Overflow Button2", "overflow":"always"))
	ToolBar1.AddItem(CreateMap("type":"button", "id":"obutton3", "text":"Overflow Button3", "overflow":"always"))

	' Remove Button with ID button2
	
	'ToolBar1.RemoveItem("button2")

End Sub

Sub ToolBar1_Click(Event As Map)

	' e.id String
	' The id of the command element.
	Dim ID As String = Event.Get("id")

	' e.target jQuery
	' The jQuery object that represents the command element.
	'
	' e.item Object
	' The item instance of the clicked item.
	'
	' e.sender kendo.ui.ToolBar
	' The widget instance which fired the event.

	Kendo.ConsoleLog("ToolBar1_Click -> Item: " & ID)
	
End Sub

Sub ToolBar1_Close(Event As Map)
	Kendo.ConsoleLog("ToolBar1_Close")
End Sub

Sub ToolBar1_Open(Event As Map)
	Kendo.ConsoleLog("ToolBar1_Open")
End Sub

Sub ToolBar1_Toggle(Event As Map)
	
	' e.id String
	' The id of the command element.
	Dim ID As String = Event.Get("id")

	' e.target jQuery
	' The jQuery object that represents the command element.
	'
	' e.item Object
	' The item instance of the clicked item.
	'
	' e.sender kendo.ui.ToolBar
	' The widget instance which fired the event.
	
	Kendo.ConsoleLog("ToolBar1_Toggle -> Item: " & ID)
	
End Sub

Sub ToolBar1_OverflowClose(Event As Map)
	Kendo.ConsoleLog("ToolBar1_OverflowClose")
End Sub

Sub ToolBar1_OverflowOpen(Event As Map)
	Kendo.ConsoleLog("ToolBar1_OverflowOpen")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
