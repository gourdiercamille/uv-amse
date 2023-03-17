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

#define AREA_NAME       "UR"   // nom de la zone partagee
#define AREA_NAME2      "UL"
#define STR_LEN         256    // taille par defaut des chaines

double *szInStr;               // pointeur vers la zone memoire partagee

int main(int argc, char *argv[]) {

  if (argc != 3) {
    printf("Nombre d'arguments invalides\n");
    return 1;
  }

  int iShmFd;                  // descripteur associe a la zone partagee
  void *vAddr;                 // adresse virtuelle sur la zone

  if (strcmp("L", argv[2]) == 0) {
    // tentative d'acces a la zone partagee "UL"
    if ((iShmFd = shm_open(AREA_NAME2, O_RDWR | O_CREAT, 0600)) < 0) {
      // si echec de creation, on tente de se lier sans creer
      printf("Echec de creation, lien seul...\n");
      if ((iShmFd = shm_open(AREA_NAME2, O_RDWR, STR_LEN)) < 0) {
        fprintf(stderr, "ERREUR : appel a shm_open()\n");
        fprintf(stderr, "         code  = %d (%s)\n", errno, strerror(errno));
        return -errno;
      }
    }
  } else {
    // tentative d'acces a la zone partagee "UR"
    if ((iShmFd = shm_open(AREA_NAME, O_RDWR | O_CREAT, 0600)) < 0) {
      // si echec de creation, on tente de se lier sans creer
      printf("Echec de creation, lien seul...\n");
      if ((iShmFd = shm_open(AREA_NAME, O_RDWR, STR_LEN)) < 0) {
        fprintf(stderr, "ERREUR : appel a shm_open()\n");
        fprintf(stderr, "         code  = %d (%s)\n", errno, strerror(errno));
        return -errno;
      }
    }
  }

  // attribution de la taille a la zone partagee
  ftruncate(iShmFd, STR_LEN);
  // tentative de mapping de la zone dans l'espace memoire du processus
  if ((vAddr = mmap(NULL, STR_LEN, PROT_READ | PROT_WRITE, MAP_SHARED, iShmFd, 0)) == NULL) {
    fprintf(stderr, "ERREUR : appel a mmap()\n");
    fprintf(stderr, "         code  = %d (%s)\n", errno, strerror(errno));
    return -errno;
  }

  // initialisation de la valeur de la zone memoire partagee
  szInStr = (double *)vAddr;
  *szInStr = atof(argv[1]);  // conversion du premier argument en nombre a virgule flottante
  printf("%f", *szInStr);

  return 0;
}