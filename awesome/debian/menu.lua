-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Aplicaciones_Accesibilidad"] = {
	{"Xmag","xmag"},
}
Debian_menu["Debian_Aplicaciones_Ciencia_Matemáticas"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"galculator","/usr/bin/galculator","/usr/share/pixmaps/galculator.xpm"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"LibreOffice Math","/usr/bin/libreoffice --math","/usr/share/icons/hicolor/32x32/apps/libreoffice-math.xpm"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Aplicaciones_Ciencia"] = {
	{ "Matemáticas", Debian_menu["Debian_Aplicaciones_Ciencia_Matemáticas"] },
}
Debian_menu["Debian_Aplicaciones_Consolas"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
}
Debian_menu["Debian_Aplicaciones_Editores"] = {
	{"Nano", "x-terminal-emulator -e ".."/bin/nano","/usr/share/nano/nano-menu.xpm"},
	{"Xedit","xedit"},
}
Debian_menu["Debian_Aplicaciones_Emuladores"] = {
	{"VirtualBox","/usr/bin/virtualbox","/usr/share/pixmaps/virtualbox.xpm"},
}
Debian_menu["Debian_Aplicaciones_Emuladores_de_terminal"] = {
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Aplicaciones_Gestión_de_archivos"] = {
	{"catfish","catfish"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"gmrun","/usr/bin/gmrun"},
	{"Thunar","/usr/bin/thunar"},
}
Debian_menu["Debian_Aplicaciones_Gestión_de_datos"] = {
	{"LibreOffice Base","/usr/bin/libreoffice --base","/usr/share/icons/hicolor/32x32/apps/libreoffice-base.xpm"},
}
Debian_menu["Debian_Aplicaciones_Gráficos"] = {
	{"ImageMagick","/usr/bin/display.im6 logo:","/usr/share/pixmaps/display.im6.xpm"},
	{"LibreOffice Draw","/usr/bin/libreoffice --draw","/usr/share/icons/hicolor/32x32/apps/libreoffice-draw.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Aplicaciones_Herramientas"] = {
	{"fbxkb","/usr/bin/fbxkb"},
}
Debian_menu["Debian_Aplicaciones_Ofimática"] = {
	{"AbiWord Word Processor","/usr/bin/abiword","/usr/share/pixmaps/abiword.xpm"},
	{"gnumeric","/usr/bin/gnumeric","/usr/share/pixmaps/gnome-gnumeric.xpm"},
	{"homebank","/usr/bin/homebank","/usr/share/pixmaps/homebank.xpm"},
	{"LibreOffice Calc","/usr/bin/libreoffice --calc","/usr/share/icons/hicolor/32x32/apps/libreoffice-calc.xpm"},
	{"LibreOffice Impress","/usr/bin/libreoffice --impress","/usr/share/icons/hicolor/32x32/apps/libreoffice-impress.xpm"},
	{"LibreOffice Writer","/usr/bin/libreoffice --writer","/usr/share/icons/hicolor/32x32/apps/libreoffice-writer.xpm"},
	{"zathura","/usr/bin/zathura"},
}
Debian_menu["Debian_Aplicaciones_Programación"] = {
	{"Eclipse","eclipse"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Geany","/usr/bin/geany","/usr/share/pixmaps/geany.xpm"},
	{"pycrust","/usr/bin/pycrust","/usr/share/pixmaps/pycrust.xpm"},
	{"Python (v2.7)", "x-terminal-emulator -e ".."/usr/bin/python2.7","/usr/share/pixmaps/python2.7.xpm"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
	{"xrced","/usr/bin/xrced","/usr/share/pixmaps/xrced.xpm"},
}
Debian_menu["Debian_Aplicaciones_Red_Comunicación"] = {
	{"heirloom-mailx", "x-terminal-emulator -e ".."/usr/bin/heirloom-mailx"},
	{"Icedove Mail","icedove","/usr/share/pixmaps/icedove.xpm"},
	{"Irssi", "x-terminal-emulator -e ".."/usr/bin/irssi"},
	{"Xbiff","xbiff"},
	{"X Chat","/usr/bin/xchat","/usr/share/icons/xchat.xpm"},
	{"xtightvncviewer","/usr/bin/xtightvncviewer"},
}
Debian_menu["Debian_Aplicaciones_Red_Navegación_web"] = {
	{"Chromium","chromium"},
	{"Iceweasel","iceweasel","/usr/share/pixmaps/iceweasel.xpm"},
}
Debian_menu["Debian_Aplicaciones_Red_Transferencias_de_archivos"] = {
	{"gFTP","/usr/bin/gftp-gtk","/usr/share/pixmaps/gftp.xpm"},
	{"Transmission BitTorrent Client (GTK)","/usr/bin/transmission-gtk","/usr/share/pixmaps/transmission.xpm"},
}
Debian_menu["Debian_Aplicaciones_Red"] = {
	{ "Comunicación", Debian_menu["Debian_Aplicaciones_Red_Comunicación"] },
	{ "Navegación web", Debian_menu["Debian_Aplicaciones_Red_Navegación_web"] },
	{ "Transferencias de archivos", Debian_menu["Debian_Aplicaciones_Red_Transferencias_de_archivos"] },
}
Debian_menu["Debian_Aplicaciones_Sistema_Administración"] = {
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"Editres","editres"},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"keyTouch editor","/usr/bin/su-to-root -X -c /usr/sbin/keytouch-editor","/usr/share/keytouch-editor/pixmaps/icon.xpm"},
	{"LXAppearance","lxappearance",},
	{"nitrogen","/usr/bin/nitrogen"},
	{"Openbox Configuration Manager","/usr/bin/obconf","/usr/share/pixmaps/obconf.xpm"},
	{"Openbox Menu Editor","/usr/bin/obmenu"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Aplicaciones_Sistema_Gestión_de_paquetes"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e ".."/usr/bin/aptitude-curses"},
	{"Synaptic Package Manager","x-terminal-emulator -e synaptic-pkexec","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Aplicaciones_Sistema_Hardware"] = {
	{"NVIDIA Settings","/usr/bin/nvidia-settings"},
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Aplicaciones_Sistema_Monitorización"] = {
	{"Conky", "x-terminal-emulator -e ".."/usr/bin/conky"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Aplicaciones_Sistema"] = {
	{ "Administración", Debian_menu["Debian_Aplicaciones_Sistema_Administración"] },
	{ "Gestión de paquetes", Debian_menu["Debian_Aplicaciones_Sistema_Gestión_de_paquetes"] },
	{ "Hardware", Debian_menu["Debian_Aplicaciones_Sistema_Hardware"] },
	{ "Monitorización", Debian_menu["Debian_Aplicaciones_Sistema_Monitorización"] },
}
Debian_menu["Debian_Aplicaciones_Sonido"] = {
	{"moc", "x-terminal-emulator -e ".."/usr/bin/mocp"},
	{"pavucontrol","/usr/bin/pavucontrol"},
	{"Xfce Mixer","/usr/bin/xfce4-mixer","/usr/share/pixmaps/xfce4-mixer.xpm"},
}
Debian_menu["Debian_Aplicaciones_Texto"] = {
	{"ClipIt","/usr/bin/clipit"},
	{"Fortune","sh -c 'while /usr/games/fortune | col -x | xmessage -center -buttons OK:1,Another:0 -default OK -file - ; do :; done'"},
}
Debian_menu["Debian_Aplicaciones_Vídeo"] = {
	{"VLC media player","/usr/bin/qvlc","/usr/share/icons/hicolor/32x32/apps/vlc.xpm"},
}
Debian_menu["Debian_Aplicaciones_Visores"] = {
	{"Xditview","xditview"},
}
Debian_menu["Debian_Aplicaciones"] = {
	{ "Accesibilidad", Debian_menu["Debian_Aplicaciones_Accesibilidad"] },
	{ "Ciencia", Debian_menu["Debian_Aplicaciones_Ciencia"] },
	{ "Consolas", Debian_menu["Debian_Aplicaciones_Consolas"] },
	{ "Editores", Debian_menu["Debian_Aplicaciones_Editores"] },
	{ "Emuladores", Debian_menu["Debian_Aplicaciones_Emuladores"] },
	{ "Emuladores de terminal", Debian_menu["Debian_Aplicaciones_Emuladores_de_terminal"] },
	{ "Gestión de archivos", Debian_menu["Debian_Aplicaciones_Gestión_de_archivos"] },
	{ "Gestión de datos", Debian_menu["Debian_Aplicaciones_Gestión_de_datos"] },
	{ "Gráficos", Debian_menu["Debian_Aplicaciones_Gráficos"] },
	{ "Herramientas", Debian_menu["Debian_Aplicaciones_Herramientas"] },
	{ "Ofimática", Debian_menu["Debian_Aplicaciones_Ofimática"] },
	{ "Programación", Debian_menu["Debian_Aplicaciones_Programación"] },
	{ "Red", Debian_menu["Debian_Aplicaciones_Red"] },
	{ "Sistema", Debian_menu["Debian_Aplicaciones_Sistema"] },
	{ "Sonido", Debian_menu["Debian_Aplicaciones_Sonido"] },
	{ "Texto", Debian_menu["Debian_Aplicaciones_Texto"] },
	{ "Vídeo", Debian_menu["Debian_Aplicaciones_Vídeo"] },
	{ "Visores", Debian_menu["Debian_Aplicaciones_Visores"] },
}
Debian_menu["Debian_Ayuda"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"Xman","xman"},
}
Debian_menu["Debian_Juegos_Juguetes"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Juegos"] = {
	{ "Juguetes", Debian_menu["Debian_Juegos_Juguetes"] },
}
Debian_menu["Debian_Pantalla_Bloqueapantallas"] = {
	{"Lock Screen (XScreenSaver)","/usr/bin/xscreensaver-command -lock"},
}
Debian_menu["Debian_Pantalla_Salvapantallas"] = {
	{"Activate ScreenSaver (Next)","/usr/bin/xscreensaver-command -next"},
	{"Activate ScreenSaver (Previous)","/usr/bin/xscreensaver-command -prev"},
	{"Activate ScreenSaver (Random)","/usr/bin/xscreensaver-command -activate"},
	{"Demo Screen Hacks","/usr/bin/xscreensaver-command -demo"},
	{"Disable XScreenSaver","/usr/bin/xscreensaver-command -exit"},
	{"Enable XScreenSaver","/usr/bin/xscreensaver"},
	{"Reinitialize XScreenSaver","/usr/bin/xscreensaver-command -restart"},
	{"ScreenSaver Preferences","/usr/bin/xscreensaver-command -prefs"},
}
Debian_menu["Debian_Pantalla"] = {
	{ "Bloqueapantallas", Debian_menu["Debian_Pantalla_Bloqueapantallas"] },
	{ "Salvapantallas", Debian_menu["Debian_Pantalla_Salvapantallas"] },
}
Debian_menu["Debian"] = {
	{ "Aplicaciones", Debian_menu["Debian_Aplicaciones"] },
	{ "Ayuda", Debian_menu["Debian_Ayuda"] },
	{ "Juegos", Debian_menu["Debian_Juegos"] },
	{ "Pantalla", Debian_menu["Debian_Pantalla"] },
}
