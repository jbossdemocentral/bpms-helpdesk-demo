JBoss BPM Suite Helpdesk Demo 
=============================

Demonstration project for helpdesk assignment of initial callers to available helpdesk personel on the basis of qualifications to
support language and timezone of caller.


Quickstart
----------

1. [Download and unzip.](https://github.com/jbossdemocentral/bpms-helpdesk-demo/archive/master.zip)

2. Add products to installs directory.

3. Run 'init.sh' or 'init.bat' file. 'init.bat' must be run with Administrative privileges.

4. Login to http://localhost:8080/business-central  (u:erics / p:bpmsuite1!)

5. Enjoy demo!


Optional Docker Install
-----------------------

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

None yet...


Released versions
-----------------

See the tagged releases for the following versions of the product:

- v0.3 - JBoss BPM Suite 6.0.3 with optional docker installation.

- v0.2 - moved to JBoss Demo Central with updated windows init.bat support.

- v0.1 - JBoss BPM SUite 6.0.3 installer with demo installed.


![Call Assignment](https://github.com/jbossdemocentral/bpms-helpdesk-demo/blob/master/docs/demo-images/call-assignment.png?raw=true)
![BPM Suite](https://github.com/jbossdemocentral/bpms-helpdesk-demo/blob/master/docs/demo-images/bpmsuite.png?raw=true)
