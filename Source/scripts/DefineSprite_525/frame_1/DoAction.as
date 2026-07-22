handle44._alpha = 0;
handle44.onPress = function()
{
   this._parent.startDrag(false);
};
handle44.onRelease = function()
{
   stopDrag();
};
ArrowKey = new Object();
ArrowKey.onKeyDown = function()
{
   if(key.getCode() == 39 && _root.CurrentMode == "Live")
   {
      _root.List(1);
   }
   else if(key.getCode() == 37 && _root.CurrentMode == "Live")
   {
      _root.List(-1);
   }
};
Key.addListener(ArrowKey);
this.swapDepths(6456);
