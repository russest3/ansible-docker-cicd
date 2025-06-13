Clone this repo and change to it:
<pre>
git clone https://github.com/russest3/ansible-docker-cicd.git
cd ansible-docker-cicd
</pre>

Create and activate a Python Virtual Environment:
<pre>
python -m venv .
source bin/activate
</pre>

Install required Ansible collections:
<pre>ansible-galaxy collection install community.docker community.general</pre>

Install required python modules:
<pre>python -m pip install jmespath requests</pre>

Read in a password for docker hub:
<pre>read -s pw</pre>

Build out the testing environment in AWS:
<pre>
cd modules
terraform init
terraform plan -out main.tfplan
terraform apply main.tfplan
</pre>

Record the displayed public IP

Run the create-testing-environment.yml playbook:
<pre>
cd ../
ansible-playbook create-testing-environment.yml -u ec2-user -i <i><b><font color='yellow'>aws-instance-public-ip</font>,</b></i> -e "dockerhub_un='myusername' dockerhub_pw='${pw}'"</pre>

Required Variables:

dockerhub_un

dockerhub_pw
