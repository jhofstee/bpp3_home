ver=`uname -r`
LIB_PATH=/lib/modules/$ver

exit

insmod $LIB_PATH/kernel/drivers/video/cfbfillrect.ko
insmod $LIB_PATH/kernel/drivers/video/cfbcopyarea.ko
insmod $LIB_PATH/kernel/drivers/video/cfbimgblt.ko
insmod $LIB_PATH/kernel/drivers/video/fb.ko

insmod $LIB_PATH/kernel/drivers/video/omap2/dss/omapdss.ko def_disp=ortustech_com43h4m10xtc debug=y
insmod $LIB_PATH/kernel/drivers/video/omap2/displays/panel-generic-dpi.ko
insmod $LIB_PATH/kernel/drivers/video/omap2/omapfb/omapfb.ko

#insmod $LIB_PATH/kernel/drivers/video/omap2/dss/omapdss.ko def_disp=innolux_lcd debug=y
#insmod $LIB_PATH/kernel/drivers/video/omap2/dss/omapdss.ko def_disp=innolux_lcd

#insmod $LIB_PATH/kernel/drivers/video/omap2/displays/panel-dvi.ko

#insmod $LIB_PATH/kernel/drivers/video/console/softcursor.ko
#insmod $LIB_PATH/kernel/drivers/video/console/font.ko
#insmod $LIB_PATH/kernel/drivers/video/console/fbcon_cw.ko
#insmod $LIB_PATH/kernel/drivers/video/console/fbcon_ud.ko
#insmod $LIB_PATH/kernel/drivers/video/console/fbcon_ccw.ko

#insmod $LIB_PATH/kernel/drivers/video/console/tileblit.ko
#insmod $LIB_PATH/kernel/drivers/video/console/fbcon_rotate.ko
#insmod $LIB_PATH/kernel/drivers/video/console/bitblit.ko
#insmod $LIB_PATH/kernel/drivers/video/console/fbcon.ko
