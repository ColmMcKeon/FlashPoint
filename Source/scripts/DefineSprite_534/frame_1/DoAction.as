function ResetAllValues()
{
   dataNum = 1;
   itemNum = 1;
   prefNum = 1;
   keyNum = 1;
   titleNumlist = 1;
   LinkEstab = "No";
   statusBox = "";
}
function buttonPressed(buttonInstance)
{
   if(buttonInstance == sve_btn)
   {
      if(this.savetitle == "" || this.savetitle == "Enter a name")
      {
         this.savetitle = "Enter a name";
         this.statusBox = "Waiting for user";
      }
      else
      {
         if(autSrtBtn.getValue() == true)
         {
            PlayCode = Number(7315366);
            if(autRUNBtn.getValue() == true)
            {
               PlayCode = Number(RunIncNum.text);
            }
         }
         else
         {
            PlayCode = 0;
         }
         this.statusBox = "Launching Save App";
         fscommand("exec","SaveApp.exe");
         delete moviePref;
         moviePref = new Array();
         moviePref.push(savetitle);
         moviePref.push(_root.BakColor.endResult);
         moviePref.push(_root.mp3loader.Themusic);
         trace(PlayCode);
         moviePref.push(PlayCode);
         w = 0;
         while(w < moviePref.length)
         {
            moviePref[w] = String(moviePref[w]);
            w++;
         }
         MakeData();
      }
   }
}
function MakeData()
{
   MovieData = "";
   statusBox = "Writing xml";
   MovieData = "<xml>\r<moviePref>\r";
   i = 0;
   while(i < moviePref.length)
   {
      MovieData = MovieData + "<data" + dataNum + ">" + moviePref[i] + "</data" + dataNum + ">" + "\n";
      dataNum += 1;
      i++;
   }
   statusBox = "Point 1";
   MovieData = MovieData + "</moviePref>" + "\n" + "<objManager>" + "\n";
   i = 0;
   while(i < _root.ObjectManager.length)
   {
      MovieData = MovieData + "<item" + itemNum + ">" + _root.ObjectManager[i] + "</item" + itemNum + ">" + "\n";
      itemNum += 1;
      i++;
   }
   MovieData = MovieData + "</objManager>" + "\n" + "<objPref>" + "\n";
   i = 0;
   while(i < _root.ObjectManager.length)
   {
      ObjPrefs = "O" + _root.ObjectManager[i];
      MovieData = MovieData + "<pref" + prefNum + ">" + "\n";
      j = 0;
      while(j < _root[ObjPrefs].length)
      {
         MovieData = MovieData + "<key" + keyNum + ">" + _root[ObjPrefs][j] + "</key" + keyNum + ">" + "\n";
         keyNum += 1;
         j++;
      }
      MovieData = MovieData + "</pref" + prefNum + ">" + "\n";
      prefNum += 1;
      i++;
   }
   MovieData = MovieData + "</objPref>" + "\n" + "</xml>" + "\n";
   statusBox = "XML Files Created";
   if(MovieData.length >= 35000)
   {
      StartConnect(1);
   }
   else
   {
      StartConnect();
   }
}
function StartConnect(big)
{
   delete LocalConnObj;
   LocalConnObj = new LocalConnection();
   this.onEnterFrame = function()
   {
      LocalConnObj.send("channelD","Handshake","1");
      LocalConnObj.onStatus = function(infoObject)
      {
         if(infoObject.level == "status" && _root.sveWindow.LinkEstab == "No")
         {
            if(big == 1)
            {
               SendBigData();
               statusBox = "Handshake Large Data..";
               _root.sveWindow.LinkEstab = "yes";
            }
            else
            {
               SendData();
               statusBox = "Handshake..";
               _root.sveWindow.LinkEstab = "yes";
            }
            statusBox = "Sending Data..";
         }
         else if(infoObject.level == "error")
         {
            if(_root.sveWindow.LinkEstab == "yes")
            {
               statusBox = "Data Saved";
               delete _root.sveWindow.onEnterFrame;
               delete this.onEnterFrame;
               WaitScrn();
            }
            else
            {
               statusBox = "Connecting..";
            }
         }
      };
   };
}
function SendData()
{
   LocalConnObj.send("channelD","LCData",MovieData);
   statusBox = "Sending XML..";
   sendTitle();
}
function SendBigData()
{
   chunkSize = Math.ceil(MovieData.length / 35000);
   indexnum = 35000;
   nameInc = 1;
   statusBox = "Sending Large XML data..";
   j = 0;
   while(j < chunkSize)
   {
      LocalConnObj.send("channelD","sendPiece",MovieData.substr(j * indexnum,indexnum));
      nameInc += 1;
      j++;
   }
   sendTitle();
}
function sendTitle()
{
   trace("Send Title");
   w = 0;
   while(w < _root.MasterMediaList.length)
   {
      nameOne = String(_root.MasterMediaList[w]);
      compName = String(moviePref[0] + ".xml");
      if(nameOne == compName)
      {
         _root.MasterMediaList.splice(w,1);
      }
      w++;
   }
   MovieTitleinfo = "<xml>\r";
   l = 0;
   while(l < _root.MasterMediaList.length)
   {
      MovieTitleinfo += "<presentation" + titleNumlist + " autostart= \"0\">" + _root.MasterMediaList[l] + "</presentation" + titleNumlist + ">" + "\n";
      titleNumlist += 1;
      l++;
   }
   MovieTitleinfo += "<presentation" + titleNumlist + " autostart= \"" + moviePref[3] + "\">" + moviePref[0] + ".xml</presentation" + titleNumlist + ">" + "\n";
   MovieTitleinfo += "</xml>";
   LocalConnObj.send("channelD","titleData",MovieTitleinfo);
   statusBox = "Sending Title information";
   MovieName = moviePref[0];
   LocalConnObj.send("channelD","titleName",MovieName);
   statusBox = "Sending Movie name";
   this.Backup();
}
function CleanUpAfterSave()
{
   _root.sveWindow.LinkEstab = "No";
   _root.ClearMovie();
   _root.sveWindow._x = _root.DockXPos;
   _root.sveWindow._y = _root.DockYPos;
   _root.EditPal.saveApp = false;
   _root.EditPal._x = _root.DockXPos;
   _root.EditPal._y = _root.DockYPos;
   _root.welcom_box._x = 195.7;
   _root.welcom_box._y = 229.7;
   _root.LoadAllMovieList();
   _root.EditPal.OpenWin = true;
   this.Goflag = "No";
   this.ChainFlag = "No";
   delete receiveReply;
   delete Testlc;
   delete lc;
   delete lcChunk;
   delete lcTitle;
   delete lcName;
}
function Backup()
{
   _root.TossMe.BackupData = this.MovieData;
}
function WaitScrn()
{
   time = getTimer();
   later = time + 2000;
   this.createEmptyMovieClip("temp6",8);
   temp6.onEnterFrame = function()
   {
      time = getTimer();
      if(time >= later)
      {
         statusBox = "Please wait..";
         CleanUpAfterSave();
         delete this.onEnterFrame;
      }
   };
}
ResetAllValues();
receiveReply = new LocalConnection();
connectSuccess = receiveReply.connect("channelE");
statusBox = "Data Transfer Complete.";
receiveReply.Progress = function(msg5)
{
   if(msg5 == "Complete")
   {
      statusBox = "Data Transfer Complete.";
   }
};
receiveReply.connect("channelE");
this.swapDepths(6007);
