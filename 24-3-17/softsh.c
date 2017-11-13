#include "softsh.h"



main()
{
char l[500],cmd[10],op1[100],op2[100];
int n;

do
{
system("clear");
printf("sshell:~$ ");
gets(l);

n=sscanf(l,"%s %s %s",cmd,op1,op2);
n=getcmdcode(cmd);

switch(n)
{
 case 1:cp(op1,op2);
        break;
 case 2://mv(op1,op2);
        break;
 case 3://rm(op1);
        break;
 case 4://cat(op1);
        break;
 case 5://cd(op1);
        break;
 case 6://makedir(op1);
        break;

}
}while(strcmp(l,"exit")!=0);

return 0;
}

