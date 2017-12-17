valgrind --tool=memcheck ./a.out 
# refer http://www.oschina.net/translate/valgrind-memcheck
# Valgrind 包括如下一些工具：
# Memcheck。这是 valgrind 应用最广泛的工具，一个重量级的内存检查器，能够发现开发中绝大多数内存错误使用情况，比如：使用未初始化的内存，使用已经释放了的内存，内存访问越界等。
# Callgrind。它主要用来检查程序中函数调用过程中出现的问题。
# Cachegrind。它主要用来检查程序中缓存使用出现的问题。
# Helgrind。它主要用来检查多线程程序中出现的竞争问题。
# Massif。它主要用来检查程序中堆栈使用中出现的问题。
# Extension。可以利用core提供的功能，自己编写特定的内存调试工具。
