on(release){
   if(Bulflag == "yes")
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].bullet = false;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Bulflag = "no";
   }
   else
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].bullet = true;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Bulflag = "yes";
   }
}
