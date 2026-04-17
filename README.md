# packages

## 这里的包分两个版本，也有插件改了位置适配老版主题
## 一个json新版的插件openwrt-23.05
## 一个lua老版的插件lede-18.06
## openwrt-25.12未测试
### 你用什么源码就git啥，有个别插件做了修复，有插件是反向解的都能用不能用的话issues！
###  仓库主要是lede源码在做修改！！！

### 在源码根目录下载到package中

        git clone https://github.com/Kevin-R1/Plugin.git package/Plugin
        
### 把它放到feeds.conf.default文件
### 记得删除这些
         rm -rf feeds/packages/net/mosdns
         rm -rf feeds/packages/net/msd_lite
         rm -rf feeds/luci/themes/luci-theme-argon
         rm -rf feeds/luci/applications/luci-app-mosdns
         rm -rf feeds/luci/applications/luci-app-msd_lite
         rm -rf feeds/luci/applications/luci-app-ttyd
         
### rm 是删除openwrt-23源码的18.06不用

       src-git Plugin https://github.com/Kevin-R1/Plugin.git
       #src-git Plugin https://github.com/Kevin-R1/Plugin.git;lede-18.06
       
       
       ./scripts/feeds update -a
       ./scripts/feeds install -a -f
       
       make menuconfig
       make V=s -j$(nproc)
       


### 单独编译该包（用来提前测试用是不是你需要的）
### 记住你用啥源码就用哪个包比如老版本就第二个，新版就第一个!!!

       make package/feeds/Plugin/luci-app-mosdns/compile V=s
