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



int main()
{
 long j=0,i=0,k;
 char c,str[100];
 struct terminalsize t;
 
 ioctl(1,TIOCGWINSZ,&t);

 while(i<t.col)
{

system("/bin/stty raw");
c = tolower(getchar());
//system("/bin/stty cooked");
 
// c=getchar();
 i++;

 j=0;

 
while(j<t.row)
{

 printf("\033[%d;%df",j,i-1);

 printf("%c",c);
 fflush(stdout);
 for(k=0;k<19999999;k++);
  
 system("clear");
 j++;
}

printf("\033[%d;%df",0,i); 
}

return 0;
}
