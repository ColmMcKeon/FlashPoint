on(release){
   if(_root.Page > _root.maxpage)
   {
      _root.soloErrorMes.ErrorTitleBar.text = "Remove Page";
      _root.soloErrorMes.TheMess.text = "!Page " + _root.Page + " has not been saved.";
      _root.soloErrorMes._x = _root.EditPal._x + 85;
      _root.soloErrorMes._y = _root.EditPal._y + 80;
   }
   else
   {
      _root.AlterPage(-1);
   }
}
