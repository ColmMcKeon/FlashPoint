function FScrollPaneClass()
{
   function boolToString(str)
   {
      if(str == "false")
      {
         return false;
      }
      if(str == "true")
      {
         return true;
      }
      return str;
   }
   this.init();
   this.width = this._width;
   this.height = this._height;
   this._xscale = this._yscale = 100;
   this.contentWidth = this.contentHeight = 0;
   if(this.hScroll == undefined)
   {
      this.hScroll = this.vScroll = "auto";
      this.dragContent = false;
   }
   this.offset = new Object();
   this.vScroll = boolToString(this.vScroll);
   this.hScroll = boolToString(this.hScroll);
   this.attachMovie("FScrollBarSymbol","hScrollBar_mc",100,{hostStyle:this.styleTable});
   this.hScrollBar_mc.setHorizontal(true);
   this.hScrollBar_mc.setSmallScroll(5);
   this.hScrollBar_mc.setChangeHandler("onScroll",this);
   this.attachMovie("FScrollBarSymbol","vScrollBar_mc",99,{hostStyle:this.styleTable});
   this.vScrollBar_mc.setSmallScroll(5);
   this.vScrollBar_mc.setChangeHandler("onScroll",this);
   this.setSize(this.width,this.height);
   if(this.scrollContent != "")
   {
      this.setScrollContent(this.scrollContent);
   }
   this.setDragContent(this.dragContent);
}
FScrollPaneClass.prototype = new FUIComponentClass();
Object.registerClass("FScrollPaneSymbol",FScrollPaneClass);
FScrollPaneClass.prototype.getScrollContent = function()
{
   return this.content_mc;
};
FScrollPaneClass.prototype.getPaneWidth = function()
{
   return this.width;
};
FScrollPaneClass.prototype.getPaneHeight = function()
{
   return this.height;
};
FScrollPaneClass.prototype.getScrollPosition = function()
{
   var _loc3_ = this.hScrollBar_mc != undefined ? this.hScrollBar_mc.getScrollPosition() : 0;
   var _loc2_ = this.vScrollBar_mc != undefined ? this.vScrollBar_mc.getScrollPosition() : 0;
   return {x:_loc3_,y:_loc2_};
};
FScrollPaneClass.prototype.setScrollContent = function(target)
{
   this.offset.x = 0;
   this.offset.y = 0;
   if(this.content_mc != undefined)
   {
      if(target != this.content_mc)
      {
         this.content_mc._visible = false;
         this.content_mc.removeMovieClip();
         this.content_mc.unloadMovie();
      }
   }
   if(typeof target == "string")
   {
      this.attachMovie(target,"tmp_mc",3);
      this.content_mc = this.tmp_mc;
   }
   else if(target == undefined)
   {
      this.content_mc.unloadMovie();
   }
   else
   {
      this.content_mc = target;
   }
   this.localToGlobal(this.offset);
   this.content_mc._parent.globalToLocal(this.offset);
   this.content_mc._x = this.offset.x;
   this.content_mc._y = this.offset.y;
   var _loc3_ = this.content_mc.getBounds(this);
   this.offset.x = - _loc3_.xMin;
   this.offset.y = - _loc3_.yMin;
   this.localToGlobal(this.offset);
   this.content_mc._parent.globalToLocal(this.offset);
   this.content_mc._x = this.offset.x;
   this.content_mc._y = this.offset.y;
   this.contentWidth = this.content_mc._width;
   this.contentHeight = this.content_mc._height;
   this.content_mc.setMask(this.mask_mc);
   this.setSize(this.width,this.height);
};
FScrollPaneClass.prototype.setSize = function(w, h)
{
   if(arguments.length < 2 || isNaN(w) || isNaN(h))
   {
      return undefined;
   }
   super.setSize(w,h);
   this.width = Math.max(w,60);
   this.height = Math.max(h,60);
   this.boundingBox_mc._xscale = 100;
   this.boundingBox_mc._yscale = 100;
   this.boundingBox_mc._width = this.width;
   this.boundingBox_mc._height = this.height;
   this.setHandV();
   this.initScrollBars();
   if(this.mask_mc == undefined)
   {
      this.attachMovie("FBoundingBoxSymbol","mask_mc",3000);
   }
   this.mask_mc._xscale = 100;
   this.mask_mc._yscale = 100;
   this.mask_mc._width = this.hWidth;
   this.mask_mc._height = this.vHeight;
   this.mask_mc._alpha = 0;
};
FScrollPaneClass.prototype.setScrollPosition = function(x, y)
{
   x = Math.max(this.hScrollBar_mc.minPos,x);
   x = Math.min(this.hScrollBar_mc.maxPos,x);
   y = Math.max(this.vScrollBar_mc.minPos,y);
   y = Math.min(this.vScrollBar_mc.maxPos,y);
   this.hScrollBar_mc.setScrollPosition(x);
   this.vScrollBar_mc.setScrollPosition(y);
};
FScrollPaneClass.prototype.refreshPane = function()
{
   this.setScrollContent(this.content_mc);
};
FScrollPaneClass.prototype.loadScrollContent = function(url, handler, location)
{
   this.content_mc.removeMovieClip();
   this.content_mc.unloadMovie();
   this.content_mc._visible = 0;
   this.loadContent.duplicateMovieClip("loadTemp",3);
   this.dupeFlag = true;
   this.contentLoaded = function()
   {
      this.loadReady = false;
      this.content_mc = this.loadTemp;
      this.refreshPane();
      this.executeCallBack();
   };
   this.setChangeHandler(handler,location);
   this.loadTemp.loadMovie(url);
};
FScrollPaneClass.prototype.setHScroll = function(prop)
{
   this.hScroll = prop;
   this.setSize(this.width,this.height);
};
FScrollPaneClass.prototype.setVScroll = function(prop)
{
   this.vScroll = prop;
   this.setSize(this.width,this.height);
};
FScrollPaneClass.prototype.setDragContent = function(dragFlag)
{
   if(dragFlag)
   {
      this.boundingBox_mc.useHandCursor = true;
      this.boundingBox_mc.onPress = function()
      {
         this._parent.startDragLoop();
      };
      this.boundingBox_mc.tabEnabled = false;
      this.boundingBox_mc.onRelease = this.boundingBox_mc.onReleaseOutside = function()
      {
         this._parent.pressFocus();
         this._parent.onMouseMove = null;
      };
   }
   else
   {
      delete this.boundingBox_mc.onPress;
      this.boundingBox_mc.useHandCursor = false;
   }
};
FScrollPaneClass.prototype.setSmallScroll = function(x, y)
{
   this.hScrollBar_mc.setSmallScroll(x);
   this.vScrollBar_mc.setSmallScroll(y);
};
FScrollPaneClass.prototype.setHandV = function()
{
   if(this.contentHeight - this.height > 2 && this.vScroll != false || this.vScroll == true)
   {
      this.hWidth = this.width - this.vScrollBar_mc._width;
   }
   else
   {
      this.hWidth = this.width;
   }
   if(this.contentWidth - this.width > 2 && this.hScroll != false || this.hScroll == true)
   {
      this.vHeight = this.height - this.hScrollBar_mc._height;
   }
   else
   {
      this.vHeight = this.height;
   }
};
FScrollPaneClass.prototype.startDragLoop = function()
{
   this.tabFocused = false;
   this.myOnSetFocus();
   this.lastX = this._xmouse;
   this.lastY = this._ymouse;
   this.onMouseMove = function()
   {
      this.scrollXMove = this.lastX - this._xmouse;
      this.scrollYMove = this.lastY - this._ymouse;
      this.scrollXMove += this.hScrollBar_mc.getScrollPosition();
      this.scrollYMove += this.vScrollBar_mc.getScrollPosition();
      this.setScrollPosition(this.scrollXMove,this.scrollYMove);
      if(this.scrollXMove < this.hScrollBar_mc.maxPos && this.scrollXMove > this.hScrollBar_mc.minPos)
      {
         this.lastX = this._xmouse;
      }
      if(this.scrollYMove < this.vScrollBar_mc.maxPos && this.scrollYMove > this.vScrollBar_mc.minPos)
      {
         this.lastY = this._ymouse;
      }
      this.updateAfterEvent();
   };
};
FScrollPaneClass.prototype.initScrollBars = function()
{
   this.hScrollBar_mc._y = this.height - this.hScrollBar_mc._height;
   this.hScrollBar_mc.setSize(this.hWidth);
   this.hScrollBar_mc.setScrollProperties(this.hWidth,0,this.contentWidth - this.hWidth);
   this.vScrollBar_mc._visible = this.hWidth != this.width ? true : false;
   this.vScrollBar_mc._x = this.width - this.vScrollBar_mc._width;
   this.vScrollBar_mc.setSize(this.vHeight);
   this.vScrollBar_mc.setScrollProperties(this.vHeight,0,this.contentHeight - this.vHeight);
   this.hScrollBar_mc._visible = this.vHeight != this.height ? true : false;
};
FScrollPaneClass.prototype.onScroll = function(component)
{
   var _loc2_ = component.getScrollPosition();
   var _loc4_ = component._name != "hScrollBar_mc" ? "y" : "x";
   if(component._name == "hScrollBar_mc")
   {
      this.content_mc._x = - _loc2_ + this.offset.x;
   }
   else
   {
      this.content_mc._y = - _loc2_ + this.offset.y;
   }
};
FScrollPaneClass.prototype.myOnKeyDown = function()
{
   var _loc3_ = this.hScrollBar_mc.getScrollPosition();
   var _loc2_ = this.vScrollBar_mc.getScrollPosition();
   if(this.hScrollBar_mc.maxPos > this.hScrollBar_mc.minPos)
   {
      if(Key.isDown(37))
      {
         this.setScrollPosition(_loc3_ - 3,_loc2_);
      }
      else if(Key.isDown(39))
      {
         this.setScrollPosition(_loc3_ + 3,_loc2_);
      }
   }
   if(this.vScrollBar_mc.maxPos > this.vScrollBar_mc.minPos)
   {
      if(Key.isDown(38))
      {
         this.setScrollPosition(_loc3_,_loc2_ - 3);
      }
      else if(Key.isDown(40))
      {
         this.setScrollPosition(_loc3_,_loc2_ + 3);
      }
      else if(Key.isDown(34))
      {
         this.setScrollPosition(_loc3_,_loc2_ + this.vScrollBar_mc.pageSize);
      }
      else if(Key.isDown(33))
      {
         this.setScrollPosition(_loc3_,_loc2_ - this.vScrollBar_mc.pageSize);
      }
   }
};
