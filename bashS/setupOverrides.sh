#!/bin/bash




sudo touch ~starexec/StarExec-deploy/build/overrides.properties



cat > ~starexec/StarExec-deploy/build/overrides.properties << EOF

# the name of your copy of Starexec. This name will be used for
# the database to be created.  Also, users will access the web
# interface to StarExec at ${Web.Address}/${STAREXEC_APPNAME}$
STAREXEC_APPNAME: starexec

Backend.Root: /cluster/gridengine-8.1.9-2
#Backend.Root: /usr/share/oar

# Backend.WorkingDir is local storage on compute nodes used only while the job is executing.
Backend.WorkingDir: /export/starexec

#Backend.Type: sge
#Backend.Type: oar
Backend.Type: local

# Host running the database; the compute nodes will connect to this host
# to report back as job pairs finish.
#Cluster.DB.Url: db.example.com
Cluster.DB.Url: starexec.ccs.miami.edu

# If desired, a user with fewer permissions may be used by the compute nodes to 
# report results to the database. This user only needs EXECUTE permission, and
# is configured via Cluster.DB.User and Cluster.DB.Pass. If unspecified, these
#  will default to the values of DB.User and DB.Pass.
#Cluster.DB.User: starexec_cluster
#Cluster.UpdatePeriod: 1200

# Text file describing machine specs of cluster nodes
# Build fails with the following message if "Cluster.MachineSpecs" is not set here.
# BUILD FAILED
# /home/starexec/StarExec-deploy/build/build-compile.xml:25: Cannot open Cluster.MachineSpecs:
#
Cluster.MachineSpecs: build/Cluster.MachineSpecs.txt

# Database configuration
DB.Name: ${STAREXEC_APPNAME}
DB.User: se_admin
DB.Pass: dfsdf34RFerfg3TFGRfrF3edFVg12few2
DB.Url: jdbc:mysql://localhost/${STAREXEC_APPNAME}
DB.Pool.Max: 125
DB.Pool.Min: 20

# Path to SQL script that will be executed when doing a fresh install
# This is primarily intended for developers (who will frequently clear the
# database and start fresh) to setup user accounts. This script will be executed
# AFTER the schema and all procedures have been created.
#DB.Initialize: /home/starexec/StarExec-deploy/sql/NewInstall.sql

# Email credentials for outgoing messages
Email.Contact: se-admin@ccs.miami.edu
Email.Port: 25
Email.Smtp: farley.ccs.miami.edu
Email.User: noreply@starexec.ccs.miami.edu

Job.SubmissionPeriod: 20
JobPair.MaxFileWrite: 600
JobPair.ExecutionPrefix: scl enable devtoolset-7 --

# Domain name for the web interface of your copy of StarExec
Web.Address: starexec.ccs.miami.edu

# Path to a custom logo that will be used on website
# Must be a 300x70 PNG image
# Web.Image.Banner: WebContent/images/starlogo.png

# set this to the data directory where benchmarks, solvers,
# and job output will be stored (in subdirectories created
# automatically)
# data_dir is an nfs mounted on all hosts.
data_dir: /home/starexec

tomcat-dir: /project/apache-tomcat-7
web-home: /project/apache-tomcat-7/webapps

logging_levels: DEBUG,STAREXEC
ALLOW_TESTING: true

# The following values are not declared in Iowa's override.properties files. I'm
# commenting them out while we wait on support from Iowa.
#
# New fields to overwrite default
Proxy.Address: starexec.ccs.miami.edu
Proxy.Port: 80
Proxy.Scheme: http://
Proxy.URL: ${Proxy.Scheme}${Proxy.Address}
Report.Host: starexec.ccs.miami.edu

# sandbox directory for doing processing and building on the head node
sandbox_dir: /local/sandbox

EOF

echo "Done making overrides.properties file"


