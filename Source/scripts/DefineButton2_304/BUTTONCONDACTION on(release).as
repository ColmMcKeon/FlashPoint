on(release){
   if(Help_flag == "yes")
   {
      _root.HelpWin._x = _root.DockXPos;
      _root.HelpWin._y = _root.DockYPos;
      Help_flag = "no";
   }
   else
   {
      _root.HelpWin._x = _root.EditPal._x + 85;
      _root.HelpWin._y = _root.EditPal._y;
      Help_flag = "yes";
      _root.HelpWin.updateDocs("Welcome_doc");
      _root.HelpWin.Help_list.setSelectedIndex(0);
      _root.MoveScreen._x = _root.DockXPos;
      _root.MoveScreen._y = _root.DockYPos;
      Move_flag = "no";
   }
}
