#!/usr/bin/python
# pylint: disable=missing-module-docstring
from libblupower import *

def main():
    exit = 0
    bus = dbus.SystemBus()
    devices = get_devices(bus)
   
    output = []
    try:
        alt = 'off'
        if sys.argv[2] == 'yes': alt = 'on'
        output = []
        for dev in devices:
            device = get_device(bus, devices, device_info(bus,dev).get("Model"))
            if not "battery_BAT0" in device:
                info = device_info(bus, device)
                match info['Type']:
                    case "mouse":
                        icon = ""
                    case "headphone":
                        icon = ""
                    case "hands-free":
                        icon = ""
                    case "headset":
                        icon = ""
                    case "phone":
                        icon = ""
                    case "portable":
                        icon = ""
                    case _:
                        icon = f"{info['Type']}"

                output.append(f"{icon} {int(info['Percentage'])}%")
    except Exception as error:
        exit = 2
   
    jsoutput = {
        "text":'bt',
        "alt": alt,
        "tooltip": "\n".join(output)
    }

    print(json.dumps(jsoutput))
    sys.exit(exit)


if __name__ == "__main__":
    main()
