B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 10, 11

Sub Class_Globals

	Private BANano    As BANano
	Private Kendo     As Kendo
	
	Private Window1   As BANanoKendoWindow
	Private PanelBar1 As BANanoKendoPanelBar

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "PanelBarLayout")
	
	Kendo.OpenConsole

	Dim Panels As List
	Panels.Initialize
	
	' https://litipsum.com/
	
	Panels.Add(CreateMap("text":"The Adventures of Sherlock Holmes", "contentUrl":"https://litipsum.com/api/adventures-sherlock-holmes/10/p"))
	Panels.Add(CreateMap("text":"Dracula",                           "contentUrl":"https://litipsum.com/api/dracula/10/p"))
	Panels.Add(CreateMap("text":"Dr. Jekyll and Mr. Hyde",           "contentUrl":"https://litipsum.com/api/dr-jekyll-and-mr-hyde/10/p"))

	PanelBar1.AppendPanels(Panels)
	
	' Messages:
	
	' messages.loading
	' messages.requestFailed
	' messages.retry

	 'Dim Messages As Map = CreateMap("loading":"Lade...", "requestFailed":"Fehlgeschlagen", "retry":"Wiederholen") ' "Loading..." / "Request failed." / "Retry"
	 'PanelBar1.Messages = Messages


	' Animation:
	
	' animation.collapse
	' animation.collapse.duration
	' animation.collapse.effects
	' animation.expand
	' animation.expand.duration
	' animation.expand.effects

	' Dim Animation As Map = CreateMap( "collapse": CreateMap("duration":1000, "effects":"fadeOut"), "expand": CreateMap("duration":500, "effects":"expandVertical fadeIn") )
	' PanelBar1.Animation = Animation	
	
End Sub

Sub PanelBar1_Activate(Event As Map)
	Kendo.ConsoleLog("PanelBar1_Activate")
End Sub

Sub PanelBar1_Collapse(Event As Map)
	Kendo.ConsoleLog("PanelBar1_Collapse")
End Sub

Sub PanelBar1_ContentLoad(Event As Map)
	Kendo.ConsoleLog("PanelBar1_ContentLoad")
End Sub

Sub PanelBar1_DataBound(Event As Map)
	Kendo.ConsoleLog("PanelBar1_DataBound")
End Sub

Sub PanelBar1_Error(Event As Map)
	Kendo.ConsoleLog("PanelBar1_Error")
End Sub

Sub PanelBar1_Expand(Event As Map)
	Kendo.ConsoleLog("PanelBar1_Expand")
End Sub

Sub PanelBar1_Select(Event As Map)
	Kendo.ConsoleLog("PanelBar1_Select")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
