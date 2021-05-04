#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <assert.h>
#include "jtag_atlantic.h"
#include "common.h"

static const char data_to_send[] = "hr";
static const int times_to_send = 1;
static char buf[16];

void help()
{
    fprintf(stderr,
            "jtag_uart_send_cmd [-c <cable_name>] [-d <device nr>] [-i <instance nr>] <command>\n"
            );
}

int main(int argc, char **argv) {

    char *cable_name    = NULL;
    int device          = -1;
    int instance        = -1;

    int c;
    while((c = getopt(argc, argv, "c:d:i:")) != -1){
        switch(c){
            case 'c': 
                cable_name = (char *)malloc(strlen(optarg));
                strcpy(cable_name, optarg);
                break;
            case 'd': 
                device = atoi(optarg);
                break;
            case 'i':
                instance = atoi(optarg);
                break;
            default: 
                help();
                exit(1);
                break;
        }
    }

    if (argc != 2){
        help();
        exit(1);
    }

    JTAGATLANTIC *atlantic = jtagatlantic_open(cable_name, device, instance, argv[0]);
    if(!atlantic) {
        show_err();
        return 1;
    }

    show_info(atlantic);

    fprintf(stderr, "\nUnplug the cable or press ^C to stop.\n\n");

    fprintf(stderr, "Sending command: '%s'.\n", argv[1]);
    int ret = jtagatlantic_write(atlantic, argv[1], strlen(argv[1]));
    fprintf(stderr, "%ld character(s) sent to JTAG UART.\n", strlen(argv[1]));
    assert(ret == strlen(argv[1]));

    jtagatlantic_flush(atlantic);
    while(1) {
        int ret = jtagatlantic_read(atlantic, buf, sizeof(buf));
        if(ret < 0)
            break;
        fwrite(buf, ret, 1, stdout);
        usleep(10000);
    }
    jtagatlantic_close(atlantic);
    return 0;
}
