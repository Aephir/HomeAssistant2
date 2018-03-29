#! /usr/bin/python
import gupnp.igd
import glib
from sys import stderr, argv

#my_ip = argv[1]
my_ip = "192.168.0.160"

igd = gupnp.igd.Simple()
igd.external_ip = None

main = glib.MainLoop()

def mep(igd, proto, eip, erip, port, localip, lport, msg):
    if port == 80:
        igd.external_ip = eip
        main.quit()

def emp(igd, err, proto, ep, lip, lp, msg):
    print >> stderr, "ERR"
    print >> stderr, err, proto, ep, lip, lp, msg
    main.quit()

igd.connect("mapped-external-port", mep)
igd.connect("error-mapping-port", emp)
#igd.add_port("TCP", 80, my_ip, 80, 0, "web")
igd.add_port("TCP", 443, my_ip, 443, 0, "let's encrypt")

main.run()

if igd.external_ip:
    print igd.external_ip
    exit(0)
else:
    exit(1)
