on(release){
   if(saveApp == true)
   {
      _root.sveWindow._x = _root.DockXPos;
      _root.sveWindow._y = _root.DockYPos;
      saveApp = false;
      _root.Page = 1;
      _root.thepage = _root.Page;
      _root.PageClean();
   }
   else
   {
      _root.List(1,"yes");
      _root.thepage = Page;
      _root.sveWindow._x = 260.7;
      _root.sveWindow._y = 229.7;
      _root.sveWindow.ResetAllValues();
      _root.MoveScreen._x = _root.DockXPos;
      _root.MoveScreen._y = _root.DockYPos;
      Move_flag = "no";
      saveApp = true;
   }
}
