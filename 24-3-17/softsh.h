#include <stdio.h>
struct cmdcodes
{
 char c[10];
 int code;
};


int getcmdcode(char *cmd)
{
 int n;
 char ch[10];
 FILE *fp;
 fp=fopen("cmdcode.txt","r");
 while(!feof(fp))
 {
  fscanf(fp,"%s %d",ch,&n);
  if(strcmp(cmd,ch)==0)
  { 
   fclose(fp);
   return n;
  }
 }
 fclose(fp);
 return 0;
}

void cp(char *op1,char *op2)
{
char ch;
FILE *f1,*f2;
f1=fopen(op1,"r");
f2=fopen(op2,"w");

while(!feof(f1))
{
 ch=fgetc(f1);
 fputc(f2,ch);
}
}


}

void mv(char *op1,char *op2)
{



}

void rm(char *op1)
{



}

void cat(char *op1)
{



}

void cd(char *op1)
{



}

void mkdir(char *op1)
{



}


