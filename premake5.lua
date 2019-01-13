buildDir = "%{wks.location}/Build/%{cfg.system}-%{cfg.buildcfg}/%{prj.name}/"

project "glfw"

    kind "StaticLib"
    
    language "C"
    architecture "x86_64"

    targetdir(buildDir)
    objdir(buildDir .. ".obj")

    files {
        "src/context.c",
        "src/egl_context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c",
        "src/osmesa_context.c"
    }

    includedirs {
        "./include/"
    }

    filter "configurations:Debug"
        symbols "On"

    filter "configurations:Release"
        optimize "On"

    
    filter "system:windows"
        staticruntime "On"
        defines { "_GLFW_WIN32" }
        systemversion "latest"
        files {
            "src/wgl_context.c",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_thread.c",
            "src/win32_time.c",
            "src/win32_window.c"
        }
        links {
            "gdi32"
        }
    
    filter "system:linux"
        defines { "_GLFW_X11" }
        files {
            "src/glx_context.c",
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/linux_joystick.c"
        }

