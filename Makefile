.PHONY: start-ftp
start-ftp: 
	docker run \
		  --name vsftpd \
		  -d \
		  -v $(PWD)/ftp_data:/home/user/ \
		  -v $(PWD)/ftp_data/logs:/var/log/ \
		  -e FTP_USER=user \
		  -e FTP_PASS=user \
		  -e PASV_MIN=21100 \
		  -e PASV_ADDRESS=127.0.0.1 \
		  -e PASV_MAX=21110 \
		  -p 21:21 \
		  -p 21100-21110:21100-21110 \
		  avenus/vsftpd-alpine

.PHONY: stop-ftp
stop-ftp: 
	docker rm -f vsftpd