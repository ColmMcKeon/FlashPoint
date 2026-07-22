function playSong(loadMedia)
{
   if(loadMedia == undefined)
   {
      mySound.loadSound(this.Themusic,false);
   }
   else
   {
      mySound.loadSound(loadMedia,false);
   }
   this.createEmptyMovieClip("temp5",7);
   temp5.onEnterFrame = function()
   {
      bytesLoaded = mySound.getBytesLoaded();
      bytesTotal = mySound.getBytesTotal();
      percentLoaded = Math.round(100 * bytesLoaded / bytesTotal);
      if(percentLoaded > 1)
      {
         loadinInf = Number(percentLoaded) + "%";
         _root.wait.MusicLoad = Number(percentLoaded) + "%";
      }
      else
      {
         loadinInf = 0;
         _root.wait.MusicLoad = 0;
      }
      if(bytesLoaded == bytesTotal && mySound.duration > 0)
      {
         _parent.MusicLoad = "Complete";
         _root.MusicAllReady = "go";
         unloadMovie(this);
      }
   };
}
function cueSong()
{
   this.createEmptyMovieClip("ready",13);
   ready.onEnterFrame = function()
   {
      if(_parent.MusicLoad == "Complete")
      {
         if(SongON == true)
         {
            mysound.stop();
            SongON = false;
            unloadMovie(this);
         }
         else
         {
            mysound.start();
            SongON = true;
            unloadMovie(this);
         }
      }
   };
}
function fadeSongout()
{
   sndLvl = mySound.getVolume();
   this.createEmptyMovieClip("MusicFade",_root.winLev);
   MusicFade.onEnterFrame = function()
   {
      sndLvl -= 1;
      mySound.setVolume(sndLvl);
      if(sndLvl <= 0)
      {
         mySound.Stop();
         SongON = false;
         mySound.setVolume(100);
         unloadMovie(this);
         _root.winLev += 1;
      }
   };
}
handle7._alpha = 0;
handle7.onPress = function()
{
   this._parent.startDrag(false);
};
handle7.onRelease = function()
{
   stopDrag();
};
this.Themusic = " ";
mySound = new Sound();
this.swapDepths(6022);
