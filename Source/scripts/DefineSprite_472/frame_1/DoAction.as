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
   p4M.CallProps();
};
CoordUpdate();
alinfolderM.where();
p3T.whereM();
if(DftSpeed < 1)
{
   DftSpeed = _root.m_Speed;
}
if(MCcontent == undefined)
{
   this.p4M.medialink = "";
}
else
{
   this.p4M.medialink = MCcontent;
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
