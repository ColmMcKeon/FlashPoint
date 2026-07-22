on(release){
   if(Bflag == "yes")
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].bold = false;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Bflag = "no";
   }
   else
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].bold = true;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Bflag = "yes";
   }
}
