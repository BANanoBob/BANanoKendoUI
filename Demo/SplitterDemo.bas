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
	Private Splitter1 As BANanoKendoSplitter
	
End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "SplitterLayout")
	
	Kendo.OpenConsole

	Splitter1.AppendPanel(CreateMap("collapsible":True, "collapsedSize":"30px", "resizable": True))
	Splitter1.AppendPanel(CreateMap("collapsible":False, "resizable": True))

	Splitter1.SetPanelContent(0, "This is Panel 2")
	Splitter1.SetPanelContent(1, "This is Panel 2")


	'panes
	'panes.collapsed
	'panes.collapsedSize
	'panes.collapsible
	'panes.contentUrl
	'panes.max
	'panes.min
	'panes.resizable
	'panes.scrollable
	'panes.size


End Sub

Sub Splitter1_Collapse(Event As Map)
	Kendo.ConsoleLog("Splitter1_Collapse")
End Sub

Sub Splitter1_ContentLoad(Event As Map)
	Kendo.ConsoleLog("Splitter1_ContentLoad")
End Sub

Sub Splitter1_Error(Event As Map)
	Kendo.ConsoleLog("Splitter1_Error")
End Sub

Sub Splitter1_Expand(Event As Map)
	Kendo.ConsoleLog("Splitter1_Expand")
End Sub

Sub Splitter1_LayoutChange(Event As Map)
	Kendo.ConsoleLog("Splitter1_LayoutChange")
End Sub

Sub Splitter1_Resize(Event As Map)
	Kendo.ConsoleLog("Splitter1_Resize")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
