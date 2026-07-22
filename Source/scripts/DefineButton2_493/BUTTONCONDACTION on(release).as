on(release){
   delete _root.Pinpoints();
   delete _root.DotCleanUp();
   _root.CleanUP();
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   DrwaPal = "T" + AttchTxtFile;
   _root[DrwaPal]._x = _root.DockXPos;
   _root[DrwaPal]._y = _root.DockYPos;
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   _root.deleteObj(AttchTxtFile);
   removeMovieClip(_root[AttchTxtFile]);
   removeMovieClip(_root[_parent._name]);
}
