## My ARCH LINUX Config File () .  


Hi, welcome! This is my whole **Arch Linux** () config file.  
**Computer** is one of my interests, ever since first met it in middle school.  
**Linux** & **Vim** was my love at first sight, when I had worked for 5 years.  
I started to "lego"(assemble) **Arch Linux** after I saw the **theCW**'s video.  

嗨，欢迎！这是我整个 Arch Linux（）配置文件。  
Computer 是我的兴趣之一，从我在中学第一次见到它开始。  
Linux 和 Vim 是我的一见钟情，在我工作 5 年时。  
我开始乐高（组装）Arch Linux，在我看到 **theCW** 的视频后。  

-- lemur  
![screenshot](00/01_lemurs.png)  

-- fish  
![screenshot](00/02_fish.png)  

-- yazi  
![screenshot](00/03_yazi.png)  

-- nvim  
![screenshot](00/04_nvim.png)  

----  

#### System Software Tree （系统软件树）  
```  
                |  
        basic --|    yazi  fish nvim mpv     --|  
  application   |        \  |  /    /          |  
                |         \ | /    /           |  
     terminal --|          tmux---/          --|  
  multiplexer   |           |                  |  
                |           |                  |  
       shell -- |          bash------\       --|  
                |           |  \      \        |  
                |           |   \      \       |  pt  
    terminal -- |    alacritty  fbterm  |    ---> ( pseudo terminal )  
    emulator    |      /    |     |     |  
                |     |     |     |     |  
     session -- |    i3   sway    |     |    --|  
     manager    |     |     |     |     |      |  
                |     |     |     |    /       |  
     display -- |  xorg  wayland  fb  /      --|  
    protocol    |      \    |    /   /         |  
                |       \   |   /   /          |  tty  
       login -- |        lemurs  getty+login ---> ( virtual terminal )  
     systemd    |           |     /  
                |           |    /                console  
      system -- |        linux+systemctl     ---> (  )  
                |           |  
                |          /|\  
-------------------------------------------------------  
  MY ARCH LINUX (  )    / | | | \  
```  

#### Graphical Interface （图形界面）  
```  
  sway + swayidle + swaylock + swaybg + swaybar + firefox  
-------------------------------------------------------  
  wayland  
```  

#### Hardware Base （硬件基础）  
```  
cpu : AMD Ryzen | Radeon Graphic  
mem : ddr5  
hdd : nvme | Linux RAID  
```  

----  

#### Application Selection （应用选择）  

It's really not easy to come this far, but make life more meaningful.  
I still can not figure it out, what a name for my Arch Linux.  

一路走来实属不容易，但使得生命更有意义。  
我还没想好为我的 Arch Linux 取个什么是名字。  

```  
system            : Arch Linux    <- Window  
login systemd     : lemurs        <- lightdm  
display protocol  : wayland       <- xorg  
session manager   : sway          <- i3  
terminal emulator : alacritty+tmux  
shell             : fish+bash+dash  
explorer          : yazi          <- joshuto <- ranger  
editor            : nvim          <- vim  
player            : mpv  
browser           : firefox  
```  

____  

#### About Config Files （关于配置文件）  

- some system config files may not be directly usable,  
  because they base on hardware.  
- application config files are generally directly usable,  
  but the structure of the config files maybe diff from that of most.  
- most of app plugin need to be download.  

- 一些系统配置文件可能无法直接使用，因为它们基于硬件。  
- 应用程序配置文件通常可以直接使用，但配置文件的结构可能与大多数不同。  
- 大多数应用程序插件需要下载。  

----  


