

Small-Ebay-like-Website

This is a website for making purchases or selling items you want. It is developed as a university project and it is a small 
imitation of Ebay.

Development

The project was developed using the Eclipse IDE .

Technologies Used

Front-End:
  
There are several .jsp files that can be found in the /WebContent folder. HTML/CSS is primarly used and some Javascript for the map scripts
(showing locations of auctions across the globe). The JSTL library is also used within the .jsp files.

Back-End:

The Java language is used in the back-end with the use of servlets. Within the /src folder you can find all the Java code devided into subfolders . The JPA/Eclpise Link is used to communicate with the database and for CRUD( create, read, update, delete) operations , as well as several others that the website require. Moreover DAOs are implemented for clear and correct communication with our database as detailed by the MVC (model, view , controller) pattern. A MySQL database was used.(the schema is found in the /DatabaseTed2 folder)



JavaXB and XML usage:

Within the /src folder you can find code using the JavaXB library of Java so that we can get information out of our database . The admin user (who is the site's administrator with his own special account and webpages) can export the auctions informations using JAVAXB and get data into an XML file.

MVC pattern:

Model : 

The JPA/Eclipse Link specification is used as well as DAOs that have a clear match with our tables in our MySQL database. There is also a filter called JPA_db_filter which can be found inside the folder /src/filters which opens and closes transactions between requests/responses (from client to server).

View :
 
The website contains several webpages found within the /WebContent folder. These webpages are .jsp files and contain HTML/CSS code and some also contain Javascript. There are also several pages that contain JSTL tags.(JSTL ---> library used to ease the way information is displayed to the user.

Controller:

Servlets are used here within the Apache Tomcat server that is used. They (servlets) are responsible for clear communication between the database and the jsp pages. They are used to check information taken from the database and pass it along to the View part of the application . They are also responsible for redirecting the user taking into account what actions he performs on each webpage.

Application Server/Web server:

Apache tomcat 8.0 was used for this website. Actions have also been taken to enable the SSL/HTTPS encryption on the server.(although there is no certificate for such a website)

-----


This project is a functional website but it is not intended to be used as a commercial website yet. It requires significant changes to it's front end and also to it's back end parts. It is meant to be a project for a university course in the National and Kapodistrian University of Athens , Department of Informatics and Telecommunications (6th semester).
 
