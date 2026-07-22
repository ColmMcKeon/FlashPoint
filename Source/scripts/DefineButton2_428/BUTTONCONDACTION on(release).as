on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   _root[AttchTxtFile]._x = this.StarxPoint;
   _root[AttchTxtFile]._y = this.StaryPoint;
   _root.moveObj(AttchTxtFile,this.endXpoint,_parent.DftSpeed,this.endYpoint,_parent.DftSpeed);
}
