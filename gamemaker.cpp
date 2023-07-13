/*

 MIT License
 
 Copyright © 2023 Samuel Venable
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

#include "system.hpp"

#ifdef _WIN32
#define EXPORTED_FUNCTION extern "C" __declspec(dllexport)
#else /* macOS, Linux, and BSD */
#define EXPORTED_FUNCTION extern "C" __attribute__((visibility("default")))
#endif

namespace enigma_user {

EXPORTED_FUNCTION const char *human_readable(double nbytes) {
  static std::string res;
  res = ngs::sys::human_readable((double)nbytes);
  return res.c_str();
}

EXPORTED_FUNCTION const char *utsname_sysname() {
  static std::string res;
  res = ngs::sys::utsname_sysname();
  return res.c_str();
}

EXPORTED_FUNCTION const char *utsname_nodename() {
  static std::string res;
  res = ngs::sys::utsname_nodename();
  return res.c_str();
}

EXPORTED_FUNCTION const char *utsname_release() {
  static std::string res;
  res = ngs::sys::utsname_release();
  return res.c_str();
}

EXPORTED_FUNCTION const char *utsname_version() {
  static std::string res;
  res = ngs::sys::utsname_version();
  return res.c_str();
}

EXPORTED_FUNCTION const char *utsname_machine() {
  static std::string res;
  res = ngs::sys::utsname_machine();
  return res.c_str();
}

EXPORTED_FUNCTION const char *utsname_codename() {
  static std::string res;
  res = ngs::sys::utsname_codename();
  return res.c_str();
}

EXPORTED_FUNCTION double memory_totalram() {
  return (double)ngs::sys::memory_totalram(); 
}

EXPORTED_FUNCTION double memory_availram() {
  return (double)ngs::sys::memory_availram(); 
}

EXPORTED_FUNCTION double memory_usedram() {
  return (double)ngs::sys::memory_usedram(); 
}

EXPORTED_FUNCTION double memory_totalvmem() {
  return (double)ngs::sys::memory_totalvmem(); 
}

EXPORTED_FUNCTION double memory_availvmem() {
  return (double)ngs::sys::memory_availvmem(); 
}

EXPORTED_FUNCTION double memory_usedvmem() {
  return (double)ngs::sys::memory_usedvmem(); 
}
  
EXPORTED_FUNCTION const char *gpu_vendor() {
  static std::string res;
  res = ngs::sys::gpu_vendor();
  return res.c_str();
}

EXPORTED_FUNCTION const char *gpu_renderer() {
  static std::string res;
  res = ngs::sys::gpu_renderer();
  return res.c_str();
}

EXPORTED_FUNCTION double gpu_videomemory() {
  return (double)ngs::sys::gpu_videomemory();
}

EXPORTED_FUNCTION const char *cpu_vendor() {
  static std::string res;
  res = ngs::sys::cpu_vendor();
  return res.c_str();
}

EXPORTED_FUNCTION const char *cpu_brand() {
  static std::string res;
  res = ngs::sys::cpu_brand();
  return res.c_str();
}

EXPORTED_FUNCTION double cpu_numcores() {
  return ngs::sys::cpu_numcores();
}

EXPORTED_FUNCTION double cpu_numcpus() {
  return ngs::sys::cpu_numcpus();
}

} // namespace enigma_user
