main()
{
 int i,j,k=1,n=4;

 for(i=2;i<=n;i++)
 {
  for(j=1;j<=(n-i)+2;j++)
   printf(" ");
  
  printf("*");
  if(i!=1)
  {
   for(j=1;j<=k;j++)
    printf(" ");
   printf("*");
   k+=2;
  }
   
  printf("\n");
 }

k-=2;
for(i=n;i>1;i--)
 {
  for(j=1;j<=(n-i)+2;j++)
   printf(" ");
  
  printf("*");
  if(i!=1)
  {
   for(j=1;j<=k;j++)
    printf(" ");
   printf("*");
   k-=2;
  }
   
  printf("\n");
 }
 

 return 0;
}
                                                                                                                                 
                                                                                                                                    
