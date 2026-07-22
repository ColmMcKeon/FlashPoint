on(release){
   if(OpenWin == true)
   {
      _root.welcom_box._x = _root.DockXPos;
      _root.welcom_box._y = _root.DockYPos;
      OpenWin = false;
   }
   else if(OpenWin == "InAutoMode")
   {
      _root.List(1,"yes");
      _root.welcom_box._x = 195.7;
      _root.welcom_box._y = 229.7;
      OpenWin = false;
   }
   else
   {
      _root.List(1,"yes");
      _root.welcom_box._x = 195.7;
      _root.welcom_box._y = 229.7;
      _root.LoadAllMovieList();
      OpenWin = true;
      _root.MoveScreen._x = _root.DockXPos;
      _root.MoveScreen._y = _root.DockYPos;
      Move_flag = "no";
      _root.mp3loader._x = _root.DockXPos;
      _root.mp3loader._y = _root.DockYPos;
      _root.EditPal.MP3_flag = "no";
      _root.soloErrorMes._x = _root.DockXPos;
      _root.soloErrorMes._y = _root.DockYPos;
      _root.HelpWin._x = _root.DockXPos;
      _root.HelpWin._y = _root.DockYPos;
      _root.EditPal.Help_flag = "no";
   }
}
