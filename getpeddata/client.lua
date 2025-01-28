RegisterCommand("getpeddata", function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)

    -- Components and Props
    local components = {}
    local props = {}

    for i = 0, 11 do
        local drawable = GetPedDrawableVariation(ped, i)
        local texture = GetPedTextureVariation(ped, i)
        local palette = GetPedPaletteVariation(ped, i)
        table.insert(components, { component_id = i, drawable = drawable, texture = texture, palette = palette })
    end

    for i = 0, 7 do
        local propDrawable = GetPedPropIndex(ped, i)
        local propTexture = GetPedPropTextureIndex(ped, i)
        table.insert(props, { prop_id = i, drawable = propDrawable, texture = propTexture })
    end

    -- Face Blend Data (Head Shape and Skin Tone)
    local shapeFirst, shapeSecond, shapeThird = GetPedHeadBlendData(ped, 0)
    local skinFirst, skinSecond, skinThird = GetPedHeadBlendData(ped, 1)
    local shapeMix, skinMix, thirdMix = GetPedHeadBlendData(ped, 2)

    local headBlend = {
        shapeFirst = shapeFirst,
        shapeSecond = shapeSecond,
        shapeThird = shapeThird,
        skinFirst = skinFirst,
        skinSecond = skinSecond,
        skinThird = skinThird,
        shapeMix = shapeMix,
        skinMix = skinMix,
        thirdMix = thirdMix,
    }

    -- Face Feature Sliders (e.g., Nose Width, Jaw Shape)
    local faceFeatures = {}
    for i = 0, 19 do
        local featureValue = GetPedFaceFeature(ped, i)
        table.insert(faceFeatures, { feature_id = i, value = featureValue })
    end

    -- Face Overlays (e.g., Beard, Makeup, Eyebrows)
    local overlays = {}
    for i = 0, 12 do
        local overlayValue = GetPedHeadOverlayValue(ped, i)
        table.insert(overlays, { overlay_id = i, value = overlayValue })
    end

    -- Print Everything to Console
    print("Components: ", json.encode(components))
    print("Props: ", json.encode(props))
    print("Head Blend: ", json.encode(headBlend))
    print("Face Features: ", json.encode(faceFeatures))
    print("Overlays: ", json.encode(overlays))
end, false)
