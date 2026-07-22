on(release){
   if(BackupData == undefined)
   {
      this.results.text = "sorry no data";
   }
   else
   {
      this.results.text = BackupData;
   }
}
