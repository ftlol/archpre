sudo modprobe v4l2loopback devices=1 card_label="VirtCam"
mkfifo /tmp/pipe
ffmpeg -re -f --enable-nvenc live_flv -i udp://localhost:12345 -f v4l2 /dev/video2
#ffmpeg -f x11grab -r 15 -s 1920×1080 -i :0.0+0,0 -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2
#--enable-nvenc
