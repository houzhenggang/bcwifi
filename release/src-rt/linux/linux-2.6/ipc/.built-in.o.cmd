cmd_ipc/built-in.o :=  mipsel-linux-ld  -m elf32ltsmip  -r -o ipc/built-in.o ipc/util.o ipc/msgutil.o ipc/msg.o ipc/sem.o ipc/shm.o ipc/ipc_sysctl.o
