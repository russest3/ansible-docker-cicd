Clone this repo and change to it:
<pre>
git clone https://github.com/russest3/ansible-docker-cicd.git
cd ansible-docker-cicd
</pre>

Create and activate Python Virtual Environment:
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

Run the create-testing-environment.yml playbook:
<pre>ansible-playbook create-testing-environment.yml -u ec2-user -i <i><b>aws-instance-ip,</b></i> -e "dockerhub_un='myusername' dockerhub_pw='${pw}'"</pre>

required variables:
dockerhub_un
dockerhub_pw
