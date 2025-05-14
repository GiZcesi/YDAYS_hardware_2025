from scapy.all import sniff

def packet_callback(packet):
    print(packet.summary())

sniff(prn=packet_callback, count=10)  # Capture 10 paquets
