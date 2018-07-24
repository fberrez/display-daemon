.PHONY: script service

script-file=.display-daemon.sh
service-file=display-daemon.service

all: script service

script:
	cp .display-daemon.sh $(HOME)/$(script-file) \

service:
	if [ -f /etc/systemd/system/$(service-file) ]; then \
		echo "$(service-file) already exists in your /etc/systemd/system folder. Aborting..."; \
	else \
		cp $(service-file) /etc/systemd/system/$(service-file); \
		systemctl daemon-reload; \
		systemctl enable $(service-file); \
		systemctl start $(service-file); \
		systemctl status $(service-file); \
	fi \
