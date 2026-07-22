function FocusPoint()
{
   this.FocusPointX = _root[FTxtFile].CloseX;
   this.FocusPointY = _root[FTxtFile].CloseY;
}
function CoordUpdate()
{
   if(Sflag != "yes")
   {
      X_start = _root[AttchTxtFile]._x;
      Y_start = _root[AttchTxtFile]._y;
   }
   if(Eflag != "yes")
   {
      X_end = _root[AttchTxtFile]._x;
      Y_end = _root[AttchTxtFile]._y;
   }
}
FTxtFile = this._name;
lng = FTxtFile.length;
AttchTxtFile = FTxtFile.substring(1,lng);
handle2._alpha = 0;
Draw_Window = "yes";
handle2.onPress = function()
{
   this._parent.startDrag(false);
   XposOne = _root[FTxtFile]._x;
   YposOne = _root[FTxtFile]._y;
};
handle2.onRelease = function()
{
   stopDrag();
   XposTwo = _root[FTxtFile]._x;
   YposTwo = _root[FTxtFile]._y;
   NewPosX = XposTwo - XposOne;
   NewPosY = YposTwo - YposOne;
   _root[AttchTxtFile]._x += NewPosX;
   _root[AttchTxtFile]._y += NewPosY;
   alinfolderD.where();
   p3D.whereM();
   CoordUpdate();
};
CoordUpdate();
if(DftSpeed < 1)
{
   DftSpeed = _root.m_Speed;
}
nameOfObj = "O" + AttchTxtFile;
ObjPrefCheck = _root[nameOfObj][3];
i = 0;
while(i < _root.ObjectManager.length)
{
   comObjName = String(_root.ObjectManager[i]);
   if(comObjName == this._name.substring(1) && this.MiniFlag != "open" && ObjPrefCheck != undefined)
   {
      gotoAndPlay(4);
      this.MiniFlag = "open";
   }
   i++;
}
this._alpha = 100;
stop();
