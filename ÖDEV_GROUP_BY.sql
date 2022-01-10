create table ogrenci (
ogrno int primary key,
ograd varchar(25),
ogrsoyad varchar(25),
cinsiyet varchar(1),
sinif varchar(5)
);
INSERT INTO ogrenci VALUES (1,'ahmet','cansever','e','10a');
INSERT INTO ogrenci VALUES (2,'niyazi','sevinc','e','11b');
INSERT INTO ogrenci VALUES (3,'ismail ','sevinc','e','10b');
INSERT INTO ogrenci VALUES (4,'kenan','emin','e','9a');
INSERT INTO ogrenci VALUES (5,'sema','bakir','k','9b');
INSERT INTO ogrenci VALUES (6,'beyda','kara','k','9c');
INSERT INTO ogrenci VALUES (7,'betül','coskun','k','11a');
INSERT INTO ogrenci VALUES (8,'sema','rüzgar','k','9c');
INSERT INTO ogrenci VALUES (9,'fadime','dönmez','k','9a');
INSERT INTO ogrenci VALUES (10,'riza','koc','e','10b');
INSERT INTO ogrenci VALUES (11,'beyza','kabak','k','10b');
INSERT INTO ogrenci VALUES (12,'deniz','akcakaya','e','11a');
INSERT INTO ogrenci VALUES (13,'kemal','karapinar','e','11a');
INSERT INTO ogrenci VALUES (14,'derya','yilbur','k','10c');
INSERT INTO ogrenci VALUES (15,'filiz','akat','k','10a');
INSERT INTO ogrenci VALUES (16,'niyazi','dönmez','e','11a');
INSERT INTO ogrenci VALUES (17,'sema','sekmen','k','10b');
select * from ogrenci;



create table kitaplar(
kitapno int primary key,
yazarno int,
turno int,
sayfasayisi int
);
INSERT INTO kitaplar VALUES (1,26,3,368);
INSERT INTO kitaplar VALUES (2,6,1,220);
INSERT INTO kitaplar VALUES (3,18,6,311);
INSERT INTO kitaplar VALUES (4,22,4,135);
INSERT INTO kitaplar VALUES (5,10,3,179);
INSERT INTO kitaplar VALUES (6,25,1,242);
INSERT INTO kitaplar VALUES (7,22,3,346);
INSERT INTO kitaplar VALUES (8,28,6,389);
INSERT INTO kitaplar VALUES (9,6,4,259);
INSERT INTO kitaplar VALUES (10,27,2,391);
INSERT INTO kitaplar VALUES (11,19,6,89);
INSERT INTO kitaplar VALUES (12,6,4,265);
INSERT INTO kitaplar VALUES (13,20,6,160);
INSERT INTO kitaplar VALUES (14,27,5,383);
INSERT INTO kitaplar VALUES (15,5,6,188);

select * from kitaplar;






create table islemler(
turno int primary key,
turadi varchar(50)
);
INSERT INTO islemler VALUES (1,'Dram');
INSERT INTO islemler VALUES (2,'Komedi');
INSERT INTO islemler VALUES (3,'Roman');
INSERT INTO islemler VALUES (4,'Hikaye');
INSERT INTO islemler VALUES (5,'Arastirma');
INSERT INTO islemler VALUES (6,'Fikra');
INSERT INTO islemler VALUES (7,'Deneme');

select * from islemler;



--  Örnek 1: Hangi isimden kaç tane olduğunu bulun.
select ograd, count(ograd) as kac_tane from ogrenci
group by ograd;

--  Örnek 2: Sınıflardaki öğrenci sayısını bulun.
select sinif, count(ograd) ogr_sayisi from ogrenci
group by sinif;


--  Örnek 3: Her sınıftaki erkek ve kız öğrenci sayısını bulun.(cinsiyet ve sinifa göre grupla)
select sinif,cinsiyet, count(cinsiyet) as cinsiyet_sayisi from ogrenci
group by cinsiyet, sinif
order by sinif;

--  Örnek 4: Her türden kaç tane kitap olduğunu listeleyiniz.
select turno, count(kitapno) as kitap_sayisi from kitaplar
group by turno;

--  Örnek 5: Her türdeki en fazla sayfa sayısı olan kitapları listeleyiniz.
select turno, max(sayfasayisi) en_fazla_sayfa_olan from kitaplar
group by turno
order by turno asc;

--  Örnek 6: Her türdeki en az sayfa sayısı olan kitapları listeleyiniz.
select turno, min(sayfasayisi) turdeki_en_az_sayfali_kitap from kitaplar
group by turno
order by turno;

--  Örnek 7***: Her türden kaç tane kitap olduğunu listeleyiniz.(Tür isimleri de olsun)
select turno, count(kitapno) as kitap_sayisi from kitaplar
group by turno
order by turno;

CREATE TABLE calisanlar 
  ( 
        id CHAR(4), 
        isim VARCHAR(50), 
        maas int(5), 
        CONSTRAINT id_pk PRIMARY KEY (id) 
    ); 
 
    INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000); 
    INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yılmaz' ,12000); 
    INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215); 
    INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000); 
  
    CREATE TABLE aileler 
    ( 
        id CHAR(4), 
        cocuk_sayisi int(50), 
        ek_gelir int(5), 
        CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id) 
    ); 
     
    INSERT INTO aileler VALUES('1001', 4, 2000); 
    INSERT INTO aileler VALUES('1002', 2, 1500); 
    INSERT INTO aileler VALUES('1003', 1, 2200); 
    INSERT INTO aileler VALUES('1004', 3, 2400); 
     select * from calisanlar;
/*
2-) Veli  Han'ın  maaşına  %20  zam  yapacak  update  komutunu  yazınız.  
Güncellemeden sonra calisanlar tablosu aşağıda görüldüğü gibi olmalıdır.*/
update calisanlar
set maas=maas*1.2
where isim='Veli Han';

select * from calisanlar; 
 
-- 3-)  Maaşı  ortalamanın  altında  olan  çalışanların  maaşına  %20  zam  yapınız.
update calisanlar
set maas=maas*1.2
where maas < (select avg(maas) from (select maas from calisanlar) as personel); -- That is, if you're doing an UPDATE/INSERT/DELETE on a table, you can't reference that table in an inner query (you can however reference a field from that outer table...)

-- where exists (select maas from calisanlar where maas < avg(maas)); 


 select * from aileler;
-- 4-)  Çalışanların  isim  ve  cocuk_sayisi'ni  listeleyen  bir  sorgu  yazınız.  
 select isim, cocuk_sayisi from calisanlar, aileler
 where calisanlar.id = aileler.id;

  
-- 5-) calisanlar' ın  id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.  
 --     toplam_gelir = calisanlar.maas + aileler.ek_gelir  
select id, isim, (maas + (select ek_gelir from aileler where aileler.id = calisanlar.id)) from calisanlar;
select * from aileler;


-- 6-) Eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın 
    -- maaşına ek %10 aile yardım zammı yapınız.  
   -- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)*/
   
   select isim, ((calisanlar.maas + aileler.ek_gelir)*1.1) as toplam_gelir from calisanlar, aileler
   where calisanlar.id=aileler.id and ((calisanlar.maas + aileler.ek_gelir)/aileler.cocuk_sayisi + 2) < 2000;
   
   -- 2. yol
	update calisanlar
	set maas = (maas*1.1)
	where 2000>(maas+(select ek_gelir from aileler where calisanlar.id=aileler.id))/((select cocuk_sayisi from aileler where calisanlar.id = aileler.id)+2);
  
select * from calisanlar;  



