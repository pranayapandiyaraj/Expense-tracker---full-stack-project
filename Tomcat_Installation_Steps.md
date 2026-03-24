# Apache Tomcat Server Installation and Configuration

## Exercise 4: Instructions

1. **Prerequisites Checklist:**
   - Install Java Development Kit (JDK 17 or higher recommended).
   - Set the `JAVA_HOME` environment variable to the JDK installation directory (e.g., `C:\Program Files\Java\jdk-17`).

2. **Download Apache Tomcat:**
   - Go to the official Apache Tomcat website (tomcat.apache.org).
   - Download the latest stable version (e.g., Tomcat 10) for Windows (e.g., 64-bit Windows zip or Windows Service Installer).

3. **Installation Steps (Zip Method):**
   - Extract the downloaded ZIP file to the desired location (e.g., `C:\apache-tomcat-10`).
   - Open Command Prompt or Windows Terminal as Administrator.
   - Navigate to the `bin` directory of the Tomcat unzipped folder (`cd C:\apache-tomcat-10\bin`).

4. **Configuration:**
   - Set the `CATALINA_HOME` environment variable to point to the Tomcat unzipped root folder.
   - Edit the `%CATALINA_HOME%\conf\tomcat-users.xml` file to add user credentials if you want to use the Tomcat Manager App:
     ```xml
     <role rolename="manager-gui"/>
     <role rolename="admin-gui"/>
     <user username="admin" password="admin_password" roles="manager-gui,admin-gui"/>
     ```

5. **Starting and Stopping the Server:**
   - To start Tomcat, run `startup.bat` from inside the `bin` directory.
   - To verify it's running, open your web browser and navigate to `http://localhost:8080`.
   - To stop the server gracefully, run `shutdown.bat`.

6. **Deploying Web Applications:**
   - Move your web application folders or `.war` files to the `webapps` directory inside Tomcat. They will be auto-deployed upon server startup.
