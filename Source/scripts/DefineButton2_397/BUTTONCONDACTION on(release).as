on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   if(_parent.Draw_Window == "yes")
   {
      _root[AttchTxtFile]._y = _root.rulermovie.slider2._y - _root[FTxtFile].FocusPointY;
      _root[FTxtFile]._y = _root.rulermovie.slider2._y;
      _root.ibeam._y = _root.rulermovie.slider2._y;
   }
   else
   {
      _root.AlignTxty(AttchTxtFile);
      _parent.CoordUpdate();
   }
}
