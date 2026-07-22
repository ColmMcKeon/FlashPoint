on(release){
   if(MP3_flag == "yes")
   {
      _root.mp3loader._x = root.DockXPos;
      _root.mp3loader._y = root.DockYPos;
      MP3_flag = "no";
   }
   else
   {
      _root.mp3loader._x = _root.EditPal._x + 85;
      _root.mp3loader._y = _root.EditPal._y + 60;
      MP3_flag = "yes";
   }
}
