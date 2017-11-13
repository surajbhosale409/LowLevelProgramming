#include<stdio.h>

typedef struct magictable
{
 int magic[100];
 char type[100];
}magictbl;


main()
{
 magictbl *m;
 FILE *fp;
 int i;  

 fp=fopen("magictable.tbl","r+");
 fread(m,sizeof(magictbl),2,fp);

// for(i=0;i<5;i++)
 // printf("\n%s",m[i].type);

return 0;
}
