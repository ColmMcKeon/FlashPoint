on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   ColorOb = FTxtFile + "ColObj";
   if(Colflag == "yes")
   {
      removeMovieClip(this[ColorOb]);
      Colflag = "no";
   }
   else
   {
      this.attachMovie("colorPallete",ColorOb,33);
      this[ColorOb]._x = -55;
      this[ColorOb]._y = 20;
      Colflag = "yes";
   }
}
