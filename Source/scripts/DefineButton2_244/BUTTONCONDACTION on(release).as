on(release){
   if(_root.EditPal.OpenWin == true)
   {
      _root.welcom_box._x = _root.DockXPos;
      _root.welcom_box._y = _root.DockYPos;
      _root.EditPal.OpenWin = false;
      _root.editModeSetUP();
   }
}
