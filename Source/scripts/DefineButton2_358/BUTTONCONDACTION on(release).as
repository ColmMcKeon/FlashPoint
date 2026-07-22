on(release){
   if(Uflag == "yes")
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].italic = false;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Uflag = "no";
   }
   else
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].underline = true;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Uflag = "yes";
   }
}
