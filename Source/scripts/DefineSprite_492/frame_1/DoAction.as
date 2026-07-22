function changeCol(num)
{
   if(_parent._parent.objDrwn == "yes")
   {
      Number(num);
      endResult = "0x" + num;
      mycolor.setRGB(endResult);
      curLev = root[AttchTxtFile]._level;
      if(_root[Dstyle] == "lines")
      {
         _root.Drwlines(1,endResult,AttchTxtFile,_root[DrawLev]);
      }
      else
      {
         _root.DrwCircles(1,endResult,AttchTxtFile,_root[DrawLev]);
      }
      _root[FTxtFile]._x = _root[FTxtFile].CloseX;
      _root[FTxtFile]._y = _root[FTxtFile].CloseY;
   }
}
FTxtFile = _parent._parent._name;
lng = FTxtFile.length;
AttchTxtFile = FTxtFile.substring(1,lng);
DrawLev = "C" + AttchTxtFile;
Dstyle = "S" + AttchTxtFile;
masterColor = 0;
mycolor = new Color(targetColor);
mycolor.setRGB(masterColor);
