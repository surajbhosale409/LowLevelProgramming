

int main()
{
char str[20];
char *temp;

gets(str);

while(temp=strtok(str,' '))
{
puts(temp);
}

return 0;
}

