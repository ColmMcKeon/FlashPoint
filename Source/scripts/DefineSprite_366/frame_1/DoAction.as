function click()
{
   btn = fonttype.getData();
   InstFont = btn;
   TargetFormat = AttchTxtFile + "f";
   _root[TargetFormat].font = btn;
   _root[AttchTxtFile].setTextFormat(_root[TargetFormat]);
}
FTxtFile = _parent._name;
lng = FTxtFile.length;
AttchTxtFile = FTxtFile.substring(1,lng);
ForAttchTxtFile = AttchTxtFile + "f";
this.fntSze = _root[ForAttchTxtFile].size;
if(_root[ForAttchTxtFile].font == "_sans")
{
   this.FontRadioSans.setState(true);
}
else
{
   this.FontRadioSerif.setState(true);
}
fonttype.setChangeHandler("click");
