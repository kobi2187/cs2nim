import dotnet/system

type ButtonTests* = ref object of WidgetTests

method createWidget(this: ButtonTests): Widget =
  return newButton()