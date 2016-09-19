# Memcache

---

* ### liunx安装 <br>

 1. 安装libevent <br>

   (Memcache用到了libevent这个库用于Socket的处理，所以还需要安装libevent) <br>
   $ wget http://www.monkey.org/~provos/libevent-2.0.8-rc.tar.gz <br>
   $ tar zxvf libevent-2.0.8-rc.tar.gz <br>
   $ ./configure -prefix=/usr/local <br>
   $ make <br>
   $ make install <br>


 2. 安装memcached (多线程支持) <br>

   $ wget http://memcached.googlecode.com/files/memcached-1.4.5.tar.gz <br>
   $ tar zxvf memcached-1.4.5.tar.gz <br>
   $ ./configure -with-libevent=/usr/local --enable-threads <br>
   $ make <br>
   $ make install <br>


 3. memcached命令参数详解<br>

   -p <num>      监听的TCP端口(默认: 11211)<br>
   -U <num>      监听的UDP端口(默认: 11211, 0表示不监听)<br>
   -s <file>     用于监听的UNIX套接字路径（禁用网络支持）<br>
   -a <mask>     UNIX套接字访问掩码，八进制数字（默认：0700）<br>
   -l <ip_addr>  监听的IP地址。（默认：INADDR_ANY，所有地址）<br>
   -d            作为守护进程来运行。<br>
   -r            最大核心文件限制。<br>
   -u <username> 设定进程所属用户。（只有root用户可以使用这个参数）<br>
   -m <num>      所有slab class可用内存的上限，以MB为单位。（默认：64MB）<br>
                 （译者注：也就是分配给该memcached实例的内存大小。）<br>
   -M            内存用光时报错。（不会删除数据）<br>
   -c <num>      最大并发连接数。（默认：1024）<br>
   -k            锁定所有内存页。注意你可以锁定的内存上限。<br>
                 试图分配更多内存会失败的，所以留意启动守护进程时所用的用户可分配的内存上限。<br>
                 （不是前面的 -u <username> 参数；在sh下，使用命令"ulimit -S -l NUM_KB"来设置。）<br>
   -v            提示信息（在事件循环中打印错误/警告信息。）<br>
   -vv           详细信息（还打印客户端命令/响应）<br>
   -vvv          超详细信息（还打印内部状态的变化）<br>
   -h            打印这个帮助信息并退出。<br>
   -i            打印memcached和libevent的许可。<br>
   -P <file>     保存进程ID到指定文件，只有在使用 -d 选项的时候才有意义。<br>
   -f <factor>   不同slab class里面的chunk大小的增长倍率。（默认：1.25）<br>
                 （译者注：每个slab class里面有相同数量个slab page，每个slab page里面有chunk，且在当前slab class内的chunk大小固定。<br>
                 而不同slab class里的chunk大小不一致，具体差异就是根据这个参数的倍率在增长，直到分配的内存用尽。）<br>
   -n <bytes>    chunk的最小空间（默认：48）<br>
                 (译者注：chunk数据结构本身需要消耗48个字节，所以一个chunk实际消耗的内存是n+48。) <br>
   -L            尝试使用大内存页（如果可用的话）。提高内存页尺寸可以减少"页表缓冲（TLB）"丢失次数，提高运行效率。<br>
                 为了从操作系统获得大内存页，memcached会把全部数据项分配到一个大区块。<br>
   -D <char>     使用 <char> 作为前缀和ID的分隔符。<br>
                 这个用于按前缀获得状态报告。默认是":"（冒号）。<br>
                 如果指定了这个参数，则状态收集会自动开启；如果没指定，则需要用命令"stats detail on"来开启。<br>
   -t <num>      使用的线程数（默认：4）<br>
   -R            每个连接可处理的最大请求数。<br>
   -C            禁用CAS。<br>
   -b            设置后台日志队列的长度（默认：1024）<br>
   -B            绑定协议 - 可能值：ascii,binary,auto（默认）<br>
   -I            重写每个数据页尺寸。调整数据项最大尺寸。<br>


 4. 管理脚本<br>

   * 启动:
    [*start.sh*](https://github.com/honglongwei/pj-memcache/blob/master/start.sh)
   <br>
   * 停止:
    [*stop.sh*](https://github.com/honglongwei/pj-memcache/blob/master/stop.sh)
