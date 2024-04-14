Config = {}

--[[ Doctor İsimleri ]]
Config.DoctorNames = { -- Çalışırken kullanılabilecek tüm olası Doktor adlarının listesi (script yeniden başlatıldığında bir tanesi rastgele seçilir)
    'Dr. Khantgetard',
    'Dr. Sirpeeslot',
    'Dr. Seuss',
    'Dr. Doalot',
    'Dr. Likspeen',
    'Dr. Docraak',
    'Dr. Harrysak',
    'Dr. Pepper'
}

--[[ Pharmacy Yerleri ]]
Config.PharmacyLocations = { -- Konumları: (script yeniden başlatıldığında bir tanesi rastgele seçilir)
    vec3(1142.1522, -451.8326, 66.9843), -- Mirror park
    vec3(69.2566, -1570.2457, 29.5978), -- Strawyberry ave
    vec3(98.4244, -226.2621, 54.6374), -- Hawick ave
    vec3(114.2634, -4.5923, 67.8195), -- Spanish and Alta ave
    vec3(237.7168, -26.7896, 69.8964), -- Spanish and Power ave
    vec3(213.6084, -1835.6198, 27.5606) -- Carson ave
}

--[[ Genel Ayarlar ]]
Config.startOxyRunPedModel = 'g_m_y_ballaeast_01' -- Başlangıç görevi için ped modeli
Config.StartOxyRunLocation = vec3(246.7493, 370.7164, 104.7381) -- Başlangıç görevi pedinin konumu
Config.StartOxyRunPedHeading = 120.6238 -- Başlangıç görevi pedinin yüzleştiği yön
Config.StartOxyRunPedRadius = 45 -- Pedin ortaya çıkması için oyuncunun içinde olması gereken yarıçap
Config.BlankPrescription = 'blank_prescription' -- Görev başlangıcında ödüllendirilen ürünün adı
Config.SignedPerscription = 'signed_prescription' -- Bilgi doldurulduktan sonra verilen ürünün adı
Config.BlankPrescriptionRewardAmount = 1 -- Görev başlangıcında ödüllendirilen ürün miktarı
Config.BlankPrescriptionPrice = 2000 -- Görevi başlatmanın maliyeti
Config.Money = 'money' -- Görevi başlatmak için kullanılan para birimi ('money' veya 'black_money')
Config.RandomBlankPrescriptionPricing = true -- Eğer true ise, başlama maliyetini rastgele yapar (aşağıdaki parametreler dahilinde)
Config.MinBlankPrescriptionPrice = 1500 -- Yukarıdaki doğruysa Blank Prescription'ın minimum fiyatı
Config.MaxBlankPrescriptionPrice = 3500 -- Yukarıdaki doğruysa Blank Prescription'ın maksimum fiyatı
Config.RequireItem = false -- Bir görevi başlatmak için bir ürün gerektiriyorsa bunu true olarak ayarlayın
Config.RequireItemName = 'water' -- RequireItem = true ise, gereken ürün adı
Config.RequireItemAmount = 5 -- RequireItem = true ise, yukarıdaki ürün adının gereken miktarı
Config.OxyBottleItem = 'oxy_bottle' -- Oxy Şişesi olarak hizmet eden ürün adı
Config.OxyBottleQuantity = 1 -- Reçete doğru doldurulduğunda ödüllendirilecek miktar
Config.OxyPillItem = 'oxycontin' -- Oxy haplarının ürün adı
Config.OxyPillQuantity = 15 -- Şişe açıldığında oyuncuya verilen hap sayısı
Config.AvailableDoctorListLocation = vec3(343.1629, -1399.8206, 32.5092) -- Oyuncunun olası Doktor adlarını görebileceği konum
Config.EnableEffects = { -- Oxycontin kullanıldığında etkileri etkinleştirmek istiyor musunuz?
    enable = true, -- Eğer istiyorsanız bunu true olarak ayarlayın. Hiçbir etki istemiyorsanız bunu false olarak ayarlayın.
    health = {
        enable = true, -- Bu ilacı kullanırken oyuncuya sağlık uygulamak istiyor musunuz? (Evet ise true, hayır ise false)
        amount = 200 -- Eğer enable = true ise, uygulamak istediğiniz sağlık miktarı ne kadar? (200 tam sağlık)
    },
    armor = {
        enable = true, -- Bu ilacı kullanırken oyuncuya zırh uygulamak istiyor musunuz? (Evet ise true, hayır ise false)
        amount = 100 -- Eğer enable = true ise, uygulamak istediğiniz zırh miktarı ne kadar? (100 tam zırh)
    },
    speed = {
        enable = true, -- Bu ilacı kullanırken oyuncuya hız "artışı" uygulamak istiyor musunuz? (Evet ise true, hayır ise false)
        multiplier = 1.49, -- FiveM'de işe yarayan maksimum hız çarpanı 1.49'dur, 1.49'dan fazlası normal hıza ayarlanır
        duration = 10 -- Hız çarpanının kaç saniye süreceği
    },
    screenEffect = {
        enable = true, -- Bu ilacı kullanırken ekran efekti uygulamak istiyor musunuz? (Evet ise true, hayır ise false)
        effect = 'glasses_pink', -- Eğer enableScreenEffect true ise, hangi efekti istiyorsunuz? (Büyük seçenek listesi: https://forum.cfx.re/t/timecyclemodifier-index-and-name-list/1419389)
        duration = 10000 -- Eğer enable true ise, efektin kaç saniye sürmesini istiyorsunuz?
    }
}

--[[ Webhook Ayarları ]]
Config.EnableWebhook = true -- Discord webhook günlüklerini etkinleştirmek istiyorsanız bunu true olarak ayarlayın. İstemiyorsanız, bunu false olarak devre dışı bırakın.
Config.WebhookLink = '' -- Günlükler için webhook bağlantısı
Config.WebhookName = 'Oxy' -- Webhook için Discord bot adı
Config.WebhookAvatarIcon = '' -- Webhook avatar resmi
Config.WebhookFooterIcon = '' -- Webhook altbilgi resmi

--[[ Dize Ayarları ]]
Notifications = {
    position = 'top', -- tüm bildirimlerin bildirim konumu
    icon = 'capsules', -- tüm bildirimler için bildirim simgesi
    pharmacyTitle = 'Eczane',
    pharmacyDescription = 'Reçete doldurma işlemini iptal ettiniz',
    pharmacyItemNotFound = 'Burada senin için bir şey yok - daha sonra tekrar dene',
    startOxyRunPedName = 'Aaron',
    notEnoughMoney = 'Zamanımı boşa harcama dostum, parasız gelme',
    startOxyRunCancelDescription = 'Hazır olduğunda dön',
    startOxyRunPart2CancelDescription = 'Benimle dalga geçme, vaktim yok..',
    startOxyRunDidntHaveItemDescription = 'Sana verecek hiçbir şeyim yok, beni rahat bırak.',
    startOxyRunAlreadyStarted = 'Sana yeni bir şey verdim dostum - aldıklarını kullan, sonra konuşuruz.',
    oxyBottleTitle = 'Oksijen Şişesi',
    oxyBottleDescription = 'Fikrini değiştirdin ve şişeyi açmadın',
    oxycontinTitle = 'Oksikontin',
    oxycontinDescription = 'Fikrini değiştirdin ve hapı almadın'
}

Target = {
    startOxyRunLabel = 'Konuş',
    startOxyRunIcon = 'fas fa-comment',
    availableDoctors = 'Mevcut Doktorları Görüntüle',
    availableDoctorsIcon = 'fas fa-user-doctor',
    fillScriptLabel = 'Reçeteyi Doldur',
    fillScriptIcon = 'fas fa-capsules'
}

ContextMenu = {
    availableDoctorsMenuTitle = 'Bugünkü Doktorlar',
    availableDoctorsIcon = 'user-doctor'
}

ProgressCircle = {
    position = 'middle', -- The position for all progressCircle's
    checkingScriptLabel = 'Dekont Kontrol Ediliyor..',
    checkingScriptDuration = 15000,
    openOxyBottleLabel = 'Şişe Açılıyor..',
    openOxyBottleDuration = 4000,
    poppingOxyLabel = 'İçiliyor..',
    poppingOxyDuration = 2000
}

AlertDialog = {
    startOxyRunHeader = 'Aaron',
    startOxyRunContent = 'Ne var ne yok dostum, bir reçeteye mi ihtiyacın var? Sana yardımcı olacağım ama dikkatli ol. Yakalanırsan bu benden gelmedi..',
    startOxyRunConfirm = 'Kabul Et',
    startOxyRunCancel = 'Boşver',
    startOxyRunPart2Header = 'Aaron',
    startOxyRunPart2Content = 'Tamam dostum, yapalım bunu. Ama biraz nakite ihtiyacım var.. Bu işler kolay gelmiyor. Ne dersin $',
    startOxyRunPart2Confirm = 'Öde',
    startOxyRunPart2Cancel = 'Hayır',
    fakeScriptHeader = 'Doktor',
    fakeScriptContent = 'Bu sahtekârlık! Bu reçeteyi senin için doldurmayacağım. Bu, imha makinesine gidiyor.. şimdi elveda.'
}

InputDialog = {
    header = 'Reçete Bilgilerini Doldur',
    nameLabel = 'Adı',
    nameDescription = 'Hastanın adı ve soyadı',
    nameIcon = 'user',
    addressLabel = 'Adres',
    addressDescription = 'Hastanın tam adresi',
    addressPlaceholder = '420 Strawberry Ave, Los Santos, 42069',
    addressIcon = 'house',
    firstCheckboxLabel = 'Kronik Olmayan Ağrı',
    secondCheckboxLabel = 'Akut Ağrı İstisnası',
    dobLabel = 'Doğum Tarihi',
    dobFormat = "GG/AA/YYYY",
    dobIcon = 'calendar',
    doctorLabel = 'Doktor İmzası',
    doctorDescription = 'Onaylayan Doktor',
    doctorIcon = 'signature'
}
