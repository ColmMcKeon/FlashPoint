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
   p3T.whereM();
   CoordUpdate();
   p3T.CallProps();
};
CoordUpdate();
alinfolderM.where();
p3T.whereM();
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
