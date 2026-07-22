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
};
handle2.onRelease = function()
{
   stopDrag();
   _root[AttchTxtFile]._x = this._parent._x;
   _root[AttchTxtFile]._y = this._parent._y;
   CoordUpdate();
   alinfolderM.where();
   p3M.whereM();
};
CoordUpdate();
if(MCcontent == undefined)
{
   this.p4M.medialink = "";
}
else
{
   this.p4M.medialink = MCcontent;
}
this._alpha = 100;
stop();
