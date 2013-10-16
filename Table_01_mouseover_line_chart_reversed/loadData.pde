void loadData(){
   //load data in
  table = loadTable("Days_pct_hours.csv", "header");
  //println(table.getRowCount() + " toatal rows in table");

  days = new int[table.getRowCount()];
  hours = new float[table.getRowCount()];
  info = new float[table.getRowCount()];
  week = new String[table.getRowCount()];

  int i = 0;
  for (TableRow row: table.rows()) {

    days[i] = row.getInt("day");
    hours[i] = row.getFloat(" hour");
    info[i] = row.getFloat(" info");
    week[i] = row.getString(" day of the week");

    println(days[i]+ " / " +hours[i]+ " / " +info[i]) ;
    i++;
  }
}
