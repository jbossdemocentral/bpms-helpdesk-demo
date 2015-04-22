JBoss BPM Suite Helpdesk Demo 
=============================
Demonstration project for helpdesk assignment of initial callers to available helpdesk personel on the basis of qualifications to
support language and timezone of caller.

There are two options available to you for using this demo; local and Docker.


Option 1 - Install on your machine
----------------------------------
1. [Download and unzip.](https://github.com/jbossdemocentral/bpms-helpdesk-demo/archive/master.zip)

2. Add products to installs directory.

3. Run 'init.sh' or 'init.bat' file. 'init.bat' must be run with Administrative privileges.

4. Login to http://localhost:8080/business-central  (u:erics / p:bpmsuite1!)

5. Enjoy demo!


Option 2 - Generate docker install
----------------------------------
The following steps can be used to configure and run the demo in a docker container

1. [Download and unzip.](https://github.com/jbossdemocentral/bpms-helpdesk-demo/archive/master.zip)

2. Add product installer to installs directory.

3. Copy contents of support/docker directory to the project root.

4. Build demo image.

	```
	docker build -t jbossdemocentral/bpms-helpdesk-demo .
	```
5. Start demo container.

	```
	docker run --it -p 8080:8080 -p 9990:9990 jbossdemocentral/bpms-helpdesk-demo
	```
6. Login to http://<DOCKER_HOST>:8080/business-central (u:erics / p:bpmsuite1!)

7. Enjoy demo!

Additional information can be found in the jbossdemocentral docker [developer repository](https://github.com/jbossdemocentral/docker-developer)


Supporting Articles
-------------------
[3 shockingly easy ways into JBoss rules, events, planning & BPM](http://www.schabell.org/2015/01/3-shockingly-easy-ways-into-jboss-brms-bpmsuite.html)

[Jump Start Your Rules, Events, Planning and BPM Today](http://www.schabell.org/2014/12/jump-start-rules-events-planning-bpm-today.html)


Released versions
-----------------

See the tagged releases for the following versions of the product:

- v0.4 - JBoss BPM SUite 6.1 with helpdesk demo installed.

- v0.3 - JBoss BPM Suite 6.0.3 with optional docker installation.

- v0.2 - moved to JBoss Demo Central with updated windows init.bat support.

- v0.1 - JBoss BPM SUite 6.0.3 installer with demo installed.

![Call Assignment](https://github.com/eschabell/bpms-helpdesk-demo/blob/master/docs/demo-images/call-assignment.png?raw=true)

![BPM Suite](https://github.com/eschabell/bpms-helpdesk-demo/blob/master/docs/demo-images/bpmsuite.png?raw=true)
