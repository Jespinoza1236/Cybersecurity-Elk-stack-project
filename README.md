# Cybersecurity-Elk-stack-project
Configuartion of a cloud network and installing Elk to monitor it. 
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

                       (Images/Network_topology.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - install-elk.yml
  - install-filebeat.yml
  - install-metricbeat.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting outside access to the network.

- A load balancer ensures that the network demand is spread between multiple servers reducing downtime and protecting the network from any potential Denial of Service (DOS) attacks. Additionally, the use of a Jumpbox ensures that only one device can access the virtual machines in your network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics such as perfomance. 
- Filebeat will look for changes the systems log files e.g., successful SSh logins, adding/removing users. 
- Metricbeat will monitor the any services running on the systems and monitor perfomance such as CPU utilization. 

The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | gateway  |20.213.93.144   | Linux        |
| Web-1    |  DVWA    |  10.0.0.8          | Linux            |
| Web-2    |  DVWA    |  10.0.0.9        | Linux            |
| Web-3    |  DVWA    |  10.0.0.11        | Linux            |
| ELK-Red  |  Elk     |  10.2.0.5/20.210.223.54  | Linux            |
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk-Red machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 162.197.229.218

Machines within the network can only be accessed by the Jumpbox vm.
- 10.0.0.7

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | no                  | 162.197.229.218      |
| Web-1    | no                  | 10.0.0.7             |
| Web-2    | no                  | 10.0.0.7             |
| Web-2    | no                  | 10.0.07              |
| Elk-Red  | yes                 | 162.197.229.218      |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves time and makes configuring multiple machines easier than configuring each one of them individually.

The playbook implements the following tasks:
- install docker 
- install python3
- install python3 pip module
- increase and use more virtual memory
- download and launch elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

                                   (Images/elk_docker2022.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.8
- Web-2 10.0.0.9
- Web-3 10.0.0.11

We have installed the following Beats on these machines:
- Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects information related to system logs such as sudo commands used and ssh logins. Metricbeat collects system metrics such as memory and cpu usage. 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml  file to the /etc/ansible directory in your control node. 
- Navigate to the Hosts file in your control node's ansible directory.
- Be sure to create an elk host just under your webservers host.
- Place the ip address of your elk machine under the elk hosts you just created.
- Now that you have created elk as a new host in the ansible hosts file, the install-elk.yml playbook will install elk on the intended machine.
- Run the playbook, and navigate to your elk machine to check that the installation worked as expected.

- input the following into the browser of your choice: "your external ip address":5601/app/kibana

### Commands to install elk
SSH into your Jumpbox:
- ssh "username"@"yourjumpboxIP"

list docker containers:
- sudo docker container lists -a 

start docker and attach docker container with one command:
- sudo docker start "container name" && sudo docker attach "container name"

Add the vms you dont intend to install elk on into ansible hosts file:
- nano /etc/ansible/hosts
- uncomment webservers
- input the internal IP addresses of your vms under webservers

Create a new hosts called "elk" under webservers:
- place the IP of the intended elk machine under elk

Copy and paste the install-elk.yml:
- copy the install-elk.yml file
- nano /etc/anisble/install-elk.yml
- paste the contents of the install-elk.yml file.
- use ctrl x to save the file and enter to confirm the name.

Run the playbook:
- ansible-playbook /etc/ansible/install-elk.yml

SSh into your elk machine:
- ssh "username"@"your elk machine IP"

Make sure the container is running:
- sudo docker container ps or docker start elk

Open Kibana:
- in your browser, input http://"elk container public IP":5601/app/kibana
                                 (Images/kibana_2022.png)

