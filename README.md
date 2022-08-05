# Semaphore Pushgateway Service

Semaphore is an extensible dashboard for viewing Prometheus time series, built with Laravel, Tailwind and VueJS. See [https://github.com/teamfurther/semaphore](https://github.com/teamfurther/semaphore).

The Pushgateway service is used to push custom data to Prometheus. This repo contains instructions on how to setup the service and sample data capture scripts.

## Prerequisites
This service presumes that you have already installed [Prometheus](https://prometheus.io/docs/prometheus/latest/installation/) and [Pushgateway](https://github.com/prometheus/pushgateway). 

## Create a service with ```systemd```
1. Upload the ```all.sh``` file from this repo to ```/etc/prometheus/scripts/```
2. Customize ```all.sh``` to use whichever metrics you wish to track. Create and add you own.
3. Create the ```/etc/systemd/system/prometheus-data.service``` with the following contents:

```
[Unit]
Description=Prometheus Data
After=network.target
StartLimitIntervalSec=0

[Service]
ExecStart=/etc/prometheus/scripts/all.sh
User=
Group=
Restart=always
RestartSec=1
Type=simple

[Install]
WantedBy=multi-user.target
```
You'll need to set your actual username and user group after User= and Group= respectively.

4. Start the service with ```systemctl start prometheus-data```
5. Enable automatic start on system boot with  ```systemctl enable prometheus-data```

## Using the provided samples
1. Upload the samples you wish to use from this repo to ```/etc/prometheus/scripts/```
2. Customize ```all.sh``` to use whichever metrics you wish to track.
3. Adjust the ```SEMAPHORE_PUSHGATEWAY_ENDPOINT``` and ```SEMAPHORE_INSTANCE``` variables on top of ```all.sh```
4. Some sample files require a couple of variables to be set
   - ```global_uptime.sh```
   - ```eol.sh```
   - ```ssl_status.sh```
5. Restart the service with ```systemctl restart prometheus-data```

## Credits

- [Peter ILLÉS](https://github.com/ilpet)

## License

The MIT License (MIT). Please see [License File](https://github.com/teamfurther/semaphore/blob/master/LICENSE.md) for more information.