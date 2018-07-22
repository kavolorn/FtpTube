.PHONY: libvlc
libvlc: 
	docker build -t libvlc_build .
	docker run --name libvlc libvlc_build sh ./compile.sh -l -a armeabi-v7a
	docker cp libvlc:/vlc_build/vlc-android/libvlc/build/outputs ./outputs
	