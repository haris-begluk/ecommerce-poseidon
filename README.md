# ecommerce-poseidon: example of a small ecommerce system
#### SQL Server user name and password: 

- Docker 
Server Name: 127.0.0.1
USER: SA 
PASSWORD: QWElkj132!  
#### Test users with default passwords
```
All test users will be created on application start and will have password: Pass123$ 

User names: 
alice 
bob 
desktop
mobile 

Swagger Poseidon.Api:
client_id: docker 
check => poseidon-api

``` 
# How to start applications  
Before start of api application you need to create self signed certificate using commands below.
You need to add stripe api key in docker-compose.yaml file.  

If you want to see api service logs in data dog you can add Data Dog api key.(not required)


1. Otvoriti powershell i generisati self signed certificate koristeći komande ispod
    ``` 
    # Delete all certificates
    # dotnet dev-certs https --clean

    # REQUIRED  Execute this command using powershell
    # dotnet dev-certs https --export-path $env:USERPROFILE\.aspnet\https\aspnetapp.pfx --password localhost --trust

    # Truest the cerificate
    # dotnet dev-certs https --trust
    ```
 
2. Add stripe apikey u docker-compose.ymal file (Stripe__ApiKey=YourKey) 
   Orders won't be completed (not payed) ifyou don't add stripe api key.  
   https://stripe.com

#### Recommended android emulator configuration: RAM 2GB+ (4GB if possible), VM heap 1GB+, Internal storage 8GB+

``` 
    Check flutter version and upgrade if needed: 
    ## Good to use latest flutter SDK
    # flutter doctor   
    # flutter upgrade  
    # flutter doctor  

    ## Open folder poseidon_mobile in VS Code and execute commands
    # flutter clean
    # flutter pub cache repair (not required)
    # flutter pub get 
    # flutter run  

Used version for development: 

Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.3.8, on Microsoft Windows [Version 10.0.22621.819], locale en-US)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Chrome - develop for the web
[✓] Visual Studio - develop for Windows (Visual Studio Enterprise 2022 17.4.0)
[✓] Android Studio (version 2021.3)
[✓] VS Code (version 1.73.1)
[✓] Connected device (3 available)
[✓] HTTP Host Availability

```

# Start applications

1. Api services will start on ports Api=5433 i Auth=5533 by default, in docker or localhost without docker. The assumption is that the ports are not in use.  
Services can be started using Visual studio docker-compose option or  
from Powershell by running command (below) from main folder.
```  
# docker-compose up --build  
```
    
2. Desktop application can be runned using Visual Studio 2019+

3. If you want to run mobile application on your phone, connect you phone to you pc and run flutter commnad by passing your PC ip address (ipconfig). By default flutter app is configured to work wiht emulator and docker api services. If you don't know how to run app on android device follow steps from this video https://www.youtube.com/watch?v=aohkII1C4JY
```  
# Emulator ip address will be 10.0.2.2
# flutter run  
# Or 
# Android device 
# flutter run --dart-define=baseUrl=10.0.0.11 
```

