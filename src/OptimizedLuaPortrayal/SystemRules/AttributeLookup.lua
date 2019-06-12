local featureTypes = {
    directionalCharacter = 'complex',
    featureName = 'complex',
    featuresDetected = 'complex',
    fixedDateRange = 'complex',
    frequencyPair = 'complex',
    horizontalClearanceFixed = 'complex',
    horizontalClearanceOpen = 'complex',
    horizontalPositionUncertainty = 'complex',
    information = 'complex',
    lightSector = 'complex',
    measuredDistanceValue = 'complex',
    multiplicityOfFeatures = 'complex',
    onlineResource = 'complex',
    orientation = 'complex',
    periodicDateRange = 'complex',
    radarWaveLength = 'complex',
    rhythmOfLight = 'complex',
    scheduleByDayOfWeek = 'complex',
    sectorCharacteristic = 'complex',
    sectorInformation = 'complex',
    sectorLimit = 'complex',
    sectorLimitOne = 'complex',
    sectorLimitTwo = 'complex',
    shapeInformation = 'complex',
    signalSequence = 'complex',
    speed = 'complex',
    surfaceCharacteristics = 'complex',
    surveyDateRange = 'complex',
    telecommunications = 'complex',
    tidalStreamPanelValues = 'complex',
    tidalStreamValue = 'complex',
    timeIntervalsByDayOfWeek = 'complex',
    topmark = 'complex',
    updateDescription = 'complex',
    valueOfLocalMagneticAnomaly = 'complex',
    verticalClearanceClosed = 'complex',
    verticalClearanceFixed = 'complex',
    verticalClearanceOpen = 'complex',
    verticalClearanceSafe = 'complex',
    verticalUncertainty = 'complex',
    vesselSpeedLimit = 'complex',
    applicationProfile = 'text',
    beaconShape = 'enumeration',
    buildingShape = 'enumeration',
    buoyShape = 'enumeration',
    buriedDepth = 'real',
    callSign = 'text',
    categoryOfAirportAirfield = 'enumeration',
    categoryOfAnchorage = 'enumeration',
    categoryOfBridge = 'enumeration',
    categoryOfBuiltUpArea = 'enumeration',
    categoryOfCable = 'enumeration',
    categoryOfCanal = 'enumeration',
    categoryOfCardinalMark = 'enumeration',
    categoryOfCheckpoint = 'enumeration',
    categoryOfCoastline = 'enumeration',
    categoryOfCommPref = 'enumeration',
    categoryOfConveyor = 'enumeration',
    categoryOfCrane = 'enumeration',
    categoryOfDam = 'enumeration',
    categoryOfDistanceMark = 'enumeration',
    categoryOfDock = 'enumeration',
    categoryOfDumpingGround = 'enumeration',
    categoryOfFence = 'enumeration',
    categoryOfFerry = 'enumeration',
    categoryOfFishingFacility = 'enumeration',
    categoryOfFogSignal = 'enumeration',
    categoryOfFortifiedStructure = 'enumeration',
    categoryOfGate = 'enumeration',
    categoryOfHarbourFacility = 'enumeration',
    categoryOfHulk = 'enumeration',
    categoryOfIce = 'enumeration',
    categoryOfInstallationBuoy = 'enumeration',
    categoryOfLandRegion = 'enumeration',
    categoryOfLandmark = 'enumeration',
    categoryOfLateralMark = 'enumeration',
    categoryOfLight = 'enumeration',
    categoryOfMarineFarmCulture = 'enumeration',
    categoryOfMilitaryPracticeArea = 'enumeration',
    categoryOfMooringWarpingFacility = 'enumeration',
    categoryOfNavigationLine = 'enumeration',
    categoryOfObstruction = 'enumeration',
    categoryOfOffshorePlatform = 'enumeration',
    categoryOfOffshoreProductionArea = 'enumeration',
    categoryOfOilBarrier = 'enumeration',
    categoryOfPile = 'enumeration',
    categoryOfPilotBoardingPlace = 'enumeration',
    categoryOfPipelinePipe = 'enumeration',
    categoryOfPreference = 'enumeration',
    categoryOfProductionArea = 'enumeration',
    categoryOfPylon = 'enumeration',
    categoryOfRadarStation = 'enumeration',
    categoryOfRadarTransponderBeacon = 'enumeration',
    categoryOfRadioStation = 'enumeration',
    categoryOfRecommendedTrack = 'enumeration',
    categoryOfRescueStation = 'enumeration',
    categoryOfRestrictedArea = 'enumeration',
    categoryOfRoad = 'enumeration',
    categoryOfRunway = 'enumeration',
    categoryOfSchedule = 'enumeration',
    categoryOfSeaArea = 'enumeration',
    categoryOfShorelineConstruction = 'enumeration',
    categoryOfSignalStationTraffic = 'enumeration',
    categoryOfSignalStationWarning = 'enumeration',
    categoryOfSiloTank = 'enumeration',
    categoryOfSlope = 'enumeration',
    categoryOfSmallCraftFacility = 'enumeration',
    categoryOfSpecialPurposeMark = 'enumeration',
    categoryOfTemporalVariation = 'enumeration',
    categoryOfTidalStream = 'enumeration',
    categoryOfTrafficSeparationScheme = 'enumeration',
    categoryOfVegetation = 'enumeration',
    categoryOfWaterTurbulence = 'enumeration',
    categoryOfWeedKelp = 'enumeration',
    categoryOfWreck = 'enumeration',
    colour = 'enumeration',
    colourPattern = 'enumeration',
    communicationChannel = 'text',
    condition = 'enumeration',
    contactInstructions = 'text',
    dataAssessment = 'enumeration',
    dateDisused = 'S100_TruncatedDate',
    dateEnd = 'S100_TruncatedDate',
    dateFixed = 'S100_TruncatedDate',
    dateStart = 'S100_TruncatedDate',
    dateVariable = 'text',
    dayOfWeek = 'enumeration',
    dayOfWeekIsRange = 'boolean',
    defaultClearanceDepth = 'integer',
    depthRangeMaximumValue = 'real',
    depthRangeMinimumValue = 'real',
    displayName = 'boolean',
    distanceUnitOfMeasurement = 'enumeration',
    dredgedDate = 'S100_TruncatedDate',
    elevation = 'real',
    estimatedRangeOfTransmission = 'real',
    exhibitionConditionOfLight = 'enumeration',
    expositionOfSounding = 'enumeration',
    fileLocator = 'text',
    fileReference = 'text',
    flareAngle = 'integer',
    flareStack = 'boolean',
    flipBearing = 'integer',
    frequencyShoreStationReceives = 'integer',
    frequencyShoreStationTransmits = 'integer',
    fullSeafloorCoverageAchieved = 'boolean',
    headline = 'text',
    height = 'real',
    horizontalClearanceLength = 'real',
    horizontalClearanceValue = 'real',
    horizontalClearanceWidth = 'real',
    horizontalDistanceUncertainty = 'real',
    horizontalLength = 'real',
    horizontalWidth = 'real',
    iceFactor = 'real',
    inDispute = 'boolean',
    inTheWater = 'boolean',
    isMRCC = 'boolean',
    jurisdiction = 'enumeration',
    language = 'text',
    leastDepthOfDetectedFeaturesMeasured = 'boolean',
    liftingCapacity = 'real',
    lightCharacteristic = 'enumeration',
    lightVisibility = 'enumeration',
    lineSpacingMaximum = 'integer',
    lineSpacingMinimum = 'integer',
    linkage = 'text',
    mMSICode = 'text',
    magneticAnomalyValueMaximum = 'real',
    magneticAnomalyValueMinimum = 'real',
    majorLight = 'boolean',
    marksNavigationalSystemOf = 'enumeration',
    maximumDisplayScale = 'integer',
    maximumPermittedDraught = 'real',
    measuredDistance = 'integer',
    measurementDistanceMaximum = 'real',
    measurementDistanceMinimum = 'real',
    minimumDisplayScale = 'integer',
    moireEffect = 'boolean',
    multiplicityKnown = 'boolean',
    name = 'text',
    nameOfResource = 'text',
    nationality = 'text',
    natureOfConstruction = 'enumeration',
    natureOfSurface = 'enumeration',
    natureOfSurfaceQualifyingTerms = 'enumeration',
    numberOfFeatures = 'real',
    onlineFunction = 'enumeration',
    onlineResourceDescription = 'text',
    orientationUncertainty = 'real',
    orientationValue = 'real',
    pictorialRepresentation = 'text',
    pilotMovement = 'enumeration',
    product = 'enumeration',
    protocol = 'text',
    protocolRequest = 'text',
    qualityOfHorizontalMeasurement = 'enumeration',
    qualityOfVerticalMeasurement = 'enumeration',
    radarBand = 'text',
    radarConspicuous = 'boolean',
    radius = 'real',
    referenceLocation = 'text',
    referenceTide = 'enumeration',
    referenceTideType = 'enumeration',
    referenceYearForMagneticVariation = 'S100_TruncatedDate',
    regulationCitation = 'text',
    reportedDate = 'S100_TruncatedDate',
    restriction = 'enumeration',
    scaleMinimum = 'integer',
    scaleValueMaximum = 'integer',
    scaleValueMinimum = 'integer',
    sectorBearing = 'real',
    sectorExtension = 'integer',
    sectorLineLength = 'integer',
    signalDuration = 'real',
    signalFrequency = 'integer',
    signalGeneration = 'enumeration',
    signalGroup = 'text',
    signalPeriod = 'real',
    signalStatus = 'enumeration',
    significantFeaturesDetected = 'boolean',
    sizeOfFeaturesDetected = 'real',
    source = 'text',
    speedLimit = 'real',
    speedMaximum = 'real',
    speedMinimum = 'real',
    stationName = 'text',
    stationNumber = 'integer',
    status = 'enumeration',
    streamDepth = 'real',
    surroundingDepth = 'real',
    surveyAuthority = 'text',
    surveyType = 'enumeration',
    sweptDate = 'S100_TruncatedDate',
    techniqueOfVerticalMeasurement = 'enumeration',
    telcomCarrier = 'text',
    telecommunicationIdentifier = 'text',
    telecommunicationService = 'enumeration',
    text = 'text',
    textJustification = 'enumeration',
    textType = 'enumeration',
    timeOfDayEnd = 'time',
    timeOfDayStart = 'time',
    timeRelativeToTide = 'integer',
    topmarkDaymarkShape = 'enumeration',
    trafficFlow = 'enumeration',
    uncertaintyFixed = 'real',
    uncertaintyVariableFactor = 'real',
    underlyingLayer = 'integer',
    valueOfAnnualChangeInMagneticVariation = 'real',
    valueOfDepthContour = 'real',
    valueOfMagneticVariation = 'real',
    valueOfMaximumRange = 'real',
    valueOfNominalRange = 'real',
    valueOfSounding = 'real',
    verticalClearanceValue = 'real',
    verticalDatum = 'enumeration',
    verticalLength = 'real',
    vesselClass = 'text',
    virtualAISAidToNavigationType = 'enumeration',
    visuallyConspicuous = 'enumeration',
    waterLevelEffect = 'enumeration',
    waterwayDistance = 'real',
    waveLengthValue = 'real' }
featureTypes['function'] = 'enumeration'

local mult = {}
mult['applicationProfile'] = {}
mult['applicationProfile']['onlineResource'] = true
mult['categoryOfAirportAirfield'] = {}
mult['categoryOfAirportAirfield']['AirportAirfield'] = true
mult['categoryOfAnchorage'] = {}
mult['categoryOfAnchorage']['AnchorBerth'] = true
mult['categoryOfAnchorage']['AnchorageArea'] = true
mult['categoryOfCable'] = {}
mult['categoryOfCable']['CableArea'] = true
mult['categoryOfFence'] = {}
mult['categoryOfFence']['FenceWall'] = true
mult['categoryOfFerry'] = {}
mult['categoryOfFerry']['FerryRoute'] = true
mult['categoryOfHarbourFacility'] = {}
mult['categoryOfHarbourFacility']['HarbourFacility'] = true
mult['categoryOfHulk'] = {}
mult['categoryOfHulk']['Hulk'] = true
mult['categoryOfLandRegion'] = {}
mult['categoryOfLandRegion']['LandRegion'] = true
mult['categoryOfLandmark'] = {}
mult['categoryOfLandmark']['Landmark'] = true
mult['categoryOfLight'] = {}
mult['categoryOfLight']['LightAllAround'] = true
mult['categoryOfLight']['LightSectored'] = true
mult['categoryOfMilitaryPracticeArea'] = {}
mult['categoryOfMilitaryPracticeArea']['MilitaryPracticeArea'] = true
mult['categoryOfPipelinePipe'] = {}
mult['categoryOfPipelinePipe']['PipelineSubmarineOnLand'] = true
mult['categoryOfPipelinePipe']['SubmarinePipelineArea'] = true
mult['categoryOfRadarStation'] = {}
mult['categoryOfRadarStation']['RadarStation'] = true
mult['categoryOfRescueStation'] = {}
mult['categoryOfRescueStation']['RescueStation'] = true
mult['categoryOfRunway'] = {}
mult['categoryOfRunway']['Runway'] = true
mult['categoryOfSignalStationTraffic'] = {}
mult['categoryOfSignalStationTraffic']['SignalStationTraffic'] = true
mult['categoryOfSignalStationWarning'] = {}
mult['categoryOfSignalStationWarning']['SignalStationWarning'] = true
mult['categoryOfSmallCraftFacility'] = {}
mult['categoryOfSmallCraftFacility']['SmallCraftFacility'] = true
mult['categoryOfSpecialPurposeMark'] = {}
mult['categoryOfSpecialPurposeMark']['BeaconSpecialPurposeGeneral'] = true
mult['categoryOfSpecialPurposeMark']['BuoySpecialPurposeGeneral'] = true
mult['categoryOfSpecialPurposeMark']['Daymark'] = true
mult['categoryOfSpecialPurposeMark']['Landmark'] = true
mult['colour'] = {}
mult['colour']['lightSector'] = true
mult['colour']['BeaconCardinal'] = true
mult['colour']['BeaconIsolatedDanger'] = true
mult['colour']['BeaconLateral'] = true
mult['colour']['BeaconSafeWater'] = true
mult['colour']['BeaconSpecialPurposeGeneral'] = true
mult['colour']['Bridge'] = true
mult['colour']['Building'] = true
mult['colour']['BuoyCardinal'] = true
mult['colour']['BuoyEmergencyWreckMarking'] = true
mult['colour']['BuoyInstallation'] = true
mult['colour']['BuoyIsolatedDanger'] = true
mult['colour']['BuoyLateral'] = true
mult['colour']['BuoySafeWater'] = true
mult['colour']['BuoySpecialPurposeGeneral'] = true
mult['colour']['Coastline'] = true
mult['colour']['Conveyor'] = true
mult['colour']['Crane'] = true
mult['colour']['Dam'] = true
mult['colour']['Daymark'] = true
mult['colour']['FenceWall'] = true
mult['colour']['FloatingDock'] = true
mult['colour']['Hulk'] = true
mult['colour']['Landmark'] = true
mult['colour']['LightAirObstruction'] = true
mult['colour']['LightAllAround'] = true
mult['colour']['LightFloat'] = true
mult['colour']['LightFogDetector'] = true
mult['colour']['LightVessel'] = true
mult['colour']['MooringWarpingFacility'] = true
mult['colour']['OffshorePlatform'] = true
mult['colour']['Pile'] = true
mult['colour']['PylonBridgeSupport'] = true
mult['colour']['Retroreflector'] = true
mult['colour']['ShorelineConstruction'] = true
mult['colour']['SiloTank'] = true
mult['colour']['SlopeTopline'] = true
mult['colour']['SlopingGround'] = true
mult['communicationChannel'] = {}
mult['communicationChannel']['CoastguardStation'] = true
mult['communicationChannel']['HarbourFacility'] = true
mult['communicationChannel']['PilotageDistrict'] = true
mult['communicationChannel']['RadarRange'] = true
mult['communicationChannel']['RadarStation'] = true
mult['communicationChannel']['RadioCallingInPoint'] = true
mult['communicationChannel']['RadioStation'] = true
mult['communicationChannel']['RescueStation'] = true
mult['communicationChannel']['SignalStationTraffic'] = true
mult['communicationChannel']['SignalStationWarning'] = true
mult['contactInstructions'] = {}
mult['contactInstructions']['frequencyPair'] = true
mult['dayOfWeek'] = {}
mult['dayOfWeek']['timeIntervalsByDayOfWeek'] = true
mult['featureName'] = {}
mult['featureName']['AdministrationArea'] = true
mult['featureName']['AirportAirfield'] = true
mult['featureName']['AnchorBerth'] = true
mult['featureName']['AnchorageArea'] = true
mult['featureName']['ArchipelagicSeaLane'] = true
mult['featureName']['ArchipelagicSeaLaneArea'] = true
mult['featureName']['ArchipelagicSeaLaneAxis'] = true
mult['featureName']['BeaconCardinal'] = true
mult['featureName']['BeaconIsolatedDanger'] = true
mult['featureName']['BeaconLateral'] = true
mult['featureName']['BeaconSafeWater'] = true
mult['featureName']['BeaconSpecialPurposeGeneral'] = true
mult['featureName']['Berth'] = true
mult['featureName']['Bridge'] = true
mult['featureName']['Building'] = true
mult['featureName']['BuiltUpArea'] = true
mult['featureName']['BuoyCardinal'] = true
mult['featureName']['BuoyEmergencyWreckMarking'] = true
mult['featureName']['BuoyInstallation'] = true
mult['featureName']['BuoyIsolatedDanger'] = true
mult['featureName']['BuoyLateral'] = true
mult['featureName']['BuoySafeWater'] = true
mult['featureName']['BuoySpecialPurposeGeneral'] = true
mult['featureName']['CableArea'] = true
mult['featureName']['CableOverhead'] = true
mult['featureName']['CableSubmarine'] = true
mult['featureName']['Canal'] = true
mult['featureName']['CargoTranshipmentArea'] = true
mult['featureName']['Causeway'] = true
mult['featureName']['Checkpoint'] = true
mult['featureName']['CoastguardStation'] = true
mult['featureName']['Coastline'] = true
mult['featureName']['ContinentalShelfArea'] = true
mult['featureName']['Conveyor'] = true
mult['featureName']['Crane'] = true
mult['featureName']['CurrentNonGravitational'] = true
mult['featureName']['Dam'] = true
mult['featureName']['Daymark'] = true
mult['featureName']['DeepWaterRoute'] = true
mult['featureName']['DeepWaterRoutePart'] = true
mult['featureName']['DistanceMark'] = true
mult['featureName']['DockArea'] = true
mult['featureName']['DredgedArea'] = true
mult['featureName']['DryDock'] = true
mult['featureName']['Dyke'] = true
mult['featureName']['Fairway'] = true
mult['featureName']['FenceWall'] = true
mult['featureName']['FerryRoute'] = true
mult['featureName']['FisheryZone'] = true
mult['featureName']['FishingFacility'] = true
mult['featureName']['FishingGround'] = true
mult['featureName']['FloatingDock'] = true
mult['featureName']['FogSignal'] = true
mult['featureName']['FortifiedStructure'] = true
mult['featureName']['FoulGround'] = true
mult['featureName']['FreePortArea'] = true
mult['featureName']['Gate'] = true
mult['featureName']['Gridiron'] = true
mult['featureName']['HarbourAreaAdministrative'] = true
mult['featureName']['HarbourFacility'] = true
mult['featureName']['Hulk'] = true
mult['featureName']['IceArea'] = true
mult['featureName']['InformationArea'] = true
mult['featureName']['IslandGroup'] = true
mult['featureName']['Lake'] = true
mult['featureName']['LandArea'] = true
mult['featureName']['LandElevation'] = true
mult['featureName']['LandRegion'] = true
mult['featureName']['Landmark'] = true
mult['featureName']['LightAirObstruction'] = true
mult['featureName']['LightAllAround'] = true
mult['featureName']['LightFloat'] = true
mult['featureName']['LightFogDetector'] = true
mult['featureName']['LightSectored'] = true
mult['featureName']['LightVessel'] = true
mult['featureName']['LocalMagneticAnomaly'] = true
mult['featureName']['LockBasin'] = true
mult['featureName']['LogPond'] = true
mult['featureName']['MarineFarmCulture'] = true
mult['featureName']['MilitaryPracticeArea'] = true
mult['featureName']['MooringWarpingFacility'] = true
mult['featureName']['Obstruction'] = true
mult['featureName']['OffshorePlatform'] = true
mult['featureName']['OffshoreProductionArea'] = true
mult['featureName']['OilBarrier'] = true
mult['featureName']['Pile'] = true
mult['featureName']['PilotBoardingPlace'] = true
mult['featureName']['PilotageDistrict'] = true
mult['featureName']['PipelineOverhead'] = true
mult['featureName']['PipelineSubmarineOnLand'] = true
mult['featureName']['Pontoon'] = true
mult['featureName']['PrecautionaryArea'] = true
mult['featureName']['ProductionStorageArea'] = true
mult['featureName']['PylonBridgeSupport'] = true
mult['featureName']['RadarLine'] = true
mult['featureName']['RadarRange'] = true
mult['featureName']['RadarStation'] = true
mult['featureName']['RadarTransponderBeacon'] = true
mult['featureName']['RadioCallingInPoint'] = true
mult['featureName']['RadioStation'] = true
mult['featureName']['Railway'] = true
mult['featureName']['RangeSystem'] = true
mult['featureName']['Rapids'] = true
mult['featureName']['RecommendedRouteCentreline'] = true
mult['featureName']['RecommendedTrack'] = true
mult['featureName']['RescueStation'] = true
mult['featureName']['River'] = true
mult['featureName']['Road'] = true
mult['featureName']['Runway'] = true
mult['featureName']['SeaAreaNamedWaterArea'] = true
mult['featureName']['SeabedArea'] = true
mult['featureName']['SeaplaneLandingArea'] = true
mult['featureName']['ShorelineConstruction'] = true
mult['featureName']['SignalStationTraffic'] = true
mult['featureName']['SignalStationWarning'] = true
mult['featureName']['SiloTank'] = true
mult['featureName']['SlopeTopline'] = true
mult['featureName']['SlopingGround'] = true
mult['featureName']['SmallCraftFacility'] = true
mult['featureName']['Sounding'] = true
mult['featureName']['Spring'] = true
mult['featureName']['SubmarinePipelineArea'] = true
mult['featureName']['SubmarineTransitLane'] = true
mult['featureName']['TidalStreamFloodEbb'] = true
mult['featureName']['TidalStreamPanelData'] = true
mult['featureName']['Tideway'] = true
mult['featureName']['TrafficSeparationScheme'] = true
mult['featureName']['Tunnel'] = true
mult['featureName']['TwoWayRoute'] = true
mult['featureName']['UnderwaterAwashRock'] = true
mult['featureName']['Vegetation'] = true
mult['featureName']['VesselTrafficServiceArea'] = true
mult['featureName']['WaterTurbulence'] = true
mult['featureName']['Waterfall'] = true
mult['featureName']['WeedKelp'] = true
mult['featureName']['Wreck'] = true
mult['frequencyShoreStationReceives'] = {}
mult['frequencyShoreStationReceives']['frequencyPair'] = true
mult['frequencyShoreStationTransmits'] = {}
mult['frequencyShoreStationTransmits']['frequencyPair'] = true
mult['function'] = {}
mult['function']['Building'] = true
mult['function']['Landmark'] = true
mult['lightSector'] = {}
mult['lightSector']['sectorCharacteristic'] = true
mult['lightVisibility'] = {}
mult['lightVisibility']['lightSector'] = true
mult['lightVisibility']['LightAirObstruction'] = true
mult['nameOfResource'] = {}
mult['nameOfResource']['onlineResource'] = true
mult['nationality'] = {}
mult['nationality']['AdministrationArea'] = true
mult['nationality']['ContiguousZone'] = true
mult['nationality']['ContinentalShelfArea'] = true
mult['nationality']['ExclusiveEconomicZone'] = true
mult['nationality']['TerritorialSeaArea'] = true
mult['natureOfConstruction'] = {}
mult['natureOfConstruction']['BeaconCardinal'] = true
mult['natureOfConstruction']['BeaconIsolatedDanger'] = true
mult['natureOfConstruction']['BeaconLateral'] = true
mult['natureOfConstruction']['BeaconSafeWater'] = true
mult['natureOfConstruction']['BeaconSpecialPurposeGeneral'] = true
mult['natureOfConstruction']['Bridge'] = true
mult['natureOfConstruction']['Building'] = true
mult['natureOfConstruction']['BuoyCardinal'] = true
mult['natureOfConstruction']['BuoyEmergencyWreckMarking'] = true
mult['natureOfConstruction']['BuoyInstallation'] = true
mult['natureOfConstruction']['BuoyIsolatedDanger'] = true
mult['natureOfConstruction']['BuoyLateral'] = true
mult['natureOfConstruction']['BuoySafeWater'] = true
mult['natureOfConstruction']['BuoySpecialPurposeGeneral'] = true
mult['natureOfConstruction']['Causeway'] = true
mult['natureOfConstruction']['Dam'] = true
mult['natureOfConstruction']['Daymark'] = true
mult['natureOfConstruction']['Dyke'] = true
mult['natureOfConstruction']['FenceWall'] = true
mult['natureOfConstruction']['FortifiedStructure'] = true
mult['natureOfConstruction']['Gate'] = true
mult['natureOfConstruction']['Gridiron'] = true
mult['natureOfConstruction']['HarbourFacility'] = true
mult['natureOfConstruction']['Landmark'] = true
mult['natureOfConstruction']['LightFloat'] = true
mult['natureOfConstruction']['LightVessel'] = true
mult['natureOfConstruction']['MooringWarpingFacility'] = true
mult['natureOfConstruction']['PylonBridgeSupport'] = true
mult['natureOfConstruction']['Road'] = true
mult['natureOfConstruction']['Runway'] = true
mult['natureOfConstruction']['ShorelineConstruction'] = true
mult['natureOfConstruction']['SiloTank'] = true
mult['natureOfSurface'] = {}
mult['natureOfSurface']['Coastline'] = true
mult['natureOfSurface']['LandRegion'] = true
mult['natureOfSurface']['Obstruction'] = true
mult['natureOfSurface']['SlopeTopline'] = true
mult['natureOfSurface']['SlopingGround'] = true
mult['natureOfSurfaceQualifyingTerms'] = {}
mult['natureOfSurfaceQualifyingTerms']['surfaceCharacteristics'] = true
mult['onlineFunction'] = {}
mult['onlineFunction']['onlineResource'] = true
mult['onlineResourceDescription'] = {}
mult['onlineResourceDescription']['onlineResource'] = true
mult['orientationValue'] = {}
mult['orientationValue']['RadioCallingInPoint'] = true
mult['periodicDateRange'] = {}
mult['periodicDateRange']['AnchorBerth'] = true
mult['periodicDateRange']['AnchorageArea'] = true
mult['periodicDateRange']['BeaconCardinal'] = true
mult['periodicDateRange']['BeaconIsolatedDanger'] = true
mult['periodicDateRange']['BeaconLateral'] = true
mult['periodicDateRange']['BeaconSafeWater'] = true
mult['periodicDateRange']['BeaconSpecialPurposeGeneral'] = true
mult['periodicDateRange']['Berth'] = true
mult['periodicDateRange']['BuoyCardinal'] = true
mult['periodicDateRange']['BuoyInstallation'] = true
mult['periodicDateRange']['BuoyIsolatedDanger'] = true
mult['periodicDateRange']['BuoyLateral'] = true
mult['periodicDateRange']['BuoySafeWater'] = true
mult['periodicDateRange']['BuoySpecialPurposeGeneral'] = true
mult['periodicDateRange']['CargoTranshipmentArea'] = true
mult['periodicDateRange']['CautionArea'] = true
mult['periodicDateRange']['CoastguardStation'] = true
mult['periodicDateRange']['CurrentNonGravitational'] = true
mult['periodicDateRange']['Daymark'] = true
mult['periodicDateRange']['FerryRoute'] = true
mult['periodicDateRange']['FishingFacility'] = true
mult['periodicDateRange']['FishingGround'] = true
mult['periodicDateRange']['FogSignal'] = true
mult['periodicDateRange']['HarbourFacility'] = true
mult['periodicDateRange']['IceArea'] = true
mult['periodicDateRange']['InformationArea'] = true
mult['periodicDateRange']['LightAirObstruction'] = true
mult['periodicDateRange']['LightAllAround'] = true
mult['periodicDateRange']['LightFloat'] = true
mult['periodicDateRange']['LightFogDetector'] = true
mult['periodicDateRange']['LightSectored'] = true
mult['periodicDateRange']['LightVessel'] = true
mult['periodicDateRange']['LogPond'] = true
mult['periodicDateRange']['MarineFarmCulture'] = true
mult['periodicDateRange']['MilitaryPracticeArea'] = true
mult['periodicDateRange']['MooringWarpingFacility'] = true
mult['periodicDateRange']['NavigationLine'] = true
mult['periodicDateRange']['PilotBoardingPlace'] = true
mult['periodicDateRange']['Pontoon'] = true
mult['periodicDateRange']['RadarReflector'] = true
mult['periodicDateRange']['RadarStation'] = true
mult['periodicDateRange']['RadarTransponderBeacon'] = true
mult['periodicDateRange']['RadioCallingInPoint'] = true
mult['periodicDateRange']['RadioStation'] = true
mult['periodicDateRange']['RecommendedRouteCentreline'] = true
mult['periodicDateRange']['RecommendedTrack'] = true
mult['periodicDateRange']['RescueStation'] = true
mult['periodicDateRange']['Retroreflector'] = true
mult['periodicDateRange']['Runway'] = true
mult['periodicDateRange']['SeaplaneLandingArea'] = true
mult['periodicDateRange']['SignalStationTraffic'] = true
mult['periodicDateRange']['SignalStationWarning'] = true
mult['periodicDateRange']['SmallCraftFacility'] = true
mult['pilotMovement'] = {}
mult['pilotMovement']['PilotBoardingPlace'] = true
mult['product'] = {}
mult['product']['Obstruction'] = true
mult['product']['OffshorePlatform'] = true
mult['product']['OffshoreProductionArea'] = true
mult['product']['PipelineOverhead'] = true
mult['product']['PipelineSubmarineOnLand'] = true
mult['product']['ProductionStorageArea'] = true
mult['product']['SiloTank'] = true
mult['product']['SubmarinePipelineArea'] = true
mult['protocol'] = {}
mult['protocol']['onlineResource'] = true
mult['protocolRequest'] = {}
mult['protocolRequest']['onlineResource'] = true
mult['qualityOfVerticalMeasurement'] = {}
mult['qualityOfVerticalMeasurement']['Berth'] = true
mult['qualityOfVerticalMeasurement']['DeepWaterRoutePart'] = true
mult['qualityOfVerticalMeasurement']['DryDock'] = true
mult['qualityOfVerticalMeasurement']['Fairway'] = true
mult['qualityOfVerticalMeasurement']['FoulGround'] = true
mult['qualityOfVerticalMeasurement']['Gate'] = true
mult['qualityOfVerticalMeasurement']['MarineFarmCulture'] = true
mult['qualityOfVerticalMeasurement']['MooringWarpingFacility'] = true
mult['qualityOfVerticalMeasurement']['Obstruction'] = true
mult['qualityOfVerticalMeasurement']['QualityOfSurvey'] = true
mult['qualityOfVerticalMeasurement']['RecommendedRouteCentreline'] = true
mult['qualityOfVerticalMeasurement']['RecommendedTrack'] = true
mult['qualityOfVerticalMeasurement']['Sounding'] = true
mult['qualityOfVerticalMeasurement']['TwoWayRoutePart'] = true
mult['qualityOfVerticalMeasurement']['UnderwaterAwashRock'] = true
mult['qualityOfVerticalMeasurement']['Wreck'] = true
mult['radarWaveLength'] = {}
mult['radarWaveLength']['RadarTransponderBeacon'] = true
mult['restriction'] = {}
mult['restriction']['AnchorageArea'] = true
mult['restriction']['CableArea'] = true
mult['restriction']['CargoTranshipmentArea'] = true
mult['restriction']['DeepWaterRoutePart'] = true
mult['restriction']['DredgedArea'] = true
mult['restriction']['Fairway'] = true
mult['restriction']['FishingGround'] = true
mult['restriction']['HarbourFacility'] = true
mult['restriction']['InshoreTrafficZone'] = true
mult['restriction']['MarineFarmCulture'] = true
mult['restriction']['MilitaryPracticeArea'] = true
mult['restriction']['OffshoreProductionArea'] = true
mult['restriction']['PipelineSubmarineOnLand'] = true
mult['restriction']['PrecautionaryArea'] = true
mult['restriction']['SeaplaneLandingArea'] = true
mult['restriction']['SubmarinePipelineArea'] = true
mult['restriction']['SubmarineTransitLane'] = true
mult['restriction']['TerritorialSeaArea'] = true
mult['restriction']['TrafficSeparationSchemeCrossing'] = true
mult['restriction']['TrafficSeparationSchemeLanePart'] = true
mult['restriction']['TrafficSeparationSchemeRoundabout'] = true
mult['sectorCharacteristic'] = {}
mult['sectorCharacteristic']['LightSectored'] = true
mult['sectorInformation'] = {}
mult['sectorInformation']['lightSector'] = true
mult['shapeInformation'] = {}
mult['shapeInformation']['Daymark'] = true
mult['signalGroup'] = {}
mult['signalGroup']['rhythmOfLight'] = true
mult['signalGroup']['sectorCharacteristic'] = true
mult['signalSequence'] = {}
mult['signalSequence']['rhythmOfLight'] = true
mult['signalSequence']['sectorCharacteristic'] = true
mult['signalSequence']['FogSignal'] = true
mult['signalSequence']['RadarTransponderBeacon'] = true
mult['status'] = {}
mult['status']['AirportAirfield'] = true
mult['status']['AnchorBerth'] = true
mult['status']['AnchorageArea'] = true
mult['status']['BeaconCardinal'] = true
mult['status']['BeaconIsolatedDanger'] = true
mult['status']['BeaconLateral'] = true
mult['status']['BeaconSafeWater'] = true
mult['status']['BeaconSpecialPurposeGeneral'] = true
mult['status']['Berth'] = true
mult['status']['Bridge'] = true
mult['status']['Building'] = true
mult['status']['BuoyCardinal'] = true
mult['status']['BuoyInstallation'] = true
mult['status']['BuoyIsolatedDanger'] = true
mult['status']['BuoyLateral'] = true
mult['status']['BuoySafeWater'] = true
mult['status']['BuoySpecialPurposeGeneral'] = true
mult['status']['CableArea'] = true
mult['status']['CableOverhead'] = true
mult['status']['CableSubmarine'] = true
mult['status']['Canal'] = true
mult['status']['CargoTranshipmentArea'] = true
mult['status']['Causeway'] = true
mult['status']['Checkpoint'] = true
mult['status']['CoastguardStation'] = true
mult['status']['Conveyor'] = true
mult['status']['Crane'] = true
mult['status']['Dam'] = true
mult['status']['Daymark'] = true
mult['status']['DeepWaterRoutePart'] = true
mult['status']['DockArea'] = true
mult['status']['DryDock'] = true
mult['status']['Fairway'] = true
mult['status']['FenceWall'] = true
mult['status']['FerryRoute'] = true
mult['status']['FisheryZone'] = true
mult['status']['FishingFacility'] = true
mult['status']['FishingGround'] = true
mult['status']['FloatingDock'] = true
mult['status']['FogSignal'] = true
mult['status']['FortifiedStructure'] = true
mult['status']['FoulGround'] = true
mult['status']['FreePortArea'] = true
mult['status']['Gate'] = true
mult['status']['Gridiron'] = true
mult['status']['HarbourAreaAdministrative'] = true
mult['status']['HarbourFacility'] = true
mult['status']['IceArea'] = true
mult['status']['InshoreTrafficZone'] = true
mult['status']['Landmark'] = true
mult['status']['LightAirObstruction'] = true
mult['status']['LightAllAround'] = true
mult['status']['LightFloat'] = true
mult['status']['LightFogDetector'] = true
mult['status']['LightSectored'] = true
mult['status']['LightVessel'] = true
mult['status']['LockBasin'] = true
mult['status']['LogPond'] = true
mult['status']['MarineFarmCulture'] = true
mult['status']['MilitaryPracticeArea'] = true
mult['status']['MooringWarpingFacility'] = true
mult['status']['NavigationLine'] = true
mult['status']['Obstruction'] = true
mult['status']['OffshorePlatform'] = true
mult['status']['OffshoreProductionArea'] = true
mult['status']['OilBarrier'] = true
mult['status']['Pile'] = true
mult['status']['PilotBoardingPlace'] = true
mult['status']['PipelineOverhead'] = true
mult['status']['PipelineSubmarineOnLand'] = true
mult['status']['Pontoon'] = true
mult['status']['PrecautionaryArea'] = true
mult['status']['ProductionStorageArea'] = true
mult['status']['PylonBridgeSupport'] = true
mult['status']['RadarLine'] = true
mult['status']['RadarRange'] = true
mult['status']['RadarReflector'] = true
mult['status']['RadarStation'] = true
mult['status']['RadarTransponderBeacon'] = true
mult['status']['RadioCallingInPoint'] = true
mult['status']['RadioStation'] = true
mult['status']['Railway'] = true
mult['status']['RecommendedRouteCentreline'] = true
mult['status']['RecommendedTrack'] = true
mult['status']['RecommendedTrafficLanePart'] = true
mult['status']['RescueStation'] = true
mult['status']['Retroreflector'] = true
mult['status']['Road'] = true
mult['status']['Runway'] = true
mult['status']['SeaplaneLandingArea'] = true
mult['status']['ShorelineConstruction'] = true
mult['status']['SignalStationTraffic'] = true
mult['status']['SignalStationWarning'] = true
mult['status']['SiloTank'] = true
mult['status']['SmallCraftFacility'] = true
mult['status']['SubmarinePipelineArea'] = true
mult['status']['TrafficSeparationLine'] = true
mult['status']['TrafficSeparationSchemeBoundary'] = true
mult['status']['TrafficSeparationSchemeCrossing'] = true
mult['status']['TrafficSeparationSchemeLanePart'] = true
mult['status']['TrafficSeparationSchemeRoundabout'] = true
mult['status']['TrafficSeparationZone'] = true
mult['status']['Tunnel'] = true
mult['status']['TwoWayRoutePart'] = true
mult['status']['Wreck'] = true
mult['surfaceCharacteristics'] = {}
mult['surfaceCharacteristics']['SeabedArea'] = true
mult['surveyType'] = {}
mult['surveyType']['QualityOfSurvey'] = true
mult['techniqueOfVerticalMeasurement'] = {}
mult['techniqueOfVerticalMeasurement']['DeepWaterRoutePart'] = true
mult['techniqueOfVerticalMeasurement']['DepthNoBottomFound'] = true
mult['techniqueOfVerticalMeasurement']['DredgedArea'] = true
mult['techniqueOfVerticalMeasurement']['FoulGround'] = true
mult['techniqueOfVerticalMeasurement']['Obstruction'] = true
mult['techniqueOfVerticalMeasurement']['QualityOfSurvey'] = true
mult['techniqueOfVerticalMeasurement']['RecommendedRouteCentreline'] = true
mult['techniqueOfVerticalMeasurement']['RecommendedTrack'] = true
mult['techniqueOfVerticalMeasurement']['Sounding'] = true
mult['techniqueOfVerticalMeasurement']['TwoWayRoutePart'] = true
mult['techniqueOfVerticalMeasurement']['UnderwaterAwashRock'] = true
mult['techniqueOfVerticalMeasurement']['Wreck'] = true
mult['tidalStreamPanelValues'] = {}
mult['tidalStreamPanelValues']['TidalStreamPanelData'] = true
mult['tidalStreamValue'] = {}
mult['tidalStreamValue']['tidalStreamPanelValues'] = true
mult['timeIntervalsByDayOfWeek'] = {}
mult['timeIntervalsByDayOfWeek']['scheduleByDayOfWeek'] = true
mult['timeOfDayEnd'] = {}
mult['timeOfDayEnd']['timeIntervalsByDayOfWeek'] = true
mult['timeOfDayStart'] = {}
mult['timeOfDayStart']['timeIntervalsByDayOfWeek'] = true
mult['updateDescription'] = {}
mult['updateDescription']['UpdateInformation'] = true

local ffi = require('ffi')
local C = ffi.C

local function makeArrayOrSingle(buf, len, obj, name)
    if mult[name][obj.Code] then
        local array = {}
        for i = 1, len do
            array[i] = buf[i]
        end
        return array
    elseif len == 0 then
        return nil
    else
        return buf[1]
    end
end

local function makeArrayOrSingleFun(buf, len, obj, name, fun)
    if mult[name][obj.Code] then
        local array = {}
        for i = 1, len do
            array[i] = fun(buf[i])
        end
        return array
    elseif len == 0 then
        return nil
    else
        return fun(buf[1])
    end
end

local stubMeta

local function makeComplexStubMaker(attrname)
    return function(ptr)
        local stub = { attr_node_ptr = ptr, Code = attrname }
        setmetatable(stub, stubMeta)
        return stub
    end
end

local make_function = {
    real = function(name)
        local buf = ffi.new('double[101]')
        local multObjects = mult[name]
        local fun
        if not multObjects then
            fun = function(obj)
                local len = C.LuaHost_getRealAttributes(obj.attr_node_ptr, name, buf, 100)
                if len == 0 then
                    return nil
                else
                    return buf[1]
                end
            end
        else
            fun = function(obj)
                local len = C.LuaHost_getRealAttributes(obj.attr_node_ptr, name, buf, 100)
                return makeArrayOrSingle(buf, len, obj, name)
            end
        end
        return fun
    end,
    integer = function(name)
        local buf = ffi.new('int[101]')
        local multObjects = mult[name]
        local fun
        if not multObjects then
            fun = function(obj)
                local len = C.LuaHost_getIntegerAttributes(obj.attr_node_ptr, name, buf, 100)
                if len == 0 then
                    return nil
                else
                    return buf[1]
                end
            end
        else
            fun = function(obj)
                local len = C.LuaHost_getIntegerAttributes(obj.attr_node_ptr, name, buf, 100)
                return makeArrayOrSingle(buf, len, obj, name)
            end
        end
        return fun
    end,
    boolean = function(name)
        local buf = ffi.new('bool[101]')
        local multObjects = mult[name]
        local fun
        if not multObjects then
            fun = function(obj)
                local len = C.LuaHost_getBoolAttributes(obj.attr_node_ptr, name, buf, 100)
                if len == 0 then
                    return nil
                else
                    return buf[1]
                end
            end
        else
            fun = function(obj)
                local len = C.LuaHost_getBoolAttributes(obj.attr_node_ptr, name, buf, 100)
                return makeArrayOrSingle(buf, len, obj, name)
            end
        end
        return fun
    end,
    text = function(name)
        local buf = ffi.new('const char *[101]')
        local multObjects = mult[name]
        local fun
        if not multObjects then
            fun = function(obj)
                local len = C.LuaHost_getTextAttributes(obj.attr_node_ptr, name, buf, 100)
                if len == 0 then
                    return nil
                else
                    return ffi.string(buf[1])
                end
            end
        else
            fun = function(obj)
                local len = C.LuaHost_getTextAttributes(obj.attr_node_ptr, name, buf, 100)
                return makeArrayOrSingleFun(buf, len, obj, name, ffi.string)
            end
        end
        return fun
    end,
    complex = function(name)
        local buf = ffi.new('void*[101]')
        local stubMaker = makeComplexStubMaker(name)
        local multObjects = mult[name]
        local fun
        if not multObjects then
            fun = function(obj)
                local len = C.LuaHost_getComplexAttributes(obj.attr_node_ptr, name, buf, 100)
                if len == 0 then
                    return nil
                else
                    return stubMaker(buf[1])
                end
            end
        else
            fun = function(obj)
                local len = C.LuaHost_getComplexAttributes(obj.attr_node_ptr, name, buf, 100)
                return makeArrayOrSingleFun(buf, len, obj, name, stubMaker)
            end
        end
        return fun
    end
}
make_function.enumeration = make_function.integer

local functions = {}

for k, v in pairs(featureTypes) do
    if make_function[v] then
        functions[k] = make_function[v](k)
    end
end

local mayBeNil = '!'
local mayBeNilByte = mayBeNil:byte()

local enumVal = '$'
local enumValByte = enumVal:byte()

stubMeta = {
    __index = function(t, k)

        local k1 = k

        local nilIfMissing = false

        if k:byte() == mayBeNilByte then
            -- Is this a "nil if missing" attribute?
            nilIfMissing = true
            k = k:sub(2)
        elseif k:byte() == enumValByte then
            -- Is this an enum string attribute?
            k = k:sub(2)
        end

        if not functions[k] then
            error('Unknown attribute ' .. k .. ' ' .. t.ID)
        end

        local value = functions[k](t)

        --        if type(value) == 'nil' and not nilIfMissing then
        --            error('Missing attribute ' .. k .. ' for object of type ' .. t.Code)
        --        end

        t[k] = value
        t[k1] = value

        return value
    end
}

return stubMeta.__index