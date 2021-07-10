class Formater
{

  String format(String number)
  {
    int length=number.length;
    String hold="";
    int skip=3;
    int counter=0;
    for(int i=length-1;i>=0;i--)
    {
      
      if(counter==skip)
      {
        hold=hold+','+number[i];
        skip=2;
        counter=0;
      }
      else
      hold=hold+number[i];
      counter++;
    }
    number=hold;
    hold="";
    for(int i=number.length-1;i>=0;i--)
    {
      hold=hold+number[i];
    }
    return hold;
  }
}
