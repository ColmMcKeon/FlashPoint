on(release){
   if(Iflag == "yes")
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].italic = false;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Iflag = "no";
   }
   else
   {
      FTxtFile = _parent._name;
      lng = FTxtFile.length;
      AttchTxtFile = FTxtFile.substring(1,lng);
      ForAttchTxtFile = AttchTxtFile + "f";
      _root[ForAttchTxtFile].italic = true;
      _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
      Iflag = "yes";
   }
}
