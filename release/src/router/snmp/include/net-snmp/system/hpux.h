#include "sysv.h"

#ifdef hpux11
#define DONT_USE_NLIST 1
#endif

#undef TCP_TTL_SYMBOL
#ifndef hpux11
#define TCP_TTL_SYMBOL "ipDefaultTTL"
#endif

#ifndef hpux11
/*
 * hpux specific 
 */
#define MIB_IPCOUNTER_SYMBOL "MIB_ipcounter"
#define MIB_TCPCOUNTER_SYMBOL "MIB_tcpcounter"
#define MIB_UDPCOUNTER_SYMBOL "MIB_udpcounter"
#endif

#undef ARPTAB_SYMBOL
#ifndef hpux11
#define ARPTAB_SYMBOL "arphd"
#endif
#undef ARPTAB_SIZE_SYMBOL
#ifndef hpux11
#define ARPTAB_SIZE_SYMBOL "arptab_nb"
#endif

#if defined(hpux10) || defined(hpux11)
#undef SWDEVT_SYMBOL
#undef FSWDEVT_SYMBOL
#undef NSWAPFS_SYMBOL
#undef NSWAPDEV_SYMBOL
#undef LOADAVE_SYMBOL
#undef PROC_SYMBOL
#undef NPROC_SYMBOL
#undef TOTAL_MEMORY_SYMBOL
#undef MBSTAT_SYMBOL
#endif

#ifdef hpux11
#undef IPSTAT_SYMBOL
#undef TCP_SYMBOL
#undef TCPSTAT_SYMBOL
#undef UDB_SYMBOL
#undef UDPSTAT_SYMBOL
#undef ICMPSTAT_SYMBOL
#undef IP_FORWARDING_SYMBOL
#undef RTTABLES_SYMBOL
#undef RTHASHSIZE_SYMBOL
#undef RTHOST_SYMBOL
#undef RTNET_SYMBOL

#undef PHYSMEM_SYMBOL
#endif

/*
 * ARP_Scan_Next needs a 4th ifIndex argument 
 */
#define ARP_SCAN_FOUR_ARGUMENTS

#define rt_pad1 rt_refcnt

#define hpux 1
