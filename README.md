JBoss BPM Suite & JBoss Data Virtualization Integration Helpdesk Demo 
=====================================================================
Demonstration project for helpdesk assignment of initial callers to available helpdesk personel on the basis of qualifications to
support language and timezone of caller. JDV is used to gather all data for available helpdesk employees at the start of the 
process.


Option 1 - Install on your machine
----------------------------------
1. [Download and unzip.](https://github.com/jbossdemocentral/bpms-helpdesk-demo/archive/master.zip)

2. Add products to installs directory.

3. Run 'init.sh' or 'init.bat' file. 'init.bat' must be run with Administrative privileges.

Follow the output instructions to start the JBoss BPM Suite & JBoss DV:

    ```
     Start JBoss BPM Suite server:                                                       
                                                                                       
     $ ./target/jboss-eap-6.1/bin/standalone.sh -Djboss.socket.binding.port-offset=100 
                                                                                       
   In seperate terminal start JBoss DV server:                                         
                                                                                       
     $ ./target/jboss-eap-6.3/bin/standalone.sh  

     JBoss BPM Suite login to [http://localhost:8080/business-central](http://localhost:8080/business-central)  (u:erics / p:bpmsuite1!)

     JBoss DV login:  (u:teiidUser / p:jbossdv1!)
    ```


Supporting Articles
-------------------
[3 shockingly easy ways into JBoss rules, events, planning & BPM](http://www.schabell.org/2015/01/3-shockingly-easy-ways-into-jboss-brms-bpmsuite.html)

[Jump Start Your Rules, Events, Planning and BPM Today](http://www.schabell.org/2014/12/jump-start-rules-events-planning-bpm-today.html)


Released versions
-----------------

See the tagged releases for the following versions of the product:

- v0.3 - JBoss BPM Suite 6.0.3 with optional docker installation.

- v0.2 - moved to JBoss Demo Central with updated windows init.bat support.

- v0.1 - JBoss BPM SUite 6.0.3 installer with demo installed.


![Call Assignment](https://github.com/jbossdemocentral/bpms-helpdesk-demo/blob/master/docs/demo-images/call-assignment.png?raw=true)
![BPM Suite](https://github.com/jbossdemocentral/bpms-helpdesk-demo/blob/master/docs/demo-images/bpmsuite.png?raw=true)
