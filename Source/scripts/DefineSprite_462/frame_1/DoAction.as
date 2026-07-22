function CallProps()
{
   if(_parent.incoming == true)
   {
      MCheight = _parent.Setheight;
      MCwidth = _parent.Setwidth;
   }
   else
   {
      MCheight = Math.ceil(_root[AttchTxtFile]._height);
      MCwidth = Math.ceil(_root[AttchTxtFile]._width);
      _parent.Setheight = MCheight;
      _parent.Setwidth = MCwidth;
   }
}
FTxtFile = _parent._name;
lng = FTxtFile.length;
AttchTxtFile = FTxtFile.substring(1,lng);
CallProps();
