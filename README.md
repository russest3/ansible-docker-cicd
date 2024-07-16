1.  Add local service account
    $ ansible-playbook add_local_service_account.yml -i localhost,
2.  $ sudo su - <service account>
3.  Install required collections
    $ ansible-galaxy collection install community.docker community.general
4.  Install required python modules
    $ python -m pip install jmespath
4.  Clone this repo
    git clone https://....
5.  Read in a password for docker hub
    $ read -s pw
6.  Run the create-testing-environment.yml
    $ ansible-playbook create-testing-environment.yml -i inventory.yml -e "dockerhub_pw='${pw}'"

required variables:
dockerhub_un
dockerhub_pw
mysql_database
mysql_user
mysql_password
