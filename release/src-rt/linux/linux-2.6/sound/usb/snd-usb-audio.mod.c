#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const char __module_depends[]
__attribute_used__
__attribute__((section(".modinfo"))) =
"depends=usbcore,snd-usb-lib,snd-pcm,snd,snd-hwdep";

MODULE_ALIAS("usb:v046Dp0850d*dc*dsc*dp*ic01isc01ip*");
MODULE_ALIAS("usb:v046Dp08F0d*dc*dsc*dp*ic01isc01ip*");
MODULE_ALIAS("usb:v046Dp08F6d*dc*dsc*dp*ic01isc01ip*");
MODULE_ALIAS("usb:v0499p1000d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1001d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1002d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1003d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1004d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0499p1005d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1006d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1007d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1008d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1009d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p100Ad*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0499p100Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p100Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p100Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p100Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1010d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1011d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1012d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1013d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1014d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1015d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1016d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1017d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1018d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1019d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p101Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p101Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p101Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p101Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p101Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p101Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1020d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1021d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1022d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1023d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1024d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1025d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1026d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1027d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1028d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1029d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p102Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p102Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p102Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1030d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1031d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1032d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1033d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1034d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1035d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1036d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1037d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1038d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1039d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p103Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p103Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p103Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p103Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p103Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p103Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1040d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1041d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1042d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1043d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1044d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p1045d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p2000d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p2001d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p2002d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5000d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5001d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5002d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5003d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5004d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5005d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5006d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5007d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5008d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p5009d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p500Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p500Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p500Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p500Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p500Ed*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p500Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p7000d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0499p7010d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0000d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0002d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0003d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0004d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0005d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0007d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0008d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0009d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p000Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p000Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0010d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0012d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0014d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0016d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p001Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p001Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0023d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0025d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0027d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0029d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p002Bd*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0582p002Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p002Fd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0033d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0037d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p003Bd*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0582p0040d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0042d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0044d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0048d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p004Cd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p004Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0050d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0052d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0065d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p006Ad*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0582p006Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0074d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0582p0075d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p007Ad*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0582p007Dd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p0080d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p008Bd*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0582p009Ad*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v06F8pB000d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p1002d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p1011d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p1015d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p1021d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p1031d010dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0763p1033d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p1041d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p2001d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p2003d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p2008d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0763p200Dd*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v07CFp6801d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07CFp6802d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v07FDp0001d*dc*dsc02dp*ic*isc*ip*");
MODULE_ALIAS("usb:v041Ep3010d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v086Ap0001d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v086Ap0002d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v086Ap0003d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v0CCDp0012d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0CCDp0013d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0CCDp0014d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v0CCDp0035d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v1235p0001d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v1235p0002d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v1235p4661d*dc*dsc*dp*icFFisc*ip*");
MODULE_ALIAS("usb:v4752p0011d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v7104p2202d*dc*dsc*dp*ic*isc*ip*");
MODULE_ALIAS("usb:v*p*d*dc*dsc*dp*ic01isc03ip*");
MODULE_ALIAS("usb:v*p*d*dc*dsc*dp*ic01isc01ip*");
