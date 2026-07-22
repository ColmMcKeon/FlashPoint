function where()
{
   this.XCor = _root[AttchTxtFile]._x;
   this.YCor = _root[AttchTxtFile]._y;
}
FTxtFile = _parent._name;
lng = FTxtFile.length;
AttchTxtFile = FTxtFile.substring(1,lng);
where();
