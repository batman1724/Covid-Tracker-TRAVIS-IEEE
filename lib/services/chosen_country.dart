class Choose
{
  int chosen_country(String name,Map data)
  {
    String hold="";
    name=name.toLowerCase();
    for(int i=0;i<249;i++)
    {
      hold=data['data'][i]['name'].toString();
      if(hold.toLowerCase().compareTo(name)==0)
        {
            return i;
        }
    }
   return -1;
  }
}