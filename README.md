# Intruction to run(No dependencies):


		  1) Build the docker as follows:

			
			docker build -t remote .


		  2) Run the docker
 

			docker run -p 80:80 remote


		  3) The webserver serves the application on localhost(The sentrigufo application is run in /var/www/html/ inside docker)


# Config:

	The database is run on a local server inside the docker container.


	If you wish to change the database server,Please check the below instruction


     
	  1) Restore the backup of the database found as backup.sql in scripts directory. Restore as follows

	
		mysql -u USER -pPASSWORD sentrifugo < backup.sql


          2) The mysql server configuration has to be changed in Docker file ENV variables DATABASE_SERVER,DATABASE_USERNAME,DATABASE_PASSWORD and DATABASE_NAME accordingly.


          3) Build and run docker again. If the database and configuration are setup properly,The application will be served in localhost


# Credentials :
	
	Sentrifugo Super USER

		Username : empp0001

		Password : 5ee51b484955a

	Sentrifugo Employee

		Username: EMPP123

		Password: useramyde

