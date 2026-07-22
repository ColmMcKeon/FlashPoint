on(release){
   function Hitclick()
   {
      task = copMov.getData();
   }
   erScren.text = "";
   task = copMov.getData();
   copMov.setChangeHandler("Hitclick");
   CheckValues(task);
}
