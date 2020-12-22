import dotnet/system

type ButtonTests* = ref object of WidgetTests

method CreateWidget(this: ButtonTests): Widget =
  return newButton()