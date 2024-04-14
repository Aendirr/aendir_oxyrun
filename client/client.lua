local qtarget = exports.qtarget
local startOxyRun = lib.points.new(Config.StartOxyRunLocation, Config.StartOxyRunPedRadius)
local missionActive = false
local getPharmacies = math.random(1, #Config.PharmacyLocations)
local selectPharmacy = Config.PharmacyLocations[getPharmacies]
local doctorList = {}
local perscriptionData = nil

-- Göreve başlarken karşılaşılan ilk diyalog
function startOxyRunDialog()
    if missionActive then
        return ShowNotification(Notifications.startOxyRunPedName, Notifications.startOxyRunAlreadyStarted, 'error')
    end
    local startOxyRunAlert = lib.alertDialog({
        header = AlertDialog.startOxyRunHeader,
        content = AlertDialog.startOxyRunContent,
        centered = true,
        cancel = true,
        labels = {
            confirm = AlertDialog.startOxyRunConfirm,
            cancel = AlertDialog.startOxyRunCancel
        }
    })
    if startOxyRunAlert == 'confirm' then
        local blankPrescriptionPrice = nil
        if Config.RandomBlankPrescriptionPricing then
            blankPrescriptionPrice = math.random(Config.MinBlankPrescriptionPrice, Config.MaxBlankPrescriptionPrice)
        else
            blankPrescriptionPrice = Config.BlankPrescriptionPrice
        end
        local confirmStartOxyRun = lib.alertDialog({
            header = AlertDialog.startOxyRunPart2Header,
            content = AlertDialog.startOxyRunPart2Content .. blankPrescriptionPrice ..' sound?',
            centered = true,
            cancel = true,
            labels = {
                confirm = AlertDialog.startOxyRunPart2Confirm,
                cancel = AlertDialog.startOxyRunPart2Cancel
            }
        })
        if confirmStartOxyRun == 'confirm' then
            local success = lib.callback.await('aendir_oxyrun:startOxyRun', false, blankPrescriptionPrice)
            if success then
                missionActive = true
            else
                ShowNotification(Notifications.startOxyRunPedName, Notifications.notEnoughMoney, 'error')
                missionActive = false
            end
        else
            ShowNotification(Notifications.startOxyRunPedName, Notifications.startOxyRunPart2CancelDescription, 'error')
        end
    else
        ShowNotification(Notifications.startOxyRunPedName, Notifications.startOxyRunCancelDescription, 'error')
    end
end

-- Oynatıcının bilgi girişi yapması ve sunucuya geri göndermesi için bir giriş iletişim kutusu görüntüleyen geri arama
lib.callback.register('aendir_oxyrun:fillPrescriptionInfo', function()
    local inputData = lib.inputDialog(InputDialog.header, {
        {type = 'input', label = InputDialog.nameLabel, description = InputDialog.nameDescription, icon = InputDialog.nameIcon, required = true, min = 5, max = 25},
        {type = 'input', label = InputDialog.addressLabel, description = InputDialog.addressDescription, placeholder = InputDialog.addressPlaceholder, icon = InputDialog.addressIcon, required = true, min = 10, max = 40},
        {type = 'checkbox', label = InputDialog.firstCheckboxLabel},
        {type = 'checkbox', label = InputDialog.secondCheckboxLabel},
        {type = 'date', label = InputDialog.dobLabel, icon = InputDialog.dobIcon, default = true, format = InputDialog.dobFormat, required = true},
        {type = 'input', label = InputDialog.doctorLabel, description = InputDialog.doctorDescription, icon = InputDialog.doctorIcon, required = true, min = 5, max = 25}
    })
    perscriptionData = inputData
    return inputData
end)

-- Oyuncuyu teslim ettiği senaryonun sahte olduğu konusunda uyarır
RegisterNetEvent('aendir_oxyrun:fakeScript')
AddEventHandler('aendir_oxyrun:fakeScript', function()
    lib.alertDialog({
        header = AlertDialog.fakeScriptHeader,
        content = AlertDialog.fakeScriptContent,
        centered = true,
        cancel = false
    })
end)

-- Yapılandırmadan rastgele seçilen bir Eczanede hedef seçeneği oluşturur
qtarget:AddCircleZone('randomPharmacy', selectPharmacy, 1.0, {
    name = 'randomPharmacy1',
    debugPoly = false,
}, {
    options = {
        {
            icon = Target.fillScriptIcon,
            label = Target.fillScriptLabel,
            canInteract = function()
                if missionActive then
                    return true
                else
                    return false
                end
            end,
            action = function()
                local hasItem = lib.callback.await('aendir_oxyrun:hasItem', false, Config.SignedPerscription)
                if hasItem >= 1 then
                    if lib.progressCircle({
                        label = ProgressCircle.checkingScriptLabel,
                        duration = ProgressCircle.checkingScriptDuration,
                        position = ProgressCircle.checkingScriptPosition,
                        useWhileDead = false,
                        canCancel = true,
                        disable = {car = true, move = true, combat = true}
                    }) then
                        TriggerServerEvent('aendir_oxyrun:getItemMetadata')
                        missionActive = false
                    else
                        ShowNotification(Notifications.pharmacyTitle, Notifications.pharmacyDescription, 'error')
                    end
                else
                    ShowNotification(Notifications.pharmacyTitle, Notifications.pharmacyItemNotFound, 'error')
                end
            end
        }
    },
    distance = 2,
})

-- Bir menüde düzgün bir şekilde görüntülemek için Yapılandırmadaki mevcut Doktor Adlarını döngüye alır
for k, v in pairs(Config.DoctorNames) do
    doctorList[k] = {
        title = v,
        icon = ContextMenu.availableDoctorsIcon
    }
end

-- Mevcut Doktor Adlarını açmak ve görüntülemek için hedef bölge

qtarget:AddCircleZone('availableDoctors', Config.AvailableDoctorListLocation, 1.0, {
    name = 'availableDoctors1',
    debugPoly = false,
}, {
    options = {
        {
            icon = Target.availableDoctorsIcon,
            label = Target.availableDoctors,
            action = function()
                lib.registerContext({
                    id = 'availableDoctorsMenu',
                    title = ContextMenu.availableDoctorsMenuTitle,
                    options = doctorList
                    })
                lib.showContext('availableDoctorsMenu')
            end
        }
    },
    distance = 2,
})

-- Oksi Şişesini açma etkinliği, açılıp açılmaması durumunda geri döner
lib.callback.register('aendir_oxyrun:openOxyBottle', function()
    if lib.progressCircle({
        label = ProgressCircle.openOxyBottleLabel,
        duration = ProgressCircle.openOxyBottleDuration,
        position = ProgressCircle.position,
        useWhileDead = false,
        canCancel = true,
        anim = { dict = 'missheistfbisetup1', clip = 'hassle_intro_loop_f', flag = 3 },
    }) then
        return true
    else
        ShowNotification(Notifications.oxyBottleTitle, Notifications.oxyBottleDescription, 'error')
        return false
    end
end)

-- Bir oxycontin kullanma/tüketme olayı, açılıp açılmaması durumunda geri döner
lib.callback.register('aendir_oxyrun:useOxycontin', function()
    if lib.progressCircle({
        label = ProgressCircle.poppingOxyLabel,
        duration = ProgressCircle.poppingOxyDuration,
        position = ProgressCircle.position,
        useWhileDead = false,
        canCancel = true,
        anim = { dict = 'mp_suicide', clip = 'pill' },
    }) then
        return true
    else
        ShowNotification(Notifications.oxycontinTitle, Notifications.oxycontinDescription, 'error')
        return false
    end
end)

-- Reçete verilerini almak için 
lib.callback.register('aendir_oxyrun:getPrescriptionData', function()
    return perscriptionData
end)

-- Sağlık uygulamak için 
RegisterNetEvent('aendir_oxyrun:setPedHealth')
AddEventHandler('aendir_oxyrun:setPedHealth', function()
    SetEntityHealth(cache.ped, Config.EnableEffects.health.amount or 0)
end)

-- Zırh uygulamak için
RegisterNetEvent('aendir_oxyrun:setPedArmor')
AddEventHandler('aendir_oxyrun:setPedArmor', function()
    SetPedArmour(cache.ped, Config.EnableEffects.armor.amount or 0)
end)

-- Oyuncuya hız katan etkinlik
RegisterNetEvent('aendir_oxyrun:applySpeed')
AddEventHandler('aendir_oxyrun:applySpeed', function()
    local multiplier = Config.EnableEffects.speed.multiplier
    local duration = Config.EnableEffects.speed.duration * 1000
    SetRunSprintMultiplierForPlayer(cache.playerId, multiplier)
    Citizen.SetTimeout(duration, function()
        SetRunSprintMultiplierForPlayer(cache.playerId, 1.0)
    end)
end)

-- Oynatıcıya ekran efektleri ekleyen etkinlik
RegisterNetEvent('aendir_oxyrun:applyScreenEffect')
AddEventHandler('aendir_oxyrun:applyScreenEffect', function()
    SetTimecycleModifier(Config.EnableEffects.screenEffect.effect)
    Citizen.SetTimeout(Config.EnableEffects.screenEffect.duration, function()
        ClearTimecycleModifier()
    end)
end)

-- Oyuncu tanımlanan alana girdiğinde görev başlangıç pedini çağırır
function startOxyRun:onEnter()
    spawnStartOxyRunPed()
    qtarget:AddTargetEntity(startOxyRunPed, {
        options = {
            {
                name = 'startOxyRun',
                icon = Target.startOxyRunIcon,
                label = Target.startOxyRunLabel,
                distance = 2,
                action = function()
                    if Config.RequireItem then
                        local hasItem = lib.callback.await('aendir_oxyrun:hasItem', false, Config.RequireItemName)
                        if hasItem >= Config.RequireItemAmount then
                            startOxyRunDialog()
                        else
                            ShowNotification(Notifications.startOxyRunPedName, Notifications.startOxyRunDidntHaveItemDescription, 'error')
                        end
                    else
                        startOxyRunDialog()
                    end
                end
            }
        }
    })
end

-- Oyuncu tanımlanan alandan çıktığında görev başlatma pedini siler
function startOxyRun:onExit()
    DeleteEntity(startOxyRunPed)
    qtarget:RemoveTargetEntity(startOxyRunPed, nil)
end

-- Pedin vb. fiili olarak ortaya çıkmasını yöneten işlev
function spawnStartOxyRunPed()
    lib.RequestModel(Config.startOxyRunPedModel)
    startOxyRunPed = CreatePed(0, Config.startOxyRunPedModel, Config.StartOxyRunLocation, Config.StartOxyRunPedHeading, false, true)
    FreezeEntityPosition(startOxyRunPed, true)
    SetBlockingOfNonTemporaryEvents(startOxyRunPed, true)
    SetEntityInvincible(startOxyRunPed, true)
    Entity(startOxyRunPed).state:set("sellDrugs", true, true) -- pediyatriklerde uyuşturucu satma seçeneğini devre dışı bırakır
end

-- Hata ayıklama için kullanılır
AddEventHandler('onResourceRestart', function(resource)
	if resource == GetCurrentResourceName() then
        missionActive = false
	end
end)

print("Bu script Aendir tarafından hazırlanmıştır.")
