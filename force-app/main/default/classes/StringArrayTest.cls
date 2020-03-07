public class StringArrayTest
{
integer n=10;
public static list<string> generateStringArray(integer n)
{
list<string> lstTeststring=new list<string>();
for(integer i=0;i<n; i++)
{
string str='Test '+string.valueof(i);
lstTeststring.add(str);

}

return lstTeststring;
}


}