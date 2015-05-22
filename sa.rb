require 'socket'

sIPAddr = "127.0.0.1"
iPort   = 7777
sPacket = ""

aIPAddr = sIPAddr.split('.')

sPacket += "SAMP"

sPacket += aIPAddr[0]
sPacket += aIPAddr[1]
sPacket += aIPAddr[2]
sPacket += aIPAddr[3]

puts sPacket
sPacket += (iPort & 0xFF).chr
sPacket += (iPort >> 8 & 0xFF).chr
sPacket += "i"

rSocket = UDPSocket.new.bind("udp://#{sIPAddr}", 2)
rSocket.send(sPacket)

puts rSocket.recvfrom(2024)
rSocket.close
