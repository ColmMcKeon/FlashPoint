function getINf()
{
   yPosinf = "Y= " + slider2._y;
   xPosinf = "X= " + slider._x;
}
slider._x = 346;
slider._y = 14;
slider2._x = 690;
slider2._y = 292;
getINf();
slider.onPress = function()
{
   slider.startDrag(0,675,14,7,14);
   getINf();
};
slider.onRelease = function()
{
   slider.stopDrag();
   getINf();
};
slider2.onPress = function()
{
   slider2.startDrag(0,690,27,690,593);
   getINf();
};
slider2.onRelease = function()
{
   slider2.stopDrag();
   getINf();
};
