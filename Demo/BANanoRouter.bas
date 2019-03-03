B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
Sub Class_Globals
	Private BANano As BANano 'ignore
	
	' a map that holds our routes
	Private Routes As Map
	
	' some variables to hold on which page we currently are
	Public Page As Object	
	Public UniqueID As Long
	Public PageName As String
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	Routes.Initialize
	
	' We also want to catch the browsers buttons so we can load the correct page from the history
	' Note: AddEventListener requires the eventname without the 'on' prefix!
	Dim event As Map
	BANano.Window.AddEventListener("popstate", BANano.CallBack(Me, "OnPopState", event), True)
End Sub

public Sub AddRoute(Route As String, PageClass As String)
	Routes.Put(Route.ToLowerCase, PageClass)
End Sub

public Sub NavigateTo(Route As String, withTexts As Boolean, fromPop As Boolean)
	If PageName <> "" Then
		Dim result As Boolean 'ignore
		Dim promise As BANanoPromise
		
		promise.CallSub(Page, "BeforeUnload", Null)
		
		promise.Then(result)
			If result Then
				PageName = Route.ToLowerCase
	
				' We create a new class, based on what we have passed in our Addroute method
				Page = BANano.New(Routes.Get(PageName))
				BANano.CallSub(Page, "Initialize", Array(withTexts))	
			Else
				' not allowed to go back
				If fromPop Then
					' Add page back to the history for the browser buttons
					BANano.History.PushState(CreateMap("currentState": PageName), Null)
				End If
			End If
		promise.End
	Else
		PageName = Route.ToLowerCase
	
		' We create a new class, based on what we have passed in our Addroute method
		Page = BANano.New(Routes.Get(PageName))
		BANano.CallSub(Page, "Initialize", Array(withTexts))	
	End If
End Sub

Sub OnPopState(event As Map) 'ignore
	' Get the current state
	Dim State As Map = event.Get("state")
	If State = Null Then
		' We are back at the homepage, so load it
		Main.Router.NavigateTo("Home", True, True)
	Else
		' Get the state (history)
		Dim CurrentState As String = State.Get("currentState")
		' Load the new layout and the texts
		NavigateTo(CurrentState, True, True)
	End If
End Sub
