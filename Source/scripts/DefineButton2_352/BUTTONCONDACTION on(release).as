on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   AlignName = FTxtFile + "AlgnObj";
   if(Agnflag == "yes")
   {
      removeMovieClip(this[AlignName]);
      Agnflag = "no";
   }
   else
   {
      this.attachMovie("alignPallete",AlignName,33);
      this[AlignName]._x = 45;
      this[AlignName]._y = 45;
      Agnflag = "yes";
   }
}
