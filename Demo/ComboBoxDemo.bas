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

	Private ComboBox1 As BANanoKendoComboBox
	Private DropDownList1 As BANanoKendoDropDownList
	Private MultiSelect1 As BANanoKendoMultiSelect
	Private AutoComplete1 As BANanoKendoAutoComplete
	
End Sub

Public Sub Initialize
	
	BANano.LoadLayout("#maincontainer", "ComboBoxLayout")
	
	Kendo.OpenConsole

	' ###
	
	Dim Transport As Map = CreateMap("read": CreateMap("url":"./assets/countries.json", "dataType":"json"))

	Dim DataSource1 As BANanoKendoDataSource
	DataSource1.Initialize(Me, "DS1")
	DataSource1.Transport = Transport
	
	ComboBox1.DataTextField = "Name"
	ComboBox1.DataSource = DataSource1

	DropDownList1.DataTextField = "Name"
	DropDownList1.DataSource = DataSource1

	MultiSelect1.DataTextField = "Name"
	MultiSelect1.DataSource = DataSource1

	AutoComplete1.DataTextField = "Name"
	AutoComplete1.DataSource = DataSource1

End Sub

Sub MultiSelect1_Change(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_Change")
End Sub

Sub MultiSelect1_Close(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_Close")
End Sub

Sub MultiSelect1_DataBound(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_DataBound")
End Sub

Sub MultiSelect1_Filtering(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_Filtering")
End Sub

Sub MultiSelect1_Open(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_Open")
End Sub

Sub MultiSelect1_Select(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_Select")
End Sub

Sub MultiSelect1_Deselect(Event As Map)
	Kendo.ConsoleLog("MultiSelect1_Deselect")
End Sub

Sub DropDownList1_Change(Event As Map)
	Kendo.ConsoleLog("DropDownList1_Change")
End Sub

Sub DropDownList1_Close(Event As Map)
	Kendo.ConsoleLog("DropDownList1_Close")
End Sub

Sub DropDownList1_DataBound(Event As Map)
	Kendo.ConsoleLog("DropDownList1_DataBound")
End Sub

Sub DropDownList1_Filtering(Event As Map)
	Kendo.ConsoleLog("DropDownList1_Filtering")
End Sub

Sub DropDownList1_Open(Event As Map)
	Kendo.ConsoleLog("DropDownList1_Open")
End Sub

Sub DropDownList1_Select(Event As Map)
	Kendo.ConsoleLog("DropDownList1_Select")
End Sub

Sub DropDownList1_Cascade(Event As Map)
	Kendo.ConsoleLog("DropDownList1_Cascade")
End Sub

Sub ComboBox1_Change(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Change")
End Sub

Sub ComboBox1_Close(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Close")
End Sub

Sub ComboBox1_DataBound(Event As Map)
	Kendo.ConsoleLog("ComboBox1_DataBound")
End Sub

Sub ComboBox1_Filtering(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Filtering")
End Sub

Sub ComboBox1_Open(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Open")
End Sub

Sub ComboBox1_Select(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Select")
End Sub

Sub ComboBox1_Cascade(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Cascade")
End Sub

Sub AutoComplete1_Change(Event As Map)
	Kendo.ConsoleLog("ComboBox1_Cascade")
End Sub

Sub AutoComplete1_Close(Event As Map)
	Kendo.ConsoleLog("AutoComplete1_Close")
End Sub

Sub AutoComplete1_DataBound(Event As Map)
	Kendo.ConsoleLog("AutoComplete1_DataBound")
End Sub

Sub AutoComplete1_Filtering(Event As Map)
	Kendo.ConsoleLog("AutoComplete1_Filtering")
End Sub

Sub AutoComplete1_Open(Event As Map)
	Kendo.ConsoleLog("AutoComplete1_Open")
End Sub

Sub AutoComplete1_Select(Event As Map)
	Kendo.ConsoleLog("AutoComplete1_Select")
End Sub

Public Sub BeforeUnload()
	Window1.Close
	Kendo.CloseConsole
	BANano.ReturnThen(True)
End Sub



