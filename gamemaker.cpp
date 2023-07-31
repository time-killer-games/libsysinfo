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

EXPORTED_FUNCTION const char *os_kernel_name() {
  static std::string res;
  res = ngs::sys::os_kernel_name();
  return res.c_str();
}

EXPORTED_FUNCTION const char *os_device_name() {
  static std::string res;
  res = ngs::sys::os_device_name();
  return res.c_str();
}

EXPORTED_FUNCTION const char *os_kernel_release() {
  static std::string res;
  res = ngs::sys::os_kernel_release();
  return res.c_str();
}

EXPORTED_FUNCTION const char *os_product_name() {
  static std::string res;
  res = ngs::sys::os_product_name();
  return res.c_str();
}

EXPORTED_FUNCTION const char *os_kernel_version() {
  static std::string res;
  res = ngs::sys::os_kernel_version();
  return res.c_str();
}

EXPORTED_FUNCTION const char *os_architecture() {
  static std::string res;
  res = ngs::sys::os_architecture();
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_totalram(double hr) {
  static std::string res;
  res = ngs::sys::memory_totalram((bool)hr);
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_freeram(double hr) {
  static std::string res;
  res = ngs::sys::memory_freeram((bool)hr); 
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_usedram(double hr) {
  static std::string res;
  res = ngs::sys::memory_usedram((bool)hr);
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_totalswap(double hr) {
  static std::string res;
  res = ngs::sys::memory_totalswap((bool)hr);
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_freeswap(double hr) {
  static std::string res;
  res = ngs::sys::memory_freeswap((bool)hr);
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_usedswap(double hr) {
  static std::string res;
  res = ngs::sys::memory_usedswap((bool)hr);
  return res.c_str();
}

EXPORTED_FUNCTION const char *memory_totalvram(double hr) {
  static std::string res;
  res = ngs::sys::memory_totalvram((bool)hr);
  return res.c_str();
}
  
EXPORTED_FUNCTION const char *gpu_manufacturer() {
  static std::string res;
  res = ngs::sys::gpu_manufacturer();
  return res.c_str();
}

EXPORTED_FUNCTION const char *gpu_renderer() {
  static std::string res;
  res = ngs::sys::gpu_renderer();
  return res.c_str();
}

EXPORTED_FUNCTION const char *cpu_vendor() {
  static std::string res;
  res = ngs::sys::cpu_vendor();
  return res.c_str();
}

EXPORTED_FUNCTION const char *cpu_processor() {
  static std::string res;
  res = ngs::sys::cpu_processor();
  return res.c_str();
}

EXPORTED_FUNCTION const char *cpu_processor_count() {
  static std::string res;
  res = ngs::sys::cpu_processor_count();
  return res.c_str();
}

EXPORTED_FUNCTION const char *cpu_core_count() {
  static std::string res;
  res = ngs::sys::cpu_core_count();
  return res.c_str();
}

