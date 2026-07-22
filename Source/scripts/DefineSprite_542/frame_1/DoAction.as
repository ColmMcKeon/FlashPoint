function changeCol(num)
{
   Number(num);
   endResult = "0x" + num;
   Bkcolor.setRGB(endResult);
   _root.BakColor._x = DockXPos;
   _root.BakColor._y = DockYPos;
   _root.EditPal.BG_flag = "no";
}
function changeColSetUp(ColorNumber)
{
   ColorNumber = String(ColorNumber);
   Bkcolor.setRGB(ColorNumber);
   endResult = ColorNumber;
}
handle6._alpha = 0;
handle6.onPress = function()
{
   this._parent.startDrag(false);
};
handle6.onRelease = function()
{
   stopDrag();
};
stop();
endResult = "0xffffff";
backColor = 16777215;
Bkcolor = new Color(_root.theBackGround);
Bkcolor.setRGB(backColor);
this.swapDepths(6002);
