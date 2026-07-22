function InitDefaultVars()
{
   Page = 1;
   FloatCounter.thepage = Page;
   CurrentMode = "Edit";
   Line = 1;
   MediaObj = "P" + Page + "L" + Line;
   DfontSz = 22;
   Dfont = "_sans";
   Dcolor = "0x000000";
   DockXPos = -714;
   DockYpos = 1066;
   s_Speed = 30;
   m_Speed = 15;
   f_Speed = 5;
   winLev = 10;
   maxpage = 0;
   McNameInc = 500;
   DrawStyle = "lines";
   ObjectManager = new Array();
   debug = "in";
   _root.EditPal.OpenWin = false;
   _root.EditPal.saveApp = false;
}
function GetWinready()
{
   EditPal._x = DockXPos;
   EditPal._y = DockYPos;
   HelpWin._x = DockXPos;
   HelpWin._y = DockYPos;
   txtInfoFloater._x = DockXPos;
   txtInfoFloater._y = DockYPos;
   BakColor._x = DockXPos;
   BakColor._y = DockYPos;
   DrwInfoFloater._x = DockXPos;
   DrwInfoFloater._y = DockYPos;
   ibeam._x = DockXPos;
   ibeam._y = DockYPos;
   drawpalete._x = DockXPos;
   drawpalete._y = DockYPos;
   theDot._x = DockXPos;
   theDot._y = DockYPos;
   TossMe._x = DockXPos;
   TossMe._y = DockYPos;
   McinfoFloater._x = DockXPos;
   McinfoFloater._y = DockYPos;
   PlaceHolder._x = DockXPos;
   PlaceHolder._y = DockYPos;
   sveWindow._x = DockXPos;
   sveWindow._y = DockYPos;
   miniPlayer._x = DockXPos;
   miniPlayer._y = DockYPos;
   mp3loader._x = DockXPos;
   mp3loader._y = DockYPos;
   MoveScreen._x = DockXPos;
   MoveScreen._y = DockYPos;
   wait._x = DockXPos;
   wait._y = DockYPos;
   soloErrorMes._x = DockXPos;
   soloErrorMes._y = DockYPos;
}
function ClearMovie()
{
   i = 0;
   while(i < ObjectManager.length)
   {
      DObjPoints = "X" + ObjectManager[i];
      delete _root[DObjPoints];
      DObjPrefs = "O" + ObjectManager[i];
      removeMovieClip(_root[DObjPrefs]);
      InforWinD = "I" + ObjectManager[i];
      removeMovieClip(_root[InforWinD]);
      delete _root[DObjPrefs];
      removeMovieClip(_root[ObjectManager[i]]);
      i++;
   }
   _root.ObjectManager.splice(0,ObjectManager.length);
   thetitle = "";
   _root.sveWindow.savetitle = thetitle;
   BakColor.changeCol("FFFFFF");
   sveWindow.autSrtBtn.setValue(false);
   mp3loader.Themusic = "";
   delete mp3loader.mySound();
   maxpage = 0;
   FloatCounter.theMaxpage = maxpage;
   InitDefaultVars();
}
function SetUpSavedMov()
{
   thetitle = MoviePrefs[0];
   _root.sveWindow.savetitle = thetitle;
   BakColor.changeColSetUp(MoviePrefs[1]);
   if(MoviePrefs[2] != null)
   {
      mp3loader.Themusic = MoviePrefs[2];
      mp3loader.playSong(MoviePrefs[2]);
   }
   MoviePrefs[3] = String(MoviePrefs[3]);
   if(MoviePrefs[3] == "true")
   {
      AutStrtData = true;
   }
   else
   {
      AutStrtData = false;
   }
   sveWindow.autSrtBtn.setValue(AutStrtData);
}
function addObj(item, kind)
{
   Gate_pLocal = item.indexOf("P");
   Gate_lLocal = item.indexOf("L");
   Gate_PageLocal = item.substring(Gate_pLocal + 1,Gate_lLocal);
   if(Gate_PageLocal == Page)
   {
      i = 0;
      while(i < ObjectManager.length)
      {
         OM_pLocal = ObjectManager[i].indexOf("P");
         OM_lLocal = ObjectManager[i].indexOf("L");
         OM_PageLocal = ObjectManager[i].substring(Gate_pLocal + 1,Gate_lLocal);
         if(OM_PageLocal == Page)
         {
         }
         i++;
      }
      ObjectManager.push(item);
      ObjPrefs = "O" + item;
      _root[ObjPrefs] = new Array();
      _root[ObjPrefs].push(kind);
   }
}
function deleteObj(ojc)
{
   i = 0;
   while(i < ObjectManager.length)
   {
      if(ObjectManager[i] == ojc)
      {
         DObjPoints = "X" + ObjectManager[i];
         delete _root[DObjPoints];
         DObjPrefs = "O" + ObjectManager[i];
         delete _root[DObjPrefs];
         ObjectManager.splice(i,1);
      }
      i++;
   }
}
function IncNum()
{
   Line += 1;
   winLev += 1;
   MediaObj = "P" + Page + "L" + Line;
}
function incPage(diff)
{
   Page += diff;
   FloatCounter.thepage = Page;
   Line = 1;
   MediaObj = "P" + Page + "L" + Line;
}
function callIbeam(obj)
{
   winLev += 1;
   ibeam._x = _root._xmouse;
   ibeam._y = _root._ymouse;
   kind = obj;
   ibeam.startDrag();
}
function createWin(xcor, ycor)
{
   ibeam._x = DockXPos;
   ibeam._y = DockYPos;
   addObj(MediaObj,"text");
   infoWin = "I" + MediaObj;
   duplicateMovieClip("_root.txtInfoFloater",infoWin,16384 + winLev);
   this[infoWin]._x = xcor;
   this[infoWin]._y = ycor;
   winLev += 1;
   fire();
}
function MCcreateWin(xcor, ycor)
{
   ibeam._x = DockXPos;
   ibeam._y = DockYPos;
   addObj(MediaObj,"MC");
   infoWin = "I" + MediaObj;
   duplicateMovieClip("_root.McinfoFloater",infoWin,16384 + winLev);
   this[infoWin]._x = xcor;
   this[infoWin]._y = ycor;
   winLev += 1;
   duplicateMovieClip("_root.PlaceHolder",MediaObj,16384 + winLev);
   this[MediaObj]._x = xcor;
   this[MediaObj]._y = ycor;
   IncNum();
}
function DrawcreateWin(xcor, ycor)
{
   ibeam._x = DockXPos;
   ibeam._y = - DockYPos;
   infoWin = "I" + MediaObj;
   theDrawTool = "T" + MediaObj;
   Pinpoints = "P" + MediaObj;
   duplicateMovieClip("_root.DrwInfoFloater",infoWin,16384 + winLev);
   this[infoWin]._x = xcor;
   this[infoWin]._y = ycor;
   winLev += 1;
   duplicateMovieClip("_root.drawpalete",theDrawTool,16384 + winLev);
   this[theDrawTool]._x = xcor + 20;
   this[theDrawTool]._y = ycor + 20;
   winLev += 1;
   this[Pinpoints] = new Array();
   DotCleanUp = new Array();
}
function fire()
{
   ClipName = MediaObj;
   PlaceForText = "I" + MediaObj;
   ClipFrmt = ClipName + "f";
   this.createTextField([ClipName],winLev,_root[PlaceForText]._x,_root[PlaceForText]._y,0,0);
   this[ClipName].type = "input";
   this[ClipName].border = false;
   this[ClipName].autoSize = true;
   this[ClipName].selectable = true;
   this[ClipName].multiline = true;
   this[ClipFrmt] = new TextFormat();
   this[ClipFrmt].font = Dfont;
   this[ClipFrmt].size = DfontSz;
   this[ClipFrmt].color = Dcolor;
   this[ClipFrmt].bold = false;
   this[ClipFrmt].align = "left";
   this[ClipFrmt].italic = false;
   this[ClipFrmt].underline = false;
   this[ClipFrmt].bullet = false;
   this[ClipName].text = "Type Here";
   this[ClipName].setTextFormat(this[ClipFrmt]);
   IncNum();
}
function moveObj(target, new_x, speed_x, new_y, speed_y)
{
   McName = target + "_MC";
   winLev += 1;
   if(_root[target]._x < new_x || _root[target]._y < new_y || _root[target]._x > new_x || _root[target]._y > new_y)
   {
      this.createEmptyMovieClip(McName,winLev);
      _root[McName].onEnterFrame = function()
      {
         var _loc4_ = _root[target]._x;
         var _loc3_ = _root[target]._y;
         _root[target]._x += (new_x - _loc4_) / speed_x;
         _root[target]._y += (new_y - _loc3_) / speed_y;
         if(Math.floor(_root[target]._x) == Math.floor(new_x) && Math.floor(_root[target]._y) == Math.floor(new_y) || Math.ceil(_root[target]._x) == Math.ceil(new_x) && Math.ceil(_root[target]._y) == Math.ceil(new_y))
         {
            delete this.onEnterFrame;
         }
      };
   }
}
function LoadRuler()
{
   if(Rflag == "on")
   {
      rulermovie.removeMovieClip();
      Rflag = "off";
   }
   else
   {
      this.attachMovie("rulerBack1","rulermovie",8);
      rulermovie._x = 0;
      rulermovie._y = 0;
      Rflag = "on";
      winLev += 1;
   }
}
function AlignTxtx(MediaObj)
{
   this[MediaObj]._x = rulermovie.slider._x;
   TempinfoWin = "I" + MediaObj;
   this[TempinfoWin]._x = rulermovie.slider._x;
}
function AlignTxty(MediaObj)
{
   this[MediaObj]._y = rulermovie.slider2._y;
   TempinfoWin = "I" + MediaObj;
   this[TempinfoWin]._y = rulermovie.slider2._y;
}
function drawdot(theX, theY)
{
   name = "dot" + winLev;
   duplicateMovieClip(_root.theDot,name,16384 + winLev);
   DotCleanUp.push(name);
   this[name]._x = theX;
   this[name]._y = theY;
   winLev += 1;
   name = "dot" + winLev;
   this[Pinpoints].push(theX);
   this[Pinpoints].push(theY);
}
function drawObj(fill, colCode, name, thelev)
{
   if(_root.DrawStyle == "lines")
   {
      addObj(name,"draw");
      Drwlines(fill,colCode,name,thelev);
   }
   else
   {
      addObj(name,"draw");
      DrwCircles(fill,colCode,name,thelev);
   }
}
function Drwlines(fill, colCode, name, curLev)
{
   Pinpoints = "P" + name;
   DrawLev = "C" + name;
   Dstyle = "S" + name;
   infoWin = "I" + name;
   if(curLev > 1)
   {
      winLev = curLev;
   }
   End = this[Pinpoints].length / 2;
   _root.createEmptyMovieClip(name,winLev);
   _root[DrawLev] = winlev;
   _root[Dstyle] = "lines";
   infoWin = "I" + name;
   ObjPrefs = "O" + name;
   _root[ObjPrefs].push("lines");
   with(_root[name])
   {
      lineStyle(2,0,100);
      if(fill == 1)
      {
         beginFill(colCode);
         lineStyle(2,colCode,100);
         _root[ObjPrefs].splice(2);
         _root[ObjPrefs].push(1);
         _root[ObjPrefs].push(colCode);
      }
      else
      {
         _root[ObjPrefs].splice(2);
         _root[ObjPrefs].push(0);
         _root[ObjPrefs].push("no color");
      }
      moveTo(this[Pinpoints][0],this[Pinpoints][1]);
      k = 0;
      j = 1;
      _root[infoWin].CloseX = 10000;
      _root[infoWin].CloseY = 10000;
      D = 0;
      while(D < End)
      {
         lineTo(this[Pinpoints][k],this[Pinpoints][j]);
         if(this[Pinpoints][k] < _root[infoWin].CloseX)
         {
            _root[infoWin].CloseX = this[Pinpoints][k];
         }
         if(this[Pinpoints][j] < _root[infoWin].CloseY)
         {
            _root[infoWin].CloseY = this[Pinpoints][j];
         }
         k = j + 1;
         j = K + 1;
         D++;
      }
      lineTo(this[Pinpoints][0],this[Pinpoints][1]);
      if(fill == 1)
      {
         endFill();
      }
      lev += 1;
      ObjPoints = "X" + name;
      _root[ObjPoints] = new Array();
      F = 0;
      while(F < this[Pinpoints].length)
      {
         _root[ObjPoints].push(this[Pinpoints][F]);
         F++;
      }
      _root[infoWin].Awake();
      _root[infoWin]._x = _root[infoWin].xlock;
      _root[infoWin]._y = _root[infoWin].ylock;
      _root[infoWin].CoordUpdate();
      _root[infoWin].FocusPoint();
      CleanUP();
      IncNum();
   }
}
function DrwCircles(fill, colCode, name, curLev)
{
   DrawLev = "C" + name;
   Pinpoints = "P" + name;
   if(curLev > 1)
   {
      winLev = curLev;
   }
   _root.createEmptyMovieClip(name,winLev);
   _root[DrawLev] = winlev;
   ObjPrefs = "O" + name;
   infoWin = "I" + name;
   _root[ObjPrefs].push("circle");
   with(_root[name])
   {
      _root[name].lineStyle(1,0,100);
      rad = this[Pinpoints][2] - this[Pinpoints][0];
      if(fill == 1)
      {
         _root[name].lineStyle(1,colCode,100);
         _root[name].beginFill(colCode);
         _root[ObjPrefs].splice(2);
         _root[ObjPrefs].push(1);
         _root[ObjPrefs].push(colCode);
      }
      else
      {
         _root[ObjPrefs].splice(2);
         _root[ObjPrefs].push(0);
         _root[ObjPrefs].push("no color");
      }
      _root[name].moveTo(this[Pinpoints][2],this[Pinpoints][1]);
      var i = 0;
      while(i < 629)
      {
         a = i / 100;
         r = rad;
         x = r * Math.cos(a);
         y = r * Math.sin(a);
         _root[name].lineTo(x + this[Pinpoints][0],y + this[Pinpoints][1]);
         i++;
      }
   }
   if(fill == 1)
   {
      _root[name].endFill();
   }
   lev += 1;
   _root[infoWin].CloseX = this[Pinpoints][0] - rad;
   _root[infoWin].CloseY = this[Pinpoints][1] - rad;
   ObjPoints = "X" + name;
   _root[ObjPoints] = new Array();
   M = 0;
   while(M < this[Pinpoints].length)
   {
      _root[ObjPoints].push(this[Pinpoints][M]);
      M++;
   }
   _root[infoWin].Awake();
   _root[infoWin]._x = _root[infoWin].xlock;
   _root[infoWin]._y = _root[infoWin].ylock;
   _root[infoWin].CoordUpdate();
   _root[infoWin].FocusPoint();
   CleanUP();
   IncNum();
}
function CleanUP()
{
   i = 0;
   while(i < DotCleanUp.length)
   {
      removeMovieClip(this[DotCleanUp[i]]);
      i++;
   }
}
function goToPage(where)
{
   q = 0;
   while(q < ObjectManager.length)
   {
      Gate_pLocal = ObjectManager[q].indexOf("P");
      Gate_lLocal = ObjectManager[q].indexOf("L");
      Gate_PageLocal = ObjectManager[q].substring(Gate_pLocal + 1,Gate_lLocal);
      if(Gate_PageLocal == Page)
      {
         Objlist = "O" + ObjectManager[q];
         if(this[Objlist][0] == "text")
         {
            GetTxtParam(Objlist);
         }
         else if(this[Objlist][0] == "MC")
         {
            GetMCParam(Objlist);
         }
         else if(this[Objlist][0] == "draw")
         {
            GetDrWParam(Objlist);
         }
      }
      q++;
   }
   Page = Number(where);
   FloatCounter.thepage = Page;
   PageClean();
   MaxPages();
}
function List(plusMinus, back)
{
   q = 0;
   while(q < ObjectManager.length)
   {
      Gate_pLocal = ObjectManager[q].indexOf("P");
      Gate_lLocal = ObjectManager[q].indexOf("L");
      Gate_PageLocal = ObjectManager[q].substring(Gate_pLocal + 1,Gate_lLocal);
      if(Gate_PageLocal == Page)
      {
         Objlist = "O" + ObjectManager[q];
         if(this[Objlist][0] == "text")
         {
            GetTxtParam(Objlist);
         }
         else if(this[Objlist][0] == "MC")
         {
            GetMCParam(Objlist);
         }
         else if(this[Objlist][0] == "draw")
         {
            GetDrWParam(Objlist);
         }
      }
      q++;
   }
   Page += plusMinus;
   FloatCounter.thepage = Page;
   if(Page < 0 || back == "yes")
   {
      Page = 0;
      back = "No";
      FloatCounter.thepage = Page;
   }
   Line = 1;
   MediaObj = "P" + Page + "L" + Line;
   PageClean();
   MaxPages();
}
function GetTxtParam(TheObj)
{
   FTxtFile = TheObj;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   infoWin = "I" + AttchTxtFile;
   RClipFrmt = AttchTxtFile + "f";
   this[TheObj].splice(1);
   this[TheObj].push(_root[RClipFrmt].font);
   this[TheObj].push(_root[RClipFrmt].size);
   this[TheObj].push(_root[RClipFrmt].color);
   this[TheObj].push(_root[RClipFrmt].bold);
   this[TheObj].push(_root[RClipFrmt].align);
   this[TheObj].push(_root[RClipFrmt].italic);
   this[TheObj].push(_root[RClipFrmt].underline);
   this[TheObj].push(_root[RClipFrmt].bullet);
   this[TheObj].push(_root[AttchTxtFile].text);
   this[TheObj].push(_root[infoWin].X_start);
   this[TheObj].push(_root[infoWin].Y_start);
   this[TheObj].push(_root[infoWin].X_end);
   this[TheObj].push(_root[infoWin].Y_end);
   this[TheObj].push(_root[infoWin].DftSpeed);
}
function GetMCParam(TheObj)
{
   FTxtFile = TheObj;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   infoWin = "I" + AttchTxtFile;
   this[TheObj].splice(1);
   this[TheObj].push(_root[infoWin].MCcontent);
   this[TheObj].push(_root[infoWin].Setheight);
   this[TheObj].push(_root[infoWin].Setwidth);
   this[TheObj].push(_root[infoWin].X_start);
   this[TheObj].push(_root[infoWin].Y_start);
   this[TheObj].push(_root[infoWin].X_end);
   this[TheObj].push(_root[infoWin].Y_end);
   this[TheObj].push(_root[infoWin].DftSpeed);
}
function GetDrWParam(TheObj)
{
   FTxtFile = TheObj;
   lng = FTxtFile.length;
   AttchTxtFile = FTxtFile.substring(1,lng);
   infoWin = "I" + AttchTxtFile;
   PointsObj = "X" + AttchTxtFile;
   this[TheObj].splice(4);
   this[TheObj].push(_root[infoWin].X_start);
   this[TheObj].push(_root[infoWin].Y_start);
   this[TheObj].push(_root[infoWin].X_end);
   this[TheObj].push(_root[infoWin].Y_end);
   this[TheObj].push(_root[infoWin].CloseX);
   this[TheObj].push(_root[infoWin].CloseY);
   this[TheObj].push(_root[infoWin].DftSpeed);
   k = 0;
   while(k < _root[PointsObj].length)
   {
      this[TheObj].push(_root[PointsObj][k]);
      k++;
   }
}
function debugWin()
{
   _root.TossMe.winLevInd = winLev;
   _root.TossMe.results.text = "";
   _root.TossMe.subresults.text = "";
   _root.TossMe.results.text += "Back Color= " + _root.BakColor.endResult + "\n";
   _root.TossMe.results.text += "Music= " + _root._root.mp3loader.Themusic + "\n";
   i = 0;
   while(i < ObjectManager.length)
   {
      ObjPrefs = "O" + ObjectManager[i];
      _root.TossMe.results.text += ObjectManager[i] + "\n";
      _root.TossMe.subresults.text += ObjectManager[i] + "\n";
      j = 0;
      while(j < _root[ObjPrefs].length)
      {
         _root.TossMe.subresults.text += _root[ObjPrefs][j] + "\n";
         j++;
      }
      _root.TossMe.subresults.text += "-----------\r";
      i++;
   }
}
function MaxPages()
{
   i = 0;
   while(i < ObjectManager.length)
   {
      ObjectManager[i] = String(ObjectManager[i]);
      pLocal = ObjectManager[i].indexOf("P");
      lLocal = ObjectManager[i].indexOf("L");
      PageLocal = ObjectManager[i].substring(pLocal + 1,lLocal);
      PageLocal = Number(PageLocal);
      if(PageLocal > maxpage)
      {
         maxpage = PageLocal;
      }
      i++;
   }
   FloatCounter.theMaxpage = maxpage;
   if(CurrentMode == "Live" && Page == maxpage)
   {
      if(mp3loader.Themusic != "")
      {
         _root.mp3loader.fadeSongout();
      }
   }
   if(CurrentMode == "Live" && Page > maxpage)
   {
      Page = 0;
      FloatCounter.thepage = Page;
   }
}
function LiveModeSetup()
{
   CurrentMode = "Live";
   _root.TossMe.state = CurrentMode + " Mode";
   rulermovie.removeMovieClip();
   Rflag = "off";
   _root.EditPal._x = DockXPos;
   _root.EditPal._y = DockYPos;
   _root.miniPlayer._x = 644.4;
   _root.miniPlayer._y = 535.6;
   Page = 0;
   PageClean();
   FloatCounter.thepage = Page;
}
function editModeSetUP()
{
   CurrentMode = "Edit";
   _root.TossMe.state = CurrentMode + " Mode";
   _root.miniPlayer._x = DockXPos;
   _root.miniPlayer._y = DockYPos;
   _root.EditPal._x = 28.1;
   _root.EditPal._y = 34.9;
   Page -= 1;
   if(Page < 1)
   {
      Page = 1;
   }
   PageClean();
   FloatCounter.thepage = Page;
}
function AlterPage(MovInc, EndPage, addon, MinusEndPage)
{
   if(EndPage == undefined)
   {
      EndPage = _root.Page;
   }
   EndPage = Number(EndPage);
   TemPObjMan = new Array();
   deleteList = new Array();
   InsertPoint = _root.Page;
   theLastPage = _root.maxpage;
   if(addon == 2)
   {
      EndPage += 1;
   }
   i = 0;
   while(i < ObjectManager.length)
   {
      ObjPrefs = "O" + ObjectManager[i];
      Ppoint = ObjectManager[i].indexOf("P");
      LPoint = ObjectManager[i].indexOf("L");
      PgNum = ObjectManager[i].substring(Ppoint + 1,LPoint);
      A_part = Number(PgNum);
      B_part = ObjectManager[i].substring(LPoint);
      if(A_part == EndPage)
      {
         TrashObj = String(ObjectManager[i]);
         TrashOjbWin = "I" + TrashObj;
         _root.deleteList.push(TrashObj);
         removeMovieClip(_root[TrashObj]);
         removeMovieClip(_root[TrashOjbWin]);
      }
      i++;
   }
   if(MovInc == -1 && addon != 2)
   {
      i = 0;
      while(i < deleteList.length)
      {
         j = 0;
         while(j < ObjectManager.length)
         {
            String(ObjectManager[j]);
            if(deleteList[i] == ObjectManager[j])
            {
               ObjPrefs = "O" + ObjectManager[j];
               ObjectManager.splice(j,1);
               delete _root[ObjPrefs];
            }
            j++;
         }
         i++;
      }
   }
   i = 0;
   while(i < ObjectManager.length)
   {
      ObjPrefs = "O" + ObjectManager[i];
      Ppoint = ObjectManager[i].indexOf("P");
      LPoint = ObjectManager[i].indexOf("L");
      PgNum = ObjectManager[i].substring(Ppoint + 1,LPoint);
      A_part = Number(PgNum);
      B_part = ObjectManager[i].substring(LPoint);
      if(A_part >= EndPage)
      {
         A_part += MovInc;
      }
      newArName = A_part + B_part;
      TemPObjMan.push(newArName);
      _root[newArName] = _root[ObjPrefs].slice();
      delete _root[ObjPrefs];
      i++;
   }
   ObjectManager.splice(0);
   n = 0;
   while(n < TemPObjMan.length)
   {
      TempObj = TemPObjMan[n];
      NewObj = "P" + TemPObjMan[n];
      ObjectManager.push(NewObj);
      NewPref = "O" + NewObj;
      _root[NewPref] = _root[TempObj].slice();
      delete _root[TempObj];
      n++;
   }
   delete TemPObjMan;
   if(addon == 1 || addon == 4)
   {
      q = 0;
      while(q < TempMvAray.length)
      {
         ItemRaw = TempMvAray[q];
         LoadItem = "P" + TempMvAray[q];
         ObjectManager.push(LoadItem);
         LoadItemPref = "O" + LoadItem;
         _root[LoadItemPref] = _root[ItemRaw].slice();
         delete _root[ItemRaw];
         q++;
      }
      delete _root[LoadItem];
   }
   i = 0;
   while(i < ObjectManager.length)
   {
      pLocal = ObjectManager[i].indexOf("P");
      lLocal = ObjectManager[i].indexOf("L");
      PageLocal = ObjectManager[i].substring(pLocal + 1,lLocal);
      PageLocal = Number(PageLocal);
      i++;
   }
   if(addon == 1 || addon == 4)
   {
      _root.Page = PageLocal;
      FloatCounter.thepage = _root.Page;
   }
   if(addon == 1)
   {
      if(EndPage < MinusEndPage)
      {
         addonSend = 2;
      }
      AlterPage(-1,MinusEndPage,addonSend);
   }
   PageClean();
}
function SwapPage(startpos, endpos, winTasker)
{
   TempMvAray = new Array();
   i = 0;
   while(i < ObjectManager.length)
   {
      ObjPrefs = "O" + ObjectManager[i];
      SPpoint = ObjectManager[i].indexOf("P");
      SLPoint = ObjectManager[i].indexOf("L");
      SPgNum = ObjectManager[i].substring(SPpoint + 1,SLPoint);
      A_part = Number(SPgNum);
      B_part = ObjectManager[i].substring(SLPoint);
      if(A_part == startpos)
      {
         A_part = endpos;
         PushItem = String(A_part + b_part);
         TempMvAray.push(PushItem);
         TempMvItem = PushItem;
         _root[TempMvItem] = _root[ObjPrefs].slice();
         SwapTrashObj = String(ObjectManager[i]);
         SwapTrashOjbWin = "I" + SwapTrashObj;
         removeMovieClip(_root[SwapTrashObj]);
         removeMovieClip(_root[SwapTrashOjbWin]);
         DObjPrefs = "O" + ObjectManager[i];
         if(winTasker == "move")
         {
            ObjectManager.splice(i,1,"deleteMe");
         }
      }
      i++;
   }
   i = 0;
   while(i < ObjectManager.length)
   {
      if(ObjectManager[i] == "deleteMe")
      {
         ObjectManager.splice(i,1);
      }
      i++;
   }
   if(winTasker == "move")
   {
      AlterPage(1,endpos,1,startpos);
   }
   else
   {
      AlterPage(1,endpos,4,startpos);
   }
}
function LivePageShuff(plusMinus)
{
   Page += plusMinus;
   FloatCounter.thepage = Page;
   Line = 1;
   MediaObj = "P" + Page + "L" + Line;
}
function PageClean()
{
   ibeam._x = DockXPos;
   ibeam._y = DockYPos;
   kind = "null";
   PageList = new Array();
   i = 0;
   while(i < ObjectManager.length)
   {
      ObjectManager[i] = String(ObjectManager[i]);
      pLocal = ObjectManager[i].indexOf("P");
      lLocal = ObjectManager[i].indexOf("L");
      PageLocal = ObjectManager[i].substring(pLocal + 1,lLocal);
      PageLocal = Number(PageLocal);
      if(PageLocal != Page)
      {
         removeMovieClip(_root[ObjectManager[i]]);
         infoWin = "I" + ObjectManager[i];
         removeMovieClip(_root[infoWin]);
      }
      else if(PageLocal == Page)
      {
         PageList.push(ObjectManager[i]);
      }
      i++;
   }
   PageSetUP();
}
function PageSetUP()
{
   B = 0;
   while(B < PageList.length)
   {
      winLev += 1;
      ObjAttrb = "O" + PageList[B];
      FirstL = PageList[B].indexOf("L");
      LineLocal = PageList[B].substring(FirstL + 1,FirstL + 6);
      if(LineLocal > 0)
      {
         _root.Line = Number(LineLocal);
      }
      if(_root[ObjAttrb][0] == "MC")
      {
         winLev += 1;
         duplicateMovieClip("_root.PlaceHolder",PageList[B],16384 + winLev);
         _root[PageList[B]]._x = _root[ObjAttrb][4];
         _root[PageList[B]]._y = _root[ObjAttrb][5];
         _root[PageList[B]].Sflag = "yes";
         _root[PageList[B]].Eflag = "yes";
         loadMovie(_root[ObjAttrb][1],_root[PageList[B]]);
         winLev += 1;
         moveObj(PageList[B],_root[ObjAttrb][6],_root[ObjAttrb][8],_root[ObjAttrb][7],_root[ObjAttrb][8]);
         winLev += 1;
         infoWin = "I" + PageList[B];
         duplicateMovieClip("_root.McinfoFloater",infoWin,16384 + winLev);
         winLev += 1;
         _root[infoWin].MCcontent = _root[ObjAttrb][1];
         _root[infoWin].incoming = true;
         _root[infoWin].Setheight = _root[ObjAttrb][2];
         _root[infoWin].Setwidth = _root[ObjAttrb][3];
         _root[infoWin].X_start = _root[ObjAttrb][4];
         _root[infoWin].Y_start = _root[ObjAttrb][5];
         _root[infoWin].X_end = _root[ObjAttrb][6];
         _root[infoWin].Y_end = _root[ObjAttrb][7];
         _root[infoWin].DftSpeed = _root[ObjAttrb][8];
         _root[infoWin].Sflag = "yes";
         _root[infoWin].Eflag = "yes";
         if(CurrentMode == "Edit")
         {
            this[infoWin]._x = _root[ObjAttrb][6];
            this[infoWin]._y = _root[ObjAttrb][7];
         }
         else
         {
            _root[infoWin]._x = DockXPos;
            _root[infoWin]._y = DockYPos;
         }
      }
      else if(_root[ObjAttrb][0] == "text")
      {
         Objnew_x = _root[ObjAttrb][12];
         Objspeed_x = _root[ObjAttrb][14];
         Objnew_y = _root[ObjAttrb][13];
         Objspeed_y = _root[ObjAttrb][14];
         TClipName = PageList[B];
         winLev += 1;
         PBClipFrmt = PageList[B] + "f";
         this.createTextField([TClipName],winLev,_root[ObjAttrb][10],_root[ObjAttrb][11],0,0);
         this[TClipName].type = "input";
         this[TClipName].border = false;
         this[TClipName].autoSize = true;
         this[TClipName].selectable = true;
         this[TClipName].multiline = true;
         _root[PBClipFrmt] = new TextFormat();
         _root[PBClipFrmt].font = _root[ObjAttrb][1];
         _root[PBClipFrmt].size = _root[ObjAttrb][2];
         _root[PBClipFrmt].color = _root[ObjAttrb][3];
         if(_root[ObjAttrb][4] == "true" || _root[ObjAttrb][4] == true)
         {
            _root[ObjAttrb][4] = true;
         }
         else
         {
            _root[ObjAttrb][4] = false;
         }
         _root[PBClipFrmt].bold = _root[ObjAttrb][4];
         _root[PBClipFrmt].align = _root[ObjAttrb][5];
         if(_root[ObjAttrb][6] == "true" || _root[ObjAttrb][6] == true)
         {
            _root[ObjAttrb][6] = true;
         }
         else
         {
            _root[ObjAttrb][6] = false;
         }
         _root[PBClipFrmt].italic = _root[ObjAttrb][6];
         if(_root[ObjAttrb][7] == "true" || _root[ObjAttrb][7] == true)
         {
            _root[ObjAttrb][7] = true;
         }
         else
         {
            _root[ObjAttrb][7] = false;
         }
         _root[PBClipFrmt].underline = _root[ObjAttrb][7];
         if(_root[ObjAttrb][8] == "true" || _root[ObjAttrb][8] == true)
         {
            _root[ObjAttrb][8] = true;
         }
         else
         {
            _root[ObjAttrb][8] = false;
         }
         _root[PBClipFrmt].bullet = _root[ObjAttrb][8];
         this[TClipName].text = _root[ObjAttrb][9];
         this[TClipName].setTextFormat(_root[PBClipFrmt]);
         winLev += 1;
         moveObj(TClipName,Objnew_x,Objspeed_x,Objnew_y,Objspeed_y);
         winLev += 1;
         infoWin = "I" + PageList[B];
         duplicateMovieClip("_root.txtInfoFloater",infoWin,16384 + winLev);
         winLev += 1;
         _root[infoWin].incoming = true;
         _root[infoWin].X_start = _root[ObjAttrb][10];
         _root[infoWin].Y_start = _root[ObjAttrb][11];
         _root[infoWin].X_end = _root[ObjAttrb][12];
         _root[infoWin].Y_end = _root[ObjAttrb][13];
         _root[infoWin].DftSpeed = _root[ObjAttrb][14];
         _root[infoWin].Sflag = "yes";
         _root[infoWin].Eflag = "yes";
         if(CurrentMode == "Edit")
         {
            _root[infoWin]._x = _root[ObjAttrb][12];
            _root[infoWin]._y = _root[ObjAttrb][13];
         }
         else
         {
            _root[infoWin]._x = DockXPos;
            _root[infoWin]._y = DockYPos;
         }
         winLev += 1;
      }
      else if(_root[ObjAttrb][0] == "draw")
      {
         DClipName = PageList[B];
         winLev += 1;
         TempArrayFix = new Array();
         t = 0;
         while(t < _root[ObjAttrb].length)
         {
            TempArrayFix.push(_root[ObjAttrb][t]);
            t++;
         }
         PB_X_start = _root[ObjAttrb][4];
         PB_Y_start = _root[ObjAttrb][5];
         PB_X_end = _root[ObjAttrb][6];
         PB_Y_end = _root[ObjAttrb][7];
         PB_DftSpeed = _root[ObjAttrb][10];
         PB_CloseX = _root[ObjAttrb][8];
         PB_CloseY = _root[ObjAttrb][9];
         Pinpoints = "P" + PageList[B];
         PinPointNum = _root[ObjAttrb].length - 11;
         delete this[Pinpoints];
         this[Pinpoints] = new Array();
         o = 11;
         A = 0;
         while(A < PinPointNum)
         {
            this[Pinpoints].push(_root[ObjAttrb][o]);
            o += 1;
            A++;
         }
         if(_root[ObjAttrb][1] == "lines")
         {
            Drwlines(_root[ObjAttrb][2],_root[ObjAttrb][3],DClipName,winLev);
            _root[DClipName]._x = PB_X_start;
            _root[DClipName]._y = PB_Y_start;
            moveObj(DClipName,PB_X_end,PB_DftSpeed,PB_Y_end,PB_DftSpeed);
         }
         else
         {
            DrwCircles(_root[ObjAttrb][2],_root[ObjAttrb][3],DClipName,winLev);
            _root[DClipName]._x = PB_X_start;
            _root[DClipName]._y = PB_Y_start;
            moveObj(DClipName,PB_X_end,PB_DftSpeed,PB_Y_end,PB_DftSpeed);
         }
         winLev += 1;
         infoWin = "I" + PageList[B];
         duplicateMovieClip("_root.DrwInfoFloater",infoWin,16384 + winLev);
         winLev += 1;
         _root[infoWin].incoming = true;
         _root[infoWin].X_start = TempArrayFix[4];
         _root[infoWin].Y_start = TempArrayFix[5];
         _root[infoWin].X_end = TempArrayFix[6];
         _root[infoWin].Y_end = TempArrayFix[7];
         _root[infoWin].DftSpeed = TempArrayFix[10];
         _root[infoWin].CloseX = TempArrayFix[8];
         _root[infoWin].CloseY = TempArrayFix[9];
         _root[infoWin].Sflag = "yes";
         _root[infoWin].Eflag = "yes";
         if(CurrentMode == "Edit")
         {
            _root[infoWin]._x = TempArrayFix[6] + TempArrayFix[8];
            _root[infoWin]._y = TempArrayFix[7] + TempArrayFix[9];
         }
         else
         {
            _root[infoWin]._x = DockXPos;
            _root[infoWin]._y = DockYPos;
         }
         _root[ObjAttrb].splice(0);
         e = 0;
         while(e < TempArrayFix.length)
         {
            _root[ObjAttrb].push(TempArrayFix[e]);
            e++;
         }
         delete TempArrayFix;
      }
      B++;
   }
}
function LoadAllMovieList()
{
   delete PresentXML;
   PresentXML = new XML();
   welcom_box.Present_LB.removeAll();
   MasterMediaList = new Array();
   PresentXML.ignoreWhite = true;
   PresentXML.onLoad = function(success)
   {
      if(success)
      {
         Presentchild = PresentXML.firstChild.childNodes;
         m = 0;
         while(m < Presentchild.length)
         {
            welcom_box.Present_LB.addItem(Presentchild[m].firstChild);
            MasterMediaList.push(Presentchild[m].firstChild);
            if(Presentchild[m].attributes.autostart == 7315366 && _root.didthis != "yes")
            {
               LoadPrefs(Presentchild[m].firstChild);
               _root.EditPal.OpenWin = "InAutoMode";
               _root.welcom_box._x = DockXPos;
               _root.welcom_box._y = DockYPos;
               _root.didthis = "yes";
            }
            if(Presentchild[m].attributes.autostart != 7315366 && Presentchild[m].attributes.autostart != 0 && _root.didthis != "yes")
            {
               LoadPrefs(Presentchild[m].firstChild);
               _root.welcom_box._x = DockXPos;
               _root.welcom_box._y = DockYPos;
               AutoRunMode("Run",Presentchild[m].attributes.autostart);
            }
            m++;
         }
         welcom_box.Present_LB.setSelectedIndex(0);
         _root.didthis = "yes";
      }
   };
   PresentXML.load("XML/PresentationList.xml");
}
function LoadPrefs(XmlFile)
{
   DataXML = new XML();
   DataXML.ignoreWhite = true;
   DataXML.onLoad = function(success)
   {
      MoviePrefs = new Array();
      ObjectManager = new Array();
      var _loc2_;
      if(success)
      {
         XML_movPref = DataXML.firstChild.firstChild.childNodes;
         XML_objManager = DataXML.firstChild.firstChild.nextSibling.childNodes;
         i = 0;
         while(i < XML_movPref.length)
         {
            MoviePrefs.push(XML_movPref[i].firstChild);
            i++;
         }
         i = 0;
         while(i < XML_objManager.length)
         {
            ObjectManager.push(XML_objManager[i].firstChild);
            ObjPrefs = "O" + XML_objManager[i].firstChild;
            _root[ObjPrefs] = new Array();
            _root["XML_prefsNodes" + i] = DataXML.firstChild.firstChild.nextSibling.nextSibling.childNodes[i].childNodes;
            j = 0;
            while(j < _root["XML_prefsNodes" + i].length)
            {
               _loc2_ = _root["XML_prefsNodes" + i][j].firstChild.nodeValue.substr(0,1);
               if(_loc2_ == 1 || _loc2_ == 2 || _loc2_ == 3 || _loc2_ == 4 || _loc2_ == 5 || _loc2_ == 6 || _loc2_ == 7 || _loc2_ == 8 || _loc2_ == 9 || _loc2_ == "-")
               {
                  _root[ObjPrefs].push(Number(_root["XML_prefsNodes" + i][j].firstChild.nodeValue));
               }
               else
               {
                  _root[ObjPrefs].push(_root["XML_prefsNodes" + i][j].firstChild.nodeValue);
               }
               j++;
            }
            i++;
         }
      }
      LiveModeSetup();
      SetUpSavedMov();
   };
   DataXML.load("XML/" + XmlFile);
}
function AutoRunMode(cmd, theTImeIncNumber)
{
   ConverttheTImeIncNumber = Number(theTImeIncNumber * 1000);
   if(cmd == "stopthis" && _root.AutoIncRun == "off")
   {
      unloadMovie(_root.theLoop);
   }
   else if(cmd != "stopthis" && _root.AutoIncRun == "on")
   {
      _root.AutoIncRun = "off";
      this.createEmptyMovieClip("initMov",5);
      initMov.onEnterFrame = function()
      {
         if(_root.Page == 0)
         {
            _root.Page = 0;
            _root.FloatCounter.thepage = Page;
            _root.PageClean();
            unloadMovie(_root.initMov);
            if(mp3loader.Themusic != " ")
            {
               _root.mp3loader.cueSong();
            }
            else
            {
               MusicAllReady = "go";
            }
         }
      };
      this.createEmptyMovieClip("SoundCall",21);
      SoundCall.onEnterFrame = function()
      {
         if(MusicAllReady == "go")
         {
            _root.Wait._x = -703;
            _root.Wait._y = 500;
            unloadMovie(_root.SoundCall);
            Nowtime = getTimer();
            later = time + ConverttheTImeIncNumber;
            _root.createEmptyMovieClip("theLoop",9);
            theLoop.onEnterFrame = function()
            {
               Nowtime = getTimer();
               if(Nowtime >= later)
               {
                  _root.List(1);
                  later = Nowtime + ConverttheTImeIncNumber;
               }
               if(_root.CurrentMode == "Live" && _root.Page >= _root.maxpage && _root.maxpage != 0)
               {
                  unloadMovie(_root.theLoop);
               }
            };
         }
         else
         {
            _root.Wait._x = 303.7;
            _root.Wait._y = 552.9;
         }
      };
   }
}
logo._alpha = 10;
NuminMc._alpha = 50;
_root.AutoIncRun = "on";
InitDefaultVars();
GetWinready();
LoadAllMovieList();
CallDebug = new Object();
CallDebug.onKeyDown = function()
{
   _root.TossMe.state = CurrentMode + " Mode";
   if(key.getCode() == 36 && debug == "in")
   {
      _root.TossMe._x = 476.8;
      _root.TossMe._y = 63.4;
      debug = "out";
   }
   else
   {
      _root.TossMe._x = DockXPos;
      _root.TossMe._y = DockYPos;
      debug = "in";
   }
};
Key.addListener(CallDebug);
