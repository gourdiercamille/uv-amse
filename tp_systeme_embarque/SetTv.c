#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/time.h>
#include <ctype.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>

#define AREA_TV_BASENAME "TV"
#define NB_ARGS 3
#define STR_LEN 256

void usage(char *);

void usage(char *szPgmName) {
    if (szPgmName == NULL) {
        exit(-1);
    }
    printf("%s <consigne> <drive>\n", szPgmName);
    printf("   avec <drive> = L | R \n");
}

int main(int argc, char *argv[]) {
    char cDriveID;
    char szTargetAreaName[STR_LEN];
    int iFdTarget;
    double *lpdb_Tv;
    double Tv;

    if (argc != NB_ARGS) {
        usage(argv[0]);
        return 0;
    }

    if (sscanf(argv[1], "%lf", &Tv) == 0) {
        fprintf(stderr, "%s.main()  : ERREUR ---> l'argument #1 doit etre reel\n", argv[0]);
        usage(argv[0]);
        return 0;
    }

    if (sscanf(argv[2], "%c", &cDriveID) == 0) {
        fprintf(stderr, "%s.main()  : ERREUR ---> l'argument #2 doit etre un caractere\n", argv[0]);
        usage(argv[0]);
        return 0;
    }

    sprintf(szTargetAreaName, "%s%c", AREA_TV_BASENAME, cDriveID);

    if ((iFdTarget = shm_open(szTargetAreaName, O_RDWR | O_CREAT, 0600)) < 0) {
        fprintf(stderr, "%s.main() :  ERREUR ---> appel a shm_open() \n", argv[0]);
        fprintf(stderr, "             code = %d (%s)\n", errno, strerror(errno));
        exit(-errno);
    } else {
        printf("LIEN a la zone %s\n", szTargetAreaName);
    }

    if (ftruncate(iFdTarget, sizeof(double)) < 0) {
        fprintf(stderr, "%s.main() :  ERREUR ---> appel a ftruncate() #1\n", argv[0]);
        fprintf(stderr, "             code = %d (%s)\n", errno, strerror(errno));
        exit(-errno);
    }

    if ((lpdb_Tv = (double *)(mmap(NULL, sizeof(double), PROT_READ | PROT_WRITE, MAP_SHARED, iFdTarget, 0))) == MAP_FAILED) {
        fprintf(stderr, "%s.main() :  ERREUR ---> appel a mmap() #1\n", argv[0]);
        fprintf(stderr, "             code = %d (%s)\n", errno, strerror(errno));
        exit(-errno);
    }

    *lpdb_Tv = Tv;
    printf("Valeur de Tv mise à jour, nouvelle valeur = %f\n", Tv);

    if (munmap(lpdb_Tv, sizeof(double)) < 0) {
        fprintf(stderr, "%s.main() :  ERREUR ---> appel a munmap()\n", argv[0]);
        fprintf(stderr, "             code = %d (%s)\n", errno, strerror(errno));
        exit(-errno);
    }

    return 0;
}