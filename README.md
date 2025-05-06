

📌 Mihomo/Clash 规则整理

<p align="center">
  <img src="https://img.shields.io/github/repo-size/Eggku/rules?style=flat-square" alt="Repo Size">
  <img src="https://img.shields.io/github/stars/Eggku/rules?style=flat-square" alt="Stars">
  <img src="https://img.shields.io/github/forks/Eggku/rules?style=flat-square" alt="Forks">
  <img src="https://img.shields.io/github/license/Eggku/rules?style=flat-square" alt="License">
</p>


💦 Mihomo/Clash 征集日常使用未被cn_domain（国内）或 geolocation-!cn（国外）收录的规则集，帮助您更精准地管理代理/直连设置。
<br>
<br>
 📢 征集收录域名 & IP 规则  

欢迎参与 Mihomo/Clash规则集优化！🎯请按照【👽Domain规则示】例和【💻IPcidr规则示】例提交您的推荐域名&IP至Telegram机器人📩

🔹 域名&IP规则格式要求：
```yaml
- +.baidu.com     direct  # 域名直连
- +.google.com    proxy   # 域名代理
- 123.45.67.0/24  direct  # IP  直连
- 123.45.67.0/24  proxy   # IP  代理
```

🛠 提交方式：
<br><br>
📢 Telegram 机器人: @YourProjectBot (https://t.me/YourProjectBot)  
<br>
📌 感谢您的贡献！您的提交将帮助优化规则，提升使用体验 🚀 
<br>
<br>
<br>
<br>
💢 核心规则文件作用：
```yaml
📛 domain-direct.mrs    国内域名直连               # 匹配所有子域名（包括主域名）的通配写法，包含日常生活使用的域名。

📛 domain-proxy.mrs     国外域名代理               # 匹配所有子域名（包括主域名）的通配写法，包含emby和其它影视域名。

📛 ip-direct.mrs        国内 IP 直连               # 匹配整个子网IP的通配写法，包含日常生活使用的IP。

📛 ip-proxy.mrs         国外 IP 代理               # 匹配整个子网IP的通配写法，包含emby和其它影视域名。
```

👽 Domain 规则示例
```yaml
payload:
  - "example.com"          # 普通域名
  - "+.google.com"         # 通配域名
  - "facebook.com"         # 根域名
  - "+.fbcdn.net"          # 多子域名通配
  - "api.openai.com"       # 指定子域名
```

💻 IPcidr 规则示例
```yaml
payload:
  - 8.8.8.8/32          # 单个 IP
  - 1.1.1.0/24          # 整个子网
  - 192.168.0.0/16      # 本地内网
  - 10.0.0.1/32         # 内网设备
  - 123.45.67.0/24      # 某地区出口 IP
```
🚀 Mihomo 域名&IP常规配置
  ```yaml
  rule-providers: 
    domain-direct:
      type: http
      behavior: domain
      format: mrs
      path: ./rules/domain-direct.mrs
      url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-direct.mrs"
      interval: 86400

    domain-proxy:
      type: http
      behavior: domain
      format: mrs
      path: ./rules/domain-proxy.mrs"
      url: "https://raw.githubusercontent.com/Eggku/rules/main/domain-proxy.mrs"
      interval: 86400

    ip-direct:
      type: http
      behavior: ipcidr
      format: mrs
      path: ./rules/ip-direct.mrs"
      url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-direct.mrs"
      interval: 86400

    ip-proxy:
      type: http
      behavior: ipcidr
      format: mrs
      path: ./rules/ip-proxy.mrs"
      url: "https://raw.githubusercontent.com/Eggku/rules/main/ip-proxy.mrs"
      interval: 86400
```
🚀 Mihomo 域名&IP锚点配置
```yaml
rule-providers: 
  domain-direct: {<<: *DomainMrs, url:"https://raw.githubusercontent.com/Eggku/rules/main/domain-direct.mrs"}
  domain-proxy:  {<<: *DomainMrs, url:"https://raw.githubusercontent.com/Eggku/rules/main/domain-proxy.mrs"}
  ip-direct:     {<<: *ipcidrMrs, url:"https://raw.githubusercontent.com/Eggku/rules/main/ip-direct.mrs"}
  ip-proxy:      {<<: *ipcidrMrs, url:"https://raw.githubusercontent.com/Eggku/rules/main/ip-proxy.mrs"}
```
⚙ 规则应用
```yaml
rules:
  - RULE-SET,domain-direct,全球直连
  - RULE-SET,domain-proxy,香港节点
  - RULE-SET,ip-direct,全球直连,no-resolve
  - RULE-SET,ip-proxy,香港节点,no-resolve
```

📞 联系我们

📧 Email: example@example.com  
🌐 项目主页: your-project.com (https://your-project.com/)  
💬 社区 & 交流群

📢 Telegram 频道: @YourProjectChannel (https://t.me/YourProjectChannel)  
👥 Telegram 交流群: @YourProjectGroup (https://t.me/YourProjectGroup)  

📌 欢迎加入我们的社区，与更多用户交流、获取最新更新！ 🚀
