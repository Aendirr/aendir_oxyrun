# Aendir's Oxy Run | Rebuilt and simplified. Translated into Turkish

FiveM için benzersiz bir oksijen hapı (oxy) etkinliği fikri: İlk olarak, boş bir reçete satıcısı ziyaret ederek başlayın (gerektiğinde bir eşya gerektirecek şekilde yapılandırılabilir) ve kendiniz doldurabileceğiniz bir boş reçete için ödeme yapın. Bu reçeteyi doldurun (evet, girilen bilgiler önemlidir), açık olan yerel eczanelerden birini bulun (varsayılan olarak gelen bir eczane konumları listesi vardır, her yeniden başlatmada script bu konumlardan birini seçer, böylece eczane konumları her seferinde aynı olmaz) ve reçetenizi, kesinlikle ihtiyacınız olan oksijen hapı şişesi için eczaneye verin. Ancak dikkatli olun, her yeniden başlatmada kabul edilecek doktor ismi değişir (config’deki Doktorİsimleri listesinden rastgele seçilir).

Eczane, reçeteyi teslim alırken yasa dışı yazılmış reçeteyi kontrol eder, hastanın adının reçeteyi veren kişiyle eşleşip eşleşmediğine, akut ağrı istisnasının işaretlenip işaretlenmediğine ve reçete üzerindeki doktor imzasının o gün görevde olan doktorla eşleşip eşleşmediğine bakar. Bunlardan biri bile yanlışsa, eczane sahtekarlıkla suçlar, reçetenizi parçalar ve tekrar denemek için yeni bir reçeteye ihtiyacınız olur.

Yapılandırmada ayarlayabileceğiniz kullanılabilir doktor isimleri listesi vardır, ayrıca oyuncuların uygun isimleri keşfetmesi ve doğruyu bulana kadar oynaması için nerede bulunabileceği belirtilebilir. Sunucu yeniden başlatıldığında, eczane konumu değişir ve görevdeki doktor değişir.

Oksijen şişesini açabilir ve böylece bireysel haplar alabilirsiniz. Bu hapları belirli sağlık miktarlarını, zırhı uygulamak veya hiçbir şey yapmamak üzere yapılandırabilirsiniz. Bu fikrin arkasındaki düşünce, ardından uyuşturucu satış sistemine entegre edilecek ek bir uyuşturucu işlemi olarak ve/veya oyunculara kullanışlı sağlık veya zırh (veya her ikisini birden) eşyaları sağlama yeni bir yol sunmak.

## Destek İçin
- [Click here to join our Discord](https://discord.com/invite/46fa6GF9uF)


## Özellikler
- ESX ve QBCore'u destekler
- Son derece ayrıntılı yapılandırma dosyası
- İstediğiniz kadar (veya az) Eczane yeri ayarlayın
- Mümkün olduğu kadar çok (veya az) Doktor isminden oluşan bir liste oluşturun
- Discord webhook günlüklerini etkinleştirin/devre dışı bırakın
- Oksikontin kullanımı üzerine sağlık etkilerini etkinleştirme/devre dışı bırakma
- Oxycontin kullanımı üzerine zırh efektlerini etkinleştirin/devre dışı bırakın
- Oxycontin kullanımı üzerine "hız artırma" efektlerini etkinleştirme/devre dışı bırakma
- Oxycontin kullanımı üzerine ekran efektlerini etkinleştirme/devre dışı bırakma
- Boş bir komut dosyası veya sabit bir fiyat satın alırken rastgele fiyatlandırma belirleyin
- Kullanımda ve boştayken 0,00 optimize edildi

## Gerekli Olanlar
- [ox_inventory](https://github.com/overextended/ox_inventory/releases)
- [ox_lib](https://github.com/overextended/ox_lib/releases)
- [ox_target](https://github.com/overextended/ox_target/releases), [qb-target](https://github.com/qbcore-framework/qb-target) or [qtarget](https://github.com/overextended/ox_target/releases)

## Kurulum
- Tüm bağımlılıkların kurulu olduğundan emin olun
- "install" klasörünü açın, items.lua dosyasını ox_inventory/data/items.lua'ya ekleyin 
- "images" klasöründeki resimleri ox_inventory/web/images klasörüne sürükleyip bırakın
-  aendir_oxyrun'u 'resources' dizinine ekleyin
- 'server.cfg' dosyanıza 'ensure aendir_oxyrun' ekleyin

## Preview
[Streamable - Aendir's Oxy Run](https://streamable.com/o4t7bz)
