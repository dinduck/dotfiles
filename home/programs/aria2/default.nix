{ config, lib, pkgs,...}:
with lib;
let
cfg = config.modules.programs.aria2;
HOME = "/home/dingduck";
in
{
  options.modules.programs.aria2 = {
    enable = mkEnableOption "Aria2 Server";
  };
  config = mkIf cfg.enable {
    programs.aria2.enable = true;
      programs.aria2.settings =
    {
      # 下载设置
      # 下载目录
      dir = "${HOME}/Downloads";
      # 磁盘缓存
      disk-cache = "64M";
      # 预分配方式
      file-allocation = "none";
      continue = true; #断点续传
      always-resume = false; #始终尝试
      max-resume-failure-tries = 5;
      input-file = "${HOME}/.aria2/aria2.session"; # 会话保存
      save-session = "${HOME}/.aria2/aria2.session";
      save-session-interval = 1; # 保存会话间隔
      auto-save-interval = 20; # 自动保存
      max-file-not-found = 10; #最大连接次数
      max-tries = 0; #最大尝试
      max-concurrent-downloads = 5;
      max-connection-per-server = "16";
      split = "64";
      min-split-size = "4M";
      allow-piece-length-change = true;
      disable-ipv6 = true; # 禁用ipv6
      http-accept-gzip = true; # gzip 支持
      no-netrc = true;
      auto-file-renaming = true; # 文件自动重命名
      content-disposition-default-utf8 = true; # 使用 UTF-8 处理 Content-Disposition ，默认:false
      # BT
      bt-tracker = "http://1337.abcvg.info:80/announce,http://aboutbeautifulgallopinghorsesinthegreenpasture.online:80/announce,http://bt.okmp3.ru:2710/announce,http://bvarf.tracker.sh:2086/announce,http://ipv6.rer.lol:6969/announce,http://nyaa.tracker.wf:7777/announce,http://open.acgnxtracker.com:80/announce,http://share.camoe.cn:8080/announce,http://t.acg.rip:6699/announce,http://t.nyaatracker.com:80/announce,http://tk.greedland.net:80/announce,http://torrent.hificode.in:6969/announce,http://torrentsmd.com:8080/announce,http://tracker.bt4g.com:2095/announce,http://tracker.electro-torrent.pl:80/announce,http://tracker.files.fm:6969/announce,http://tracker.gbitt.info:80/announce,http://tracker.ipv6tracker.ru:80/announce,http://tracker.renfei.net:8080/announce,http://tracker.skyts.net:6969/announce,http://tracker.tfile.co:80/announce,http://www.all4nothin.net:80/announce,.phphttp://www.wareztorrent.com:80/announce,https://1337.abcvg.info:443/announce,https://opentracker.i2p.rocks:443/announce,https://shahidrazi.online:443/announce,https://tr.burnabyhighstar.com:443/announce,https://tr.qfruiti.com:443/announce,https://tr.qfruiti.in:443/announce,https://tracker.gbitt.info:443/announce,https://tracker.gcrreen.xyz:443/announce,https://tracker.kuroy.me:443/announce,https://tracker.loligirl.cn:443/announce,https://tracker.tamersunion.org:443/announce,https://tracker.yemekyedim.com:443/announce,https://tracker1.520.jp:443/announce,https://trackers.mlsub.net:443/announce,https://www.peckservers.com:9443/announce,udp://api.alarmasqueretaro.com:3074/announce,udp://bt1.archive.org:6969/announce,udp://d40969.acod.regrucolo.ru:6969/announce,udp://ec2-18-191-163-220.us-east-2.compute.amazonaws.com:6969/announce,udp://epider.me:6969/announce,udp://exodus.desync.com:6969/announce,udp://ipv6.fuuuuuck.com:6969/announce,udp://martin-gebhardt.eu:25/announce,udp://moonburrow.club:6969/announce,udp://movies.zsw.ca:6969/announce,udp://ns1.monolithindustries.com:6969/announce,udp://odd-hd.fr:6969/announce,udp://oh.fuuuuuck.com:6969/announce,udp://open.demonii.com:1337/announce,udp://open.stealth.si:80/announce,udp://open.tracker.cl:1337/announce,udp://open.tracker.ink:6969/announce,udp://open.xxtor.com:3074/announce,udp://opentracker.i2p.rocks:6969/announce,udp://opentracker.io:6969/announce,udp://p2p.publictracker.xyz:6969/announce,udp://p4p.arenabg.com:1337/announce,udp://retracker.lanta.me:2710/announce,udp://retracker01-msk-virt.corbina.net:80/announce,udp://tamas3.ynh.fr:6969/announce,udp://thetracker.org:80/announce,udp://tracker.0x7c0.com:6969/announce,udp://tracker.auctor.tv:6969/announce,udp://tracker.bittor.pw:1337/announce,udp://tracker.cubonegro.lol:6969/announce,udp://tracker.cyberia.is:6969/announce,udp://tracker.dler.com:6969/announce,udp://tracker.doko.moe:6969/announce,udp://tracker.edkj.club:6969/announce,udp://tracker.fnix.net:6969/announce,udp://tracker.mirrorbay.org:6969/announce,udp://tracker.moeking.me:6969/announce,udp://tracker.opentrackr.org:1337/announce,udp://tracker.picotorrent.one:6969/announce,udp://tracker.skyts.net:6969/announce,udp://tracker.t-rb.org:6969/announce,udp://tracker.therarbg.com:6969/announce,udp://tracker.tiny-vps.com:6969/announce,udp://tracker.torrent.eu.org:451/announce,udp://tracker.torrust-demo.com:6969/announce,udp://tracker.tryhackx.org:6969/announce,udp://tracker1.myporn.club:9337/announce,udp://tracker2.dler.com:80/announce,udp://ttk2.nbaonlineservice.com:6969/announce,udp://u4.trakx.crim.ist:1337/announce,udp://www.torrent.eu.org:451/announce,udp://y.paranoid.agency:6969/announce,wss://tracker.openwebtorrent.com:443/announce";
      listen-port = "51413";
      dht-listen-port = "51413";
      enable-dht = true;
      enable-dht6 = false;
      dht-file-path = "${HOME}/.aria2/hdt.dat";
      dht-file-path6 = "${HOME}/.aria2/hdt6.dat";
      dht-entry-point = "dht.transmissionbt.com:6881";
      dht-entry-point6 = "dht.transmissionbt.com:6881";
      bt-enable-lpd = true;
      enable-peer-exchange = true;
      bt-max-peers = "128";
      bt-request-peer-speed-limit = "10M";
      max-overall-upload-limit = "2M";
      max-upload-limit = "0";
      seed-ratio = "1.0";
      seed-time = "0";
      bt-hash-check-seed = true;
      bt-seed-unverified = false;
      bt-tracker-connect-timeout = 10;
      bt-tracker-timeout = 10;
      bt-prioritize-piece = "head=32M,tail=32M";
      rpc-save-upload-metadata = true;
      follow-torrent = true;
      pause-metadata = false;
      bt-save-metadata = true;
      bt-load-saved-metadata = true;
      bt-remove-unselected-file = true;
      bt-force-encryption = true;
      bt-detach-seed-only = true;
      # 客户端伪装
      user-agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36";
      peer-agent = "Deluge 1.3.15";
      peer-id-prefix = "-DE13F0-";
      # RPC
      enable-rpc = true;
      rpc-allow-origin-all = true;
      rpc-listen-all = true;
      rpc-listen-port = 6800;
      rpc-secret = "dashabi";
      rpc-max-request-size = "10M";
    };
  };
}