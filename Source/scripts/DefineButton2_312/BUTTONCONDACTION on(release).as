on(release){
   if(Move_flag == "yes")
   {
      _root.MoveScreen._x = _root.DockXPos;
      _root.MoveScreen._y = _root.DockYPos;
      Move_flag = "no";
   }
   else
   {
      _root.MoveScreen.ResetListPages();
      _root.MoveScreen.erScren.text = "";
      _root.MoveScreen._x = _root.EditPal._x + 85;
      _root.MoveScreen._y = _root.EditPal._y + 90;
      Move_flag = "yes";
   }
}
