--[[
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
--]]


--[[
		* Need help with the KKStartupConfig settings?
		* ------ http://www.kobold2d.com/x/ygMO ------
--]]


local config =
{
	KKStartupConfig = 
	{
		-- load first scene from a class with this name, or from a Lua script with this name with .lua appended
		--FirstSceneClassName = "TileMapLayer",
        --FirstSceneClassName = "GridLayer",
        FirstSceneClassName = "BackgroundLayer",

		MaxFrameRate = 60,
		DisplayFPS = YES,

		EnableUserInteraction = YES,
		EnableMultiTouch = NO,

		-- Render settings
		DefaultTexturePixelFormat = TexturePixelFormat.RGBA8888,
		GLViewColorFormat = GLViewColorFormat.RGB565,
		GLViewDepthFormat = GLViewDepthFormat.DepthNone,
		GLViewMultiSampling = NO,
		GLViewNumberOfSamples = 0,

		Enable2DProjection = NO,
		EnableRetinaDisplaySupport = NO,
		EnableGLViewNodeHitTesting = NO,
		EnableStatusBar = NO,

		-- Orientation & Autorotation
		-- Kobold2D uses the supported orientations from the Target's Summary pane: http://cl.ly/2l132Z2f463H2O3r0M1O
		-- (same as Info.plist key UISupportedInterfaceOrientations aka "Supported interface orientations")
	
		-- iAd setup
		EnableAdBanner = NO,
		PlaceBannerOnBottom = YES,
		LoadOnlyPortraitBanners = NO,
		LoadOnlyLandscapeBanners = NO,
		AdProviders = "iAd, AdMob",	-- comma seperated list -> "iAd, AdMob" means: use iAd if available, otherwise AdMob
		AdMobRefreshRate = 15,
		AdMobFirstAdDelay = 5,
		AdMobPublisherID = "YOUR_ADMOB_PUBLISHER_ID", -- how to get an AdMob Publisher ID: http://developer.admob.com/wiki/PublisherSetup
		AdMobTestMode = YES,
	
		-- Mac OS specific settings
		AutoScale = NO,
		AcceptsMouseMovedEvents = NO,
		EnableFullScreen = NO,
	},
	
	-- you can create your own config sections using the same mechanism and use KKConfig to access the parameters
	-- or use the KKConfig injectPropertiesFromKeyPath method
    BackgroundSettings =
    {
        BackgroundImage = "bkgrnd.jpg",
    },
	GridLayoutSettings =
	{
        GridOriginX = 200,
        GridOriginY = 100,
		GridWidthInPixels = 624,
		GridHeightInPixels = 624,
		GridRowCount = 10,
        GridColumnCount = 10,
        GridLineColorRed = 255,
        GridLineColorGreen = 255,
        GridLineColorBlue = 255,
        GridLineColorAlpha = 80,
        GridLineWidth = 1,
	},
    UILayerSettings =
    {
        LabelWidthInPixels = 130,
        LabelHeightInPixels = 250,
        LabelFontName = "Arial",
        LabelFontSize = 24,
    },
}

return config
