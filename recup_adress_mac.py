from scapy.all import ARP, Ether, srp

def scan_reseau(ip_range):
    arp_request = ARP(pdst=ip_range)
    broadcast = Ether(dst="ff:ff:ff:ff:ff:ff")
    packet = broadcast / arp_request
    result = srp(packet, timeout=2, verbose=False)[0]

    devices = []
    for sent, received in result:
        devices.append({'ip': received.psrc, 'mac': received.hwsrc})

    return devices

# Scan du réseau local
ip_range = "192.168.1.0/24"  # À adapter selon ton réseau
machines = scan_reseau(ip_range)

# Affichage des résultats
print("Appareils détectés sur le réseau :")
for machine in machines:
    print(f"IP : {machine['ip']} - MAC : {machine['mac']}")
