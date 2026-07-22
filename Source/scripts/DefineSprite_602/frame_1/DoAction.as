function ResetListPages()
{
   MvePge.text = _root.Page;
   RawCopNum = Number(MvePge.text);
   nextNum = copMov.getData();
   if(nextNum == "copy")
   {
      ToPge.text = RawCopNum + 1;
   }
   else
   {
      ToPge.text = 0;
   }
}
function CheckValues(Thetask)
{
   MvePge.text = Number(MvePge.text);
   ToPge.text = Number(ToPge.text);
   if(MvePge.text == 0 || ToPge.text == 0 || MvePge.text == "" || ToPge.text == "")
   {
      erScren.text = "! Invalid Page Number";
   }
   else if(ToPge.text > _root.maxpage + 1)
   {
      erScren.text = "! Page " + ToPge.text + " has not been saved.";
   }
   else if(MvePge.text > _root.maxpage)
   {
      erScren.text = "! Page " + MvePge.text + "  has not been saved.";
   }
   else if(MvePge.text == "NaN" || ToPge.text == "NaN")
   {
      erScren.text = "! Please enter a page number.";
   }
   else
   {
      _root.SwapPage(MvePge.text,ToPge.text,Thetask);
      _root.MoveScreen._x = -545.8;
      _root.MoveScreen._y = -35.6;
      _root.EditPal.Move_flag = "no";
   }
}
handleOPS.onPress = function()
{
   this._parent.startDrag(false);
};
handleOPS.onRelease = function()
{
   stopDrag();
};
ResetListPages();
this.swapDepths(5797);
