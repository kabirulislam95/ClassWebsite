# ClassWebsite
Please note the instruction below can be used to replicate this project on your local Windows machine.

# Open your command prompt
Type in ‘git clone https://github.com/kabirulislam95/ClassWebsite.git’

cd  ClassWebsite

webenv/Scripts/activate

cd classweb

# Open up Visual Studio 
Go to ‘File’ and then ‘Open Folder’ and open navigate to the location where the project is saved.

Click on ‘Terminal’ then ‘New Terminal’

Type in: python manage.py makemigrations

python manage.py migrate

# Open MySQL WorkBench
start an instance, and create a database called classweb

# Navigate back to Visual Studio 
run the following command: python manage.py runserver

Paste the link you get in a web browser of your choice and you will be able to interact with the application.
