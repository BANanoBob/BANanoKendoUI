B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7
@EndOfDesignText@
#IgnoreWarnings: 10, 11

Sub Class_Globals

	Private Kendo As Kendo 'ignore
	Private BANano As BANano
	
	Private Window1      As BANanoKendoWindow
	Private Slider1      As BANanoKendoSlider
	Private Slider2      As BANanoKendoSlider ' a disabled one
	Private RangeSlider1 As BANanoKendoRangeSlider

End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "SliderLayout")
	
	Kendo.OpenConsole
	
	RangeSlider1.StartValue = 1
	RangeSlider1.EndValue = 9
	
End Sub

Sub Slider1_Change(Event As Map)
	
	Dim Slider As BANanoKendoSlider = Sender
	
	Kendo.ConsoleLog("Slider1_Change: " & Slider.Value)
	
End Sub

Sub Slider1_Slide(Event As Map)
	
	Dim SlideValue As Double
	
	SlideValue = Event.Get("value")
	
	Kendo.ConsoleLog("Slider1_Slide: " & SlideValue)
	
End Sub

Sub RangeSlider1_Change(Event As Map)

	Dim Slider As BANanoKendoRangeSlider = Sender
	
	Kendo.ConsoleLog("RangeSlider1_Change: From " & Slider.StartValue & " to " & Slider.EndValue)

End Sub

Sub RangeSlider1_Slide(Event As Map)

	Dim Values()   As Double = Event.Get("values")

	Dim StartValue As Double = Values(0)
	Dim EndValue   As Double = Values(1)
	
	Kendo.ConsoleLog("RangeSlider1_Slide: From " & StartValue & " to " & EndValue)

End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub
