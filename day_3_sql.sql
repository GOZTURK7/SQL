-- SELECT - WHERE ==============
create table ogrenciler(
id int, 
isim varchar(45),
adres varchar(100),
sinav_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);

select * from ogrenciler;

/*============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/
/*----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from ogrenciler
 where sinav_notu >80;
 
 /*----------------------------------------------------------------------------
	ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 select isim, adres from ogrenciler where adres='ANkara';
 
 /*----------------------------------------------------------------------------
	ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 select * from ogrenciler where id=124;
 
/*======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
        );
        
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
    
    -- not: BETWEEN iki mantksal ifade ile tanimlayabileceğimiz durumlari tek komutla yazabilme imkani verir.
    -- yazdiğimiz iki sinir da araliğa dahildir [].
/*===========================================================================
 ===  And (Ve) Operatörü Kullanımı
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
=====Or (Veya) Operatörü Kullanımı=====
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir. =*/


/*----------------------------------------------------------------------------
	ORNEK4: id’si 10002 ile 10005 arasinda olan öğrencilerin tüm bilgilerini liste
 -----------------------------------------------------------------------------*/
 -- 1. YOL:
 select * from personel where id between '10002' and '10005';
 -- 2. YOL:
 SELECT * FROM personel WHERE id>='10002' AND id<='10005';
 
 /*----------------------------------------------------------------------------
	ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/

select * from personel where isim between 'Mehmet Yilmaz' and 'Veli Han'; -- M ve V harfleri arasndakilerin verilerini getirdi.

/* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
 
 -- 1. yol:
 select * from personel
 where id='10001' or id='10002' or id='10004';
 
 -- 2. yol:
  select * from personel
 where id in(10001, 10002, 10004); -- sorgularken mysql '' işareti olmamasn sorun yapmyor burada;
 
 
 /* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/  

select * from personel where maas in(7000,12000); 

select * from personel
 where maas in(7000, 12000);
-- not
-- doğru yazim
select * from personel
where maas=7000 or isim='meryem ';
-- yanliş yazim
 select * from personel
where maas in(7000,'meryem');

/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
========================================================================== */

/*ORNEK 9 ismi A harfi ile başlayanlari listeleyiniz */

select * from personel where isim like 'a%'; -- a harfi ile BAŞLAYAN herkesi getiriyor.

/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 
 select * from personel where isim like '%n'; -- n ile BİTEN herkesi getiriyor/
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 
 select * from personel where isim like '_e%'; -- İKİNCİ HARFİ e olan sonrasi ne kadar yolu varsa getir.
 
 /* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 
 select * from personel where isim like '_e%y%'; -- ikinci harfi e sonrasnda y ama y'nin pozisyonu önemli değil öncesi sonrasi.
 
 /* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
select * from personel where isim not like '%a%'; -- a'nn ne önünde ne ardnda demek,

/* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/
select * from personel where maas like '_____'; -- maaş beş haneli olanlar getirdi


/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/

 select * from personel where isim like 'a_____a%'; --
 
 
 
 /*====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
	INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    
    DROP TABLE kelimeler;
 
 
 /* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat YENİ KO!!
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    select * from kelimeler where regexp_like(kelime,'at|ot','c'); -- regex'te yazdğmz ifadelerin arasnda boşluklara DİKKAT !! BOŞLUKLAR DUYARL.
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
 SELECT * FROM KELİMELER WHERE REGEXP_LIKE(kelime,'at|ot'); -- 'c' ile case sensitive olduğunu belirtiyorduk bunu koymaynca büyük küçükil
 -- ayrm yapmadan getiriyor.
    
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır. YENİ KONU !!!!!!!
     select * from kelimeler where regexp_like(kelime, '^ho|^hi');
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat YENİ KONU. !!!!!!!!
  etmeksizin listeleyeniz. (i yazmaya gerek yok) SONDAKİ İÇİN $ İŞARETİ KULLANYORUZ.
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.
     SELECT * FROM KELİMELER WHERE REGEXP_LIKE(kelime, 't$|m$');
     
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
  select * from kelimeler where kelime like 'h_t'; bunu yapabiliriz ama aşağida yeni bir yöntem öğreneceğiz bunda sadece büyük küçük harf duyarliliğini sağlayamam 
 -----------------------------------------------------------------------------*/
 SELECT * FROM kelimeler where regexp_like(kelime, 'h[a-zA-Z0-9]t','c'); -- [] köşelinin içine ne yazarsam arasnda o hafrler olur ama boş olursa ne olursa demek
 -- [a-z] mesela bu a'dan z'ye bütün harfler veya [a-zA-Z] veya [a-zA-Z0-9] bunun içerise yazdiğim araliktan istediğini al demek,


/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
   select * from kelimeler where regexp_like(kelime, 'h[ai]t'); -- [] köşelinin içinde ne varsa o veya bu ne denk gelirse demek zaten o yüzden veya yazmamaya gerek yok
   
/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/    
 select * from kelimeler where regexp_like(kelime, '[mie]'); -- 2. YOL 'm|i|e' de olabiilr
 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
select * from kelimeler where regexp_like(kelime,'^[as]'); -- başnda a veya s harfi incase sensitive olarak olan tüm kelimeleri getirir
-- 2. YOL '^a|^s'
 
 drop table kelimeler;
 
/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini  YENİ KONU !!!
  listeleyiniz.
-----------------------------------------------------------------------------*/
  select * from kelimeler where regexp_like(kelime, '[o]{2}'); -- 2. YOL [o][o], 3, YOL 'o[oo] 4. yol 'oo'
   
   
 



