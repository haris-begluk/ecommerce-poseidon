# RSII Seminarski rad: sistem za naručivanje dobara i prehranbenih proizvoda
#### SQL Server korisničko ime i lozinka: 

- Docker 
Server Name: 127.0.0.1
USER: SA 
PASSWORD: QWElkj132!  
#### Korisnicka lozinka i korisnici
```
Svi testni korisnici imaju lozinku: Pass123$ 

Korisnicka imena: 
alice 
bob 
desktop
mobile 

Swagger Poseidon.Api:
client_id: docker 
check => poseidon-api

``` 
# Prije pokretanja aplikacija 
Prije pokretanja api applikacija potrebno je kreirati self signed certificate 
koji će biti korišten u docker postavkama za autentifikacijski server.  
Zatim dodati stripe api key i uraditi upgrade flutter SDK-a ukoliko je potrebno

Ovo su obavezani korci u protivnom  applikacija se neće pokrenuti. 

1. Otvoriti powershell i generisati self signed certificate koristeći komande ispod
    ``` 
    # Ako želite očistiti certifikate
    # dotnet dev-certs https --clean  <=> Ukoliko želite izbrisati postojeće certifikate  

    # OBAVEZNO izvršiti prije pokretanja docker kontejnera
    # dotnet dev-certs https --export-path $env:USERPROFILE\.aspnet\https\aspnetapp.pfx --password localhost --trust

    # Potvrda certifikata ako želite dodatno potvrditi certifikat
    # dotnet dev-certs https --trust
    ```
 
2. Dodati stripe apikey u docker-compose.ymal file (Stripe__ApiKey=TvojKljuč) 
   Ako ne dodate stripe api ključ necete moći plaćati narudžbe. 

3. Prije pokretanja flutter applikacije pobrinuti se da ste instalirali zadnju verziju flutter SDK-a.  
Obavezno provjeriti da li emulator ima dovoljo memorije. Otvorite android studio, pratite korake ispod 
    1. Virtual device manager 
    2. Odabrati emulator edit mode (olovka)
    3. Show advanced settings 
    4. Podesiti RAM, VM heap i Internal storage 

#### Preporuka za emulator postavke: RAM 2GB+ (4GB ako je moguće), VM heap 1GB+, Internal storage 8GB+

``` 
    To možete provjeriti: 
    ## Pokrenuti ukoliko ne posjedujete zadnju verziju flutter SDK-a
    # flutter doctor   
    # flutter upgrade  
    # flutter doctor  

    ## Pokrenuti iz poseidon_mobile direktorija
    # flutter clean
    # flutter pub cache repair 
    # flutter pub get 
    # flutter run  

Rezultat flutter doctor komande navedena ispod. Verzije korištene za razvoj aplikacije. 

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

# Pokretanje aplikacija

1. Servisi se pokreću na portovima Api=5433 i Auth=5533 uz predpostavku da na vašem računaru ovi portovi nisu zauzeti. Ako ste izvršili prethodne korake možete pokrenuti docker containere komandom: 
```  
# docker-compose up --build  
```
    
2. Desktop applikaciju možete pokrenuti zasebno bez ikakve konfiguracije 

3. Da bi pokrenuli aplikaciju na fizickom uređaju potrebno je proslijediti IP adressu vašeg računara, BEZ PORTOVA. Portovi su postavljeni interno u kodu. Pokrenuti flutter applikaciju komandom:
```  
# flutter run  # U ovom slučaju baseUrl će biti 10.0.2.2
ili
# flutter run --dart-define=baseUrl=10.0.0.11
```

