function buttonPressed(buttonInstance)
{
   if(buttonInstance == nEWbTN)
   {
      _root.welcom_box._x = _root.DockXPos;
      _root.welcom_box._y = _root.DockYPos;
      _root.EditPal._x = 28.1;
      _root.EditPal._y = 34.9;
      _root.miniPlayer._x = -544.9;
      _root.miniPlayer._y = 34.9;
      _root.ClearMovie();
   }
   else if(buttonInstance == oPN_BTN)
   {
      _root.ClearMovie();
      _root.welcom_box._x = _root.DockXPos;
      _root.welcom_box._y = _root.DockYPos;
      _root.LoadPrefs(Present_LB.getSelectedItem().label);
   }
}
Present_LB.setStyleProperty("background",12770484);
this.swapDepths(6410);
