#!/bin/env bash

ffmpeg \
	-stream_loop -1 \
	-re \
	-f concat -safe 0 -protocol_whitelist file,https,tls,http,tcp -i files.txt \
        -i fallback_overlay.png \
	-x264-params keyint=48:min-keyint=48:scenecut=-1 \
	-b:v 4500k \
	-minrate:v 4000k \
	-maxrate:v 4500k \
	-bufsize:v 1835k \
	-b:a 128k \
	-ar 44100 \
	-acodec aac \
	-vcodec libx264 \
	-preset medium \
	-crf 28 \
	-threads 4 \
	-filter_complex "[1:v]format=argb,scale=400:400[sc]; \
                         [0:v][sc]overlay=x=(W-w)/2:y=(H-h)/2[out]" \
        -map "[out]" \
        -map 0:a \
	-pix_fmt yuvj420p \
	-r 24 \
	-f flv \
	rtmp://supersecretrtmpendpoint/supersecretstreamkey
