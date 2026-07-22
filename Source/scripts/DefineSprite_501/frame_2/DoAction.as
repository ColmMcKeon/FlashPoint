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
handle2.onPress = function()
{
   this._parent.startDrag(false);
   XposOne = this._parent._x;
   YposOne = this._parent._y;
};
handle2.onRelease = function()
{
   stopDrag();
   XposTwo = this._parent._x;
   YposTwo = this._parent._y;
   NewPosX = XposTwo - XposOne;
   NewPosY = YposTwo - YposOne;
   _root[AttchTxtFile]._x += NewPosX;
   _root[AttchTxtFile]._y += NewPosY;
   alinfolderD.where();
   p3D.whereM();
   CoordUpdate();
};
CoordUpdate();
this._alpha = 100;
stop();
