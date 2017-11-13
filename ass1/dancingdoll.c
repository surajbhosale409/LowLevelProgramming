#include<stdio.h>
#include<string.h>
#include<sys/ioctl.h>


struct terminalsize
{
 unsigned short row;
 unsigned short col;
 unsigned short xpixel;
 unsigned short ypixel;
};

//structure to store winsize details --similar structure to struct winsize defined in sys/ioctl

int main()
{

 struct terminalsize w;
 char str[100];
 int k,i=0,n;

 ioctl(1,TIOCGWINSZ,&w);

 printf("\nEnter String\n");
 gets(str);
 n=strlen(str);
 
 while(1)
 {


    for(k=0;k<n;k++)
    {
     if(isupper((int)str[k]))
     str[k]=(char) tolower((int)str[k]);
     else
     str[k]=(char) toupper((int)str[k]);
    }

  sleep(1);
  system("clear");
  printf("\033[%d;%df",(w.row/2),(((w.col/2))-(n/2))); //setting cursor to position such that string will appear in mid of terminal 
  printf("%s\n",str);
  //sleep(1);

 }

return 0;

}
