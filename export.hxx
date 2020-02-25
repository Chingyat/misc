#pragma once

#include <hello/config.hxx>

#if defined(HELLO_STATIC_LIBRARY)
#   define HELLO_EXPORT
#elif defined(HELLO_DYNAMIC_LIBRARY)
#   if defined(HELLO_BUILD)
#       ifdef _WIN32
#           define HELLO_EXPORT __declspec(dllexport)
#       else
#           define HELLO_EXPORT __attribute__((visibility("default")))
#       endif
#   else
#       ifdef _WIN32
#           define HELLO_EXPORT __declspec(dllimport)
#       else
#           define HELLO_EXPORT
#       endif
#   endif
#else
#   define HELLO_EXPORT
#endif
