on(release){
   FontLocal = _parent.fontfolder.getDepth();
   AlignLocal = _parent.alinfolder.getDepth();
   if(AlignLocal < FontLocal)
   {
      this.swapDepths(FontLocal);
   }
}
