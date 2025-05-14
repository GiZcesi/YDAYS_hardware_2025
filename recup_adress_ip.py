from scapy.all import ARP, Ether, srp

def scan(ip):
    arp_request = ARP(pdst=ip)
    broadcast = Ether(dst="ff:ff:ff:ff:ff:ff")
    packet = broadcast / arp_request
    result = srp(packet, timeout=2, verbose=False)[0]

    devices = []
    for sent, received in result:
        devices.append({'ip': received.psrc, 'mac': received.hwsrc})

    return devices

devices = scan("192.168.1.0/24")
for device in devices:
    print(f"IP: {device['ip']} - MAC: {device['mac']}")
