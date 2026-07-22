on(release){
   FTxtFile = this._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   InfoWin = "I" + AttchTxtFile;
   _root[InfoWin].objDrwn = "yes";
   _root.drawObj(0,0,AttchTxtFile,0);
   _root[InfoWin]._x = _root[InfoWin].CloseX;
   _root[InfoWin]._y = _root[InfoWin].CloseY;
   _root.EditPal.tooltip = "";
   removeMovieClip(this);
}
