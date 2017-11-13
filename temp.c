#include<stdio.h>


typedef struct magictable
{
unsigned char magic[100];
char type[100];
}magictbl;



main(int argc, char **argv)
{
 int arr[100];
 magictbl *m;
 FILE *fp,*fp1;
unsigned char magic[100];
 char cmd[200],fname[100],cmd1[100];

 int i;
/* 
 fp1=fopen("magictable.tbl","rb");
 fread(&m,5,sizeof(magictbl),fp);
 fclose(fp1);
 */
  gets(fname);

  fp=fopen(fname,"rb");
  fread((void *) magic,1,8,fp);
  printf("\nMagic Number is:\n");
 
  for(i=0;i<4;i++) 
{ 
    printf("%d",(int)magic[i]);
}

return 0;
}
