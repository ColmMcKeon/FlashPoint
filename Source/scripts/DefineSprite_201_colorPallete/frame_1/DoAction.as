function changeCol(num)
{
   Number(num);
   endResult = "0x" + num;
   mycolor.setRGB(endResult);
   FTxtFile = _parent._parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   TargetFormat = AttchTxtFile + "f";
   _root[TargetFormat].color = endResult;
   _root[AttchTxtFile].setTextFormat(_root[TargetFormat]);
   _root[FTxtFile].pT.Colflag = "no";
   removeMovieClip(this);
}
masterColor = 0;
mycolor = new Color(targetColor);
mycolor.setRGB(masterColor);
