# LoRa - A quick overview
- [LoRa - A quick overview](#lora---a-quick-overview)
  - [What is LoRa](#what-is-lora)
  - [Advantages](#advantages)
  - [Terminology](#terminology)
  - [Gateways](#gateways)
  - [Resources](#resources)
## What is LoRa
LoRa stands for **Long-Range**. It is a modulation techonology. LoRa enables very long range communication links at a nominal power level.  LoRa can be extremely resistant to radio interference and can be operated in very harsh conditions.
The low-power, and long-range characteristcs of this technology makes it a suitable one for IoT applications.
> LoRa is purely a physical (PHY), or “bits” layer implementation, as defined by the OSI seven-layer Network Model, depicted in Figure 3. Instead of cabling, the air is used as a medium for transporting LoRa radio waves from an RF transmitter in an IoT device to an RF receiver in a gateway, and vice versa.

## Advantages
![Image showing advantages of LoRa](https://lora-developers.semtech.com/uploads/documents/images/Advantages.png)

## Terminology
- **LoRa** : This is the physical layer, ie a specific **modulation technique** used to create the wireless link that we are interested in.
- **LoRaWAN** : A **protocol** that provides secure two-way communication at very long-distances using LoRa.
- **End-Device** (LoRaWAN enabled end-device): This is a **sensor or actuator** which is connected to the LoRaWAN network through a LoRa radio. End devices are assigned identifiers at the time of manufacture. These devices can be, for example, a light sensor, an automated street light etc
- **Gateway** : These simply **listen for messages** from the end-devices and **forward them to servers**. read more here [Gateways](#gateways)


## Gateways
A LoRaWAN gateway receives LoRa modulated RF messages from any end device in hearing distance and forwards these data messages to the LoRaWAN network server (LNS), which is connected through an IP backbone. There is no fixed association between an end device and a specific gateway. Instead, the same sensor can be served by multiple gateways in the area. With LoRaWAN, each uplink packet sent by the end-device will be received by all gateways within reach, as illustrated in Figure 10. This arrangement significantly reduces packet error rate (since the chances that at least one gateway will receive the message are very high), significantly reduces battery overhead for mobile/nomadic sensors, and allows for low-cost geolocation (assuming the gateways in question are geolocation-capable).

The IP traffic from a gateway to the network server can be backhauled via Wi-Fi, hardwired Ethernet or via a Cellular connection. LoRaWAN gateways operate entirely at the physical layer and, in essence, are nothing but LoRa radio message forwarders. They only check the data integrity of each incoming LoRa RF message. If the integrity is not intact, that is, if the CRC is incorrect, the message will be dropped. If correct the gateway will forward it to the LNS, together with some metadata that includes the receive RSSI level of the message as well as an optional timestamp. For LoRaWAN downlinks, a gateway executes transmission requests coming from the LNS without any interpretation of the payload. Since multiple gateways can receive the same LoRa RF message from a single end device, the LNS performs data de-duplication and deletes all copies. Based on the RSSI levels of the identical messages, the network server typically selects the gateway that received the message with the best RSSI when transmitting a downlink message because that gateway is the one closest to the end device in question.

## Resources
[Some resources to get started](resources.md)