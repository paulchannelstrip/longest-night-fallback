#!/bin/env bash

ffmpeg \
	-stream_loop -1 \
	-re \
	-f concat -safe 0 -protocol_whitelist file,https,tls,http,tcp -i files.txt \
	-pix_fmt yuvj420p \
	-x264-params \
	keyint=48:min-keyint=48:scenecut=-1 \
	-b:v 4500k \
	-b:a 128k \
	-ar 44100 \
	-acodec aac \
	-vcodec libx264 \
	-preset medium \
	-crf 28 \
	-threads 4 \
	-vf "drawtext=fontfile=fonts/inter_dsktp/Inter-Bold.otf:text='We\'ll be right back':fontcolor=#00303b:fontsize=24:box=1:boxcolor=#f1f2da:boxborderw=5:x=(w-text_w)/2:y=(h-text_h)/2" \
	-f flv \
	rtmp://toplap.org/test-yt/asdgfhjkjhsdgf
