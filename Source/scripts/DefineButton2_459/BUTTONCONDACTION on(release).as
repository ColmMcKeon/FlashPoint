on(release){
   medialink = "flv/VideoPlay.swf";
   Content = medialink;
   _parent.Content = medialink;
   FTxtFile = _parent._name;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   loadMovie(Content,_root[AttchTxtFile]);
   this.createEmptyMovieClip("temp1",1000);
   temp1.onEnterFrame = function()
   {
      if(_root[AttchTxtFile].getBytesLoaded() == _root[AttchTxtFile].getBytesLoaded() && _root[AttchTxtFile].getBytesLoaded() > 10)
      {
      }
      CallProps();
      delete this.onEnterFrame;
   };
   _parent.MCcontent = Content;
}
