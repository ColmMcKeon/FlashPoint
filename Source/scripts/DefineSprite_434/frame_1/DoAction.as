function WhereM()
{
   if(_parent.Sflag != "yes")
   {
      this.StarxPoint = math.ceil(_root[AttchTxtFile]._x);
      this.starypoint = math.ceil(_root[AttchTxtFile]._y);
   }
   else
   {
      this.StarxPoint = math.ceil(_parent.X_start);
      this.StaryPoint = math.ceil(_parent.Y_start);
   }
   if(_parent.Eflag != "yes")
   {
      this.endXpoint = math.ceil(_root[AttchTxtFile]._x);
      this.endYpoint = math.ceil(_root[AttchTxtFile]._y);
   }
   else
   {
      this.endXPoint = math.ceil(_parent.X_end);
      this.endYPoint = math.ceil(_parent.Y_end);
   }
}
function start()
{
   _parent.X_start = this.starxpoint;
   _parent.Y_start = this.starypoint;
   this.StarxPoint = _parent.X_start;
   this.StaryPoint = _parent.Y_start;
   _parent.Sflag = "yes";
}
function End()
{
   _parent.X_end = this.endXpoint;
   _parent.Y_end = this.endYpoint;
   this.endXpoint = _parent.X_end;
   this.endYpoint = _parent.Y_end;
   _parent.Eflag = "yes";
}
function Selct()
{
   NewSpeed = speed.getData();
   TargetFormat = AttchTxtFile + "f";
   _parent.DftSpeed = NewSpeed;
}
FTxtFile = _parent._name;
lng = FTxtFile.length;
AttchTxtFile = FTxtFile.substring(1,lng);
WhereM();
compNum = 20;
if(_parent.incoming == true)
{
   this.StarxPoint = _parent.X_start;
   this.starypoint = _parent.Y_start;
   this.endXpoint = _parent.X_end;
   this.endYpoint = _parent.Y_end;
   _parent.Sflag = "yes";
   _parent.Eflag = "yes";
}
if(_parent.DftSpeed < 1)
{
   _parent.DftSpeed = _root.m_Speed;
}
if(_parent.DftSpeed == _root.s_Speed)
{
   slow_comp.setState(checked);
}
else if(_parent.DftSpeed == _root.m_Speed)
{
   med_comp.setState(checked);
}
else if(_parent.DftSpeed == _root.f_Speed)
{
   fst_comp.setState(checked);
}
speed.setChangeHandler("Selct");
