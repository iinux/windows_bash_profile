#include <stdio.h>
#include <string.h>
#include <unistd.h>

void proBar()
{
    int rate = 0;
    char pro[102];
    memset(pro, 0, sizeof(pro));
    const char* spin="-\\|/";
    while (rate <= 100) {
        printf("[%-100s][%d\%][%c]\r", pro, rate, spin[rate % 4]);
        pro[rate++] = '=';
        usleep(100000);
        fflush(stdout);
    }
    printf("\n");
}
int main()
{
    proBar();
    return 0;
}
