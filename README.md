# README

What in gosh is this insanity of repo trying to achieve?

Streamdeck -> {USB connect to} -> Dev PC 
Streamdeck button presses -> Run application container

Typically these containers need to access the streaming pc:

Press stream deck button -> USB -> Dev PC -> {This chaos} -> Different types of button app containers -> SSH/Websocket -> Stream PC

To run this chaos:
```bash
docker run -it --rm --privileged \
  -e DISPLAY=$DISPLAY \
  -e XAUTHORITY=/root/.Xauthority \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/root/.Xauthority:ro \
  -v /etc/udev/rules.d:/etc/udev/rules.d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --device /dev/bus/usb \
  --device /dev/uinput \
  streamdeck
```