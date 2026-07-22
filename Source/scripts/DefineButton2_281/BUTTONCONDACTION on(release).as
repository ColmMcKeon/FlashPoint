on(release){
   if(BG_flag == "yes")
   {
      _root.BakColor._x = root.DockXPos;
      _root.BakColor._y = root.DockYPos;
      BG_flag = "no";
   }
   else
   {
      _root.BakColor._x = _root.EditPal._x + 85;
      _root.BakColor._y = _root.EditPal._y + 50;
      BG_flag = "yes";
   }
}
