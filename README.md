
# flight_booking_app
Flight Booking Mobile Application

--Spring Boot / Branch = Services--
-

- https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html linkinden Java 17 kurulumu yapılmalıdır.
- Java kurulumu ile birlikte ilk defa java kuruluyor ise gerekli path değişiklikleri yapılmalıdır.
- https://dev.mysql.com/downloads/installer/ sitesinden mysql kurulumu yapılmalıdır.(Workbench, shell, server sürümleri en güncel sürüm seçilmeldir.)
- mysql kurulumunda oluşturulan şifrenin "root" olması gerekmektedir.
- Mysql içinde "flightbooking" connection'u oluşturulup kurulumda belirlenen şifre ile connection'a giriş yapılabildiği sağlanmalıdır.
- Sonrasında services branchi klonlanmalıdır. (Zip olarakta indirilebilir.)
- Daha sonrasında proje içerisinde bulunan target klasöründeki flightbooking-0.0.1-SNAPSHOT-exec.jar dosyası çalıştırılmalıdır(CMD-Powershell türevleri üzerinden-CommandLine).
- Komut satırında çalıştırılması gereken jar dosyası şu şekilde çalıştırılabilir ; "java -jar flightbooking-0.0.1-SNAPSHOT-exec.jar"



--Flutter / Branch = app--
-

- Alttaki linkten Flutter sdk indirin https://docs.flutter.dev/get-started/install/windows/mobile?tab=download
- İndirilen Flutter sdk dosyasını C:\flutter klasörüne çıkartın
- Flutter'ı çalıştırabilmek için "flutter\bin" dizinini sistem yolunuza eklemeniz gerekiyor. Bunun için şu adımları izleyin:Başlat menüsünü açın ve "Sistem Ortam Değişkenleri Düzenle" yazarak "Sistem Ortam Değişkenleri" penceresini açın.
- "Ortam Değişkenleri" düğmesine tıklayın.
- "Kullanıcı Değişkenleri" bölümünde "Path" adlı değişkeni bulun ve düzenleyin.
- "Yeni" düğmesine tıklayın ve Flutter'ın "bin" dizinini ekleyin. Örneğin, "C:\flutter\bin" şeklinde olmalıdır.
- Github app branch'inden projeyi indirin.(Masaüstüne proje çıkartıldığında türkçe karakterlerinden dolayı hata veriyor. C:\flutter klasörüne çıkartılabilir).
- Kullanılan ide'nin terminalinden veya proje dizinine gidilerek "flutter run" komutunu çalıştırın.

--Uygulama Kullanımı--
-

Uygulama ilk açıldığında veritabanı boş olacağı için herhangi bir uçak rota veya uçuş bulunmamaktadır. İlk olarak Admin hesabıyla giriş yapılıp sol üstte bulunan Admin sayfasından uçak, rota ve uçuş eklenmelidir daha sonra Ana sayfada rota seçilerek rezervasyon işlemleri yapılabilir.

Admin hesabı:

Mail:caglar@gmail.com

Sifre:123456

Kullanıcı hesabı:(Uygulama ilk açıldığında dilerseniz kullanıcı oluşturabilirsiniz)


Mail:kamil@gmail.com

Sifre:123456
