on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   ForAttchTxtFile = AttchTxtFile + "f";
   _root[ForAttchTxtFile].size = fntSze;
   _root[AttchTxtFile].setTextFormat(_root[ForAttchTxtFile]);
}
