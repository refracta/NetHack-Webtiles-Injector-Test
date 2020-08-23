#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

#include <stdbool.h>
#include <json-c/json.h>
#include <bits/time.h>
#include <time.h>

char *SERVER_PATH();
char *CLIENT_PATH();
void die(char *);
int getConnectStatus(struct sockaddr_un);
struct sockaddr_un getPathAddress(char *);
int createSocket(bool isNonBlock);
int bindSocket(int, struct sockaddr_un);
void sendInitMsg(int, struct sockaddr_un);
void handleCore(int, struct sockaddr_un, json_object *, char *);
void handleMsg(int, struct sockaddr_un, json_object *);
void handleSocket(int, struct sockaddr_un);
void initSocket();
void sendMsg(char *);
void sendDebugMsg(int i);
int getch_by_webtiles();
void handleSocketOnce();
void handleSocketLoop();
int getch_nb_by_webtiles();