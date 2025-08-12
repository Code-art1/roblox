-- إعدادات متقدمة للسكريبت
-- يمكنك تعديل هذه القيم حسب احتياجاتك

local AdvancedConfig = {
    -- إعدادات الواجهة
    UI = {
        -- الألوان
        Colors = {
            Primary = Color3.fromRGB(25, 25, 35),      -- اللون الأساسي
            Secondary = Color3.fromRGB(35, 35, 50),    -- اللون الثانوي
            Accent = Color3.fromRGB(0, 123, 255),      -- لون التمييز
            Success = Color3.fromRGB(40, 167, 69),     -- لون النجاح
            Danger = Color3.fromRGB(220, 53, 69),      -- لون الخطر
            Warning = Color3.fromRGB(255, 193, 7),     -- لون التحذير
            Text = Color3.fromRGB(255, 255, 255),      -- لون النص
            TextSecondary = Color3.fromRGB(200, 200, 200) -- لون النص الثانوي
        },
        
        -- الخطوط
        Fonts = {
            Primary = Enum.Font.GothamBold,
            Secondary = Enum.Font.Gotham,
            Monospace = Enum.Font.Code
        },
        
        -- الأحجام
        Sizes = {
            WindowWidth = 400,
            WindowHeight = 500,
            ButtonHeight = 35,
            SliderHeight = 50,
            SectionHeight = 30
        },
        
        -- التأثيرات
        Effects = {
            AnimationSpeed = 0.3,
            HoverEffect = true,
            ShadowEffect = true,
            GlowEffect = false
        }
    },
    
    -- إعدادات Aimbot المتقدمة
    Aimbot = {
        -- الأهداف المفضلة
        TargetPriority = {
            "Head",      -- الرأس (أولوية عالية)
            "UpperTorso", -- الصدر العلوي
            "LowerTorso", -- الصدر السفلي
            "HumanoidRootPart" -- الجذع (أولوية منخفضة)
        },
        
        -- إعدادات التنبؤ
        Prediction = {
            Enabled = true,
            Factor = 0.165,  -- عامل التنبؤ
            Method = "Linear" -- Linear, Quadratic, Cubic
        },
        
        -- إعدادات الفلترة
        Filtering = {
            IgnoreTeammates = true,
            IgnoreInvisible = true,
            IgnoreDead = true,
            MinimumHealth = 1
        },
        
        -- إعدادات متقدمة
        Advanced = {
            TriggerBot = false,
            AutoShoot = false,
            SilentAimChance = 100, -- نسبة نجاح Silent Aim
            RageMode = false -- وضع الغضب (خطير!)
        }
    },
    
    -- إعدادات ESP المتقدمة
    ESP = {
        -- الألوان
        Colors = {
            Enemy = Color3.fromRGB(255, 0, 0),      -- الأعداء
            Teammate = Color3.fromRGB(0, 255, 0),   -- الفريق
            Neutral = Color3.fromRGB(255, 255, 0),  -- محايد
            Skeleton = Color3.fromRGB(255, 255, 255) -- الهيكل العظمي
        },
        
        -- إعدادات الصناديق
        Boxes = {
            Thickness = 2,
            Filled = false,
            Rounded = false,
            HealthBar = true
        },
        
        -- إعدادات النصوص
        Text = {
            ShowName = true,
            ShowDistance = true,
            ShowHealth = true,
            ShowWeapon = false,
            FontSize = 14
        },
        
        -- إعدادات الهيكل العظمي
        Skeleton = {
            Thickness = 2,
            Transparency = 0,
            AnimatedColors = false
        },
        
        -- إعدادات الفلترة
        Filtering = {
            MaxDistance = 1000,
            ShowTeammates = false,
            ShowDead = false,
            ShowInvisible = false
        }
    },
    
    -- إعدادات الحركة المتقدمة
    Movement = {
        -- إعدادات السرعة
        Speed = {
            DefaultValue = 16,
            MaxValue = 200,
            MinValue = 1,
            Increment = 1,
            SmoothTransition = true
        },
        
        -- إعدادات القفز
        Jump = {
            DefaultValue = 50,
            MaxValue = 200,
            MinValue = 10,
            Increment = 5,
            InfiniteJump = false
        },
        
        -- إعدادات الطيران
        Fly = {
            DefaultSpeed = 50,
            MaxSpeed = 100,
            MinSpeed = 10,
            Acceleration = true,
            NoClip = false,
            VerticalSpeed = 1.0
        },
        
        -- إعدادات التليبورت
        Teleport = {
            SafetyCheck = true,
            HeightOffset = 5,
            MaxDistance = 1000,
            CooldownTime = 0.5,
            EffectEnabled = true
        }
    },
    
    -- إعدادات الأمان
    Security = {
        -- الحماية من الكشف
        AntiDetection = {
            Enabled = true,
            RandomizeValues = true,
            HumanLikeMovement = true,
            DelayBetweenActions = 0.1
        },
        
        -- حدود الاستخدام
        Limits = {
            MaxAimbotFOV = 200,
            MaxSpeed = 200,
            MaxJumpPower = 200,
            MaxFlySpeed = 100
        },
        
        -- التحذيرات
        Warnings = {
            ShowSpeedWarning = true,
            ShowAimbotWarning = true,
            ShowTeleportWarning = true,
            WarningThreshold = 100
        }
    },
    
    -- إعدادات الهاتف المحمول
    Mobile = {
        -- أزرار التحكم
        Controls = {
            Size = 45,
            Spacing = 5,
            Position = {X = 10, Y = -150},
            Transparency = 0.2
        },
        
        -- الاستجابة للمس
        Touch = {
            HapticFeedback = true,
            DoubleTapSpeed = 0.3,
            LongPressTime = 1.0
        },
        
        -- تحسينات الأداء
        Performance = {
            ReducedEffects = true,
            LowerUpdateRate = true,
            SimplifiedUI = false
        }
    },
    
    -- إعدادات الأداء
    Performance = {
        -- معدل التحديث
        UpdateRates = {
            Aimbot = 60,    -- FPS
            ESP = 30,       -- FPS
            Movement = 60,  -- FPS
            UI = 30         -- FPS
        },
        
        -- تحسينات الذاكرة
        Memory = {
            CleanupInterval = 30, -- ثانية
            MaxESPObjects = 50,
            CacheSize = 100
        },
        
        -- إعدادات الرسم
        Rendering = {
            UseHardwareAcceleration = true,
            AntiAliasing = true,
            VSync = false
        }
    },
    
    -- إعدادات التسجيل
    Logging = {
        Enabled = true,
        Level = "INFO", -- DEBUG, INFO, WARN, ERROR
        SaveToFile = false,
        MaxLogSize = 1000 -- عدد الرسائل
    },
    
    -- اختصارات لوحة المفاتيح
    Keybinds = {
        ToggleUI = Enum.KeyCode.Insert,
        ToggleAimbot = Enum.KeyCode.F1,
        ToggleESP = Enum.KeyCode.F2,
        ToggleSpeed = Enum.KeyCode.F3,
        ToggleFly = Enum.KeyCode.F4,
        ToggleTeleport = Enum.KeyCode.F5,
        PanicKey = Enum.KeyCode.Delete -- إيقاف كل شيء
    }
}

return AdvancedConfig
