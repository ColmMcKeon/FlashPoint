handle3._alpha = 0;
handle3.onPress = function()
{
   this._parent.startDrag(false);
};
handle3.onRelease = function()
{
   this._parent.stopDrag();
   if(_root.kind == "txt")
   {
      _root.createWin(_root.ibeam._x,_root.ibeam._y);
   }
   else if(_root.kind == "MC")
   {
      _root.MCcreateWin(_root.ibeam._x,_root.ibeam._y);
   }
   else if(_root.kind == "Drw")
   {
      _root.DrawcreateWin(_root.ibeam._x,_root.ibeam._y);
   }
};
this.onEnterFrame = function()
{
   this.swapDepths(6050);
};
