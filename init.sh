#!/bin/sh 
DEMO="JBoss BPM Suite + JDV Helpdesk Demo"
AUTHORS="Cojan Ballengooi, Andrew Block, Eric D. Schabell"
PROJECT="git@github.com:jbossdemocentral/bpms-helpdesk-demo.git"
PRODUCT="JBoss BPM Suite & JBoss DV"
JBOSS_HOME=./target/jboss-eap-6.1
JBOSS_HOME_DV=./target/jboss-eap-6.3
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration/
SERVER_CONF_DV=$JBOSS_HOME_DV/standalone/configuration/
SERVER_BIN=$JBOSS_HOME/bin
SERVER_BIN_DV=$JBOSS_HOME/bin
SRC_DIR=./installs
SUPPORT_DIR=./support
PRJ_DIR=./projects
BPMS=jboss-bpms-installer-6.0.3.GA-redhat-1.jar
DV=jboss-dv-installer-6.1.0.Beta-redhat-1.jar
VERSION=6.0.3
DV_VERSION=6.1.0.Beta

# wipe screen.
clear 

echo
echo "#################################################################"
echo "##                                                             ##"   
echo "##  Setting up the ${DEMO}         ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##          ####  ####   #   #   ###       ####  #   #         ##"
echo "##          #   # #   # # # # # #      #   #   # #   #         ##"
echo "##          ####  ####  #  #  #  ##   ###  #   # #   #         ##"
echo "##          #   # #     #     #    #   #   #   #  # #          ##"
echo "##          ####  #     #     # ###        ####    #           ##"
echo "##                                                             ##"   
echo "##                                                             ##"   
echo "##  brought to you by,                                         ##"   
echo "##      ${AUTHORS}       ##"
echo "##                                                             ##"   
echo "##  ${PROJECT}     ##"
echo "##                                                             ##"   
echo "#################################################################"
echo

command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$BPMS ] || [ -L $SRC_DIR/$BPMS ]; then
		echo Product sources are present...
		echo
else
		echo Need to download $BPMS package from the Customer Portal 
		echo and place it in the $SRC_DIR directory to proceed...
		echo
		exit
fi

# make some checks first before proceeding.	
if [ -r $SRC_DIR/$DV ] || [ -L $SRC_DIR/$DV ]; then
	echo JBoss product sources, $DV present...
	echo
else
	echo Need to download $DV package from the Customer Portal 
	echo and place it in the $SRC_DIR directory to proceed...
	echo
	exit
fi

# Remove old installs.
if [ -x $JBOSS_HOME ]; then
		echo "  - existing JBoss product install removed..."
		echo
		rm -rf target
fi

# DV installer.
echo Product installers running now...
echo
java -jar $SRC_DIR/$DV $SUPPORT_DIR/installation-dv  -variablefile $SUPPORT_DIR/installation-dv.variables
echo

if [ $? -ne 0 ]; then
	echo Error occurred during DV installation
	exit
fi

echo
echo "  - install teiid security files..."
echo
cp $SUPPORT_DIR/teiidfiles/teiid* $SERVER_CONF_DV

echo
echo "  - move data files..."
echo
cp -R $SUPPORT_DIR/teiidfiles/data/* $JBOSS_HOME_DV/standalone/data

echo
echo "  - move virtual database..."
echo
cp -R $SUPPORT_DIR/teiidfiles/vdb $JBOSS_HOME_DV/standalone/deployments

echo "  - setting up dv standalone.xml configuration adjustments..."
echo
cp $SUPPORT_DIR/teiidfiles/standalone.dv.xml $SERVER_CONF_DV/standalone.xml

# Run BPM installer.
echo
java -jar $SRC_DIR/$BPMS $SUPPORT_DIR/installation-bpms -variablefile $SUPPORT_DIR/installation-bpms.variables

if [ $? -ne 0 ]; then
	echo Error occurred during $PRODUCT installation!
	exit
fi

echo "  - enabling demo accounts role setup in application-roles.properties file..."
echo
cp $SUPPORT_DIR/application-roles.properties $SERVER_CONF

echo "  - setting up standalone.xml configuration adjustments..."
echo
cp $SUPPORT_DIR/standalone.xml $SERVER_CONF

echo "  - setting up demo projects..."
echo
cp -r $SUPPORT_DIR/bpm-suite-demo-niogit $SERVER_BIN/.niogit

# Add execute permissions to the standalone.sh script.
echo "  - making sure standalone.sh for server is executable..."
echo
chmod u+x $JBOSS_HOME/bin/standalone.sh

# Optional: uncomment this to install mock data for BPM Suite.
#
#echo - setting up mock bpm dashboard data...
#cp $SUPPORT_DIR/1000_jbpm_demo_h2.sql $SERVER_DIR/dashbuilder.war/WEB-INF/etc/sql
#echo

# Final instructions to user to start and run demo.
echo
echo "==========================================================================================="
echo "=                                                                                         =" 
echo "=  Start JBoss BPM Suite server:                                                          ="
echo "=                                                                                         =" 
echo "=    $ $SERVER_BIN/standalone.sh -Djboss.socket.binding.port-offset=100    ="
echo "=                                                                                         =" 
echo "=  In seperate terminal start JBoss DV server:                                            ="
echo "=                                                                                         =" 
echo "=    $ $SERVER_BIN_DV/standalone.sh                                        ="
echo "=                                                                                         =" 
echo "=                                                                                         =" 
echo "=  ******** BPM APP LEVERAGES DV DATA SOURCES SCENARIO **********                         ="
echo "=                                                                                         =" 
echo "=  Login to business central to build & deploy BRMS rules project at:                     ="
echo "=                                                                                         =" 
echo "=    http://localhost:8180/business-central     (u:erics/p:bpmsuite1!)                    ="
echo "=                                                                                         =" 
echo "=  View the DV setup:                                                                     ="
echo "=                                                                                         ="
echo "=    TODO: detail or point to doc that does.      (u:teiidUser/p:jbossdv1!)               ="
echo "=                                                                                         ="
echo "=   $DEMO Setup Complete.                                ="
echo "=                                                                                         ="
echo "==========================================================================================="
echo

