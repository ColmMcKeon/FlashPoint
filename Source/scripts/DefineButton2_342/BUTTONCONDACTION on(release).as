on(release){
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   _root.deleteObj(AttchTxtFile);
   removeMovieClip(_root[AttchTxtFile]);
   removeMovieClip(_root[_parent._name]);
}
