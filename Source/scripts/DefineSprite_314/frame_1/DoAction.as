function MapHelpWin()
{
   if(Help_flag == "yes")
   {
      _root.HelpWin._x = _root.EditPal._x + 85;
      _root.HelpWin._y = _root.EditPal._y;
   }
}
thehandle._alpha = 0;
thehandle.onPress = function()
{
   this._parent.startDrag(false);
};
thehandle.onRelease = function()
{
   stopDrag();
   MapHelpWin();
};
this.tooltip = "Edit Mode";
this.swapDepths(6000);
