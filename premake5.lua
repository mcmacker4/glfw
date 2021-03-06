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
        defines {
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}
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
        buildoptions { "-fPIC" }
        files {
            "src/glx_context.c",
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/linux_joystick.c",
            "src/posix_thread.c",
            "src/posix_time.c"
        }
        links {
            "X11",
            "m",
            "rt"
        }

