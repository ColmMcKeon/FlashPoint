on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   if(_parent.Draw_Window == "yes")
   {
      _root[AttchTxtFile]._x = _root.rulermovie.slider._x - _root[FTxtFile].FocusPointX;
      _root[FTxtFile]._x = _root.rulermovie.slider._x;
   }
   else
   {
      _root.AlignTxtx(AttchTxtFile);
      _parent.CoordUpdate();
   }
}
