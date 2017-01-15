# Using tomee oficial Docker image as a basis
FROM tomee:8-jdk-7.0.1-webprofile

# Configure our server with HA settings
ADD ./conf/server.xml /usr/local/tomee/conf/server.xml

# Add some users to TomEE, so we can login to the admin panel later to see the results
ADD ./conf/tomcat-users.xml /usr/local/tomee/conf/tomcat-users.xml

# Add DataSource configuration
ADD ./conf/tomee.xml /usr/local/tomee/conf/tomee.xml

# Add Postgres JDBC jar
ADD ./conf/postgresql-9.4-1206.jdbc42.jar /usr/local/tomee/lib/postgresql-9.4-1206.jdbc42.jar

# Now we add our application. 
# This is the last step, so we can use Docker caching capabilities 
# every time we recreate the container with a new version of the application

ARG LOCAL_PATH=./target/warfile.war
ARG WAR_FILE=warfile.war
ADD ${LOCAL_PATH} /usr/local/tomee/webapps/${WAR_FILE}
