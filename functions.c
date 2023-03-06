
int len(char* start)

{
    char *end = start;
    while(*end != '\0')   
        end++;
        return(end - start);   
}
void reverse(char s[])
{
    int i,j;
    char c;
    for(i=0, j=len(s)-1; i<j; i++,j++)
    {
        c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
}
int astoin(char* txt)
{
    int sum, digit, i;
    sum=0;
    for(i=0; i<len(txt); i++)
    {
        digit = txt[i] - 0x30;
        sum = (sum * 10) + digit;
    }
    return sum;
}
void intoas(int n, char s[])
{
    int i, sign;
    if((sign = n)<0)
        n = -n;
    i = 0;
    do{
        s[i++] = n%10 + '0';
    }while ((n /= 10) > 0);
    if(sign < 0)
        s[i++] = '-';
        s[i] = '\0';
        reverse(s);    
}
int main()
{
    return 0;
}