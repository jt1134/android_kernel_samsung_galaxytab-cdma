#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

void hotspot_event_monitoring_exit(void)
{
}

void hotspot_event_monitoring_init(void)
{
}

module_init(hotspot_event_monitoring_init);
module_exit(hotspot_event_monitoring_exit);

MODULE_LICENSE("GPL");

