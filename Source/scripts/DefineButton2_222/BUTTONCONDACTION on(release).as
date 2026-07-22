on(release){
   FTxtFile = _parent._parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   TargetFormat = AttchTxtFile + "f";
   _root[TargetFormat].align = "left";
   _root[AttchTxtFile].setTextFormat(_root[TargetFormat]);
   _root[FTxtFile].pT.Agnflag = "no";
   removeMovieClip(this);
}
