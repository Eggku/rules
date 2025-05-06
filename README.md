

📌 项目名称：Mihomo/Clash 整理日常未被【cn_domain】国内【geolocation-!cn】国外收录的规则。




🌟 简介：
 🔥 domain-direct.mrs 国内域名直连规则
 🎨 domain-proxy.mrs 国外域名代理规则
 🚀 ip-direct.mrs 国内IP直连规则
 ⚡ ip-proxy.mrs 国内IP代理规则

📦 Domain 示例：
payload:
  - "example.com"          # 普通域名
  - "+.google.com"         # 通配域名
  - "facebook.com"         # 根域名
  - "+.fbcdn.net"          # 多子域名通配
  - "api.openai.com"       # 指定子域名

💻 IPcidr 示例：
payload:
8.8.8.8/32          # 单个 IP
1.1.1.0/24          # 整个子网
192.168.0.0/16      # 本地内网
10.0.0.1/32         # 内网设备
123.45.67.0/24      # 某地区出口 IP

🚀 Mihomo 使用方法：
```yaml
  domain-direct:
    type: http
    behavior: domain
    format: mrs
    path: ./rules/domain-dircet.mrs
    url: "https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/domain-dircet.mrs"
    interval: 86400

  domain-proxy:
    type: http
    behavior: domain
    format: mrs
    path: ./rules/domain-proxy.mrs
    url: "https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/domain-proxy.mrs"
    interval: 86400

  ip-direct:
    type: http
    behavior: ipcidr
    format: mrs
    path: ./rules/ip-direct.mrs
    url: "https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/ip-direct.mrs"
    interval: 86400
    
  ip-proxy:
    type: http
    behavior: ipcidr
    format: mrs
    path: ./rules/ip-proxy.mrs
    url: "https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/ip-proxy.mrs"
    interval: 86400
```
    域名锚点配置：
    domain-direct:          {<<: *DomainMrs, url: https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/domain-dircet.mrs}
    domain-proxy:           {<<: *DomainMrs, url: https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/domain-proxy.mrs}
    IP锚点配置：
    ip-dircet:              {<<: *ipcidrMrs, url: https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/ip-dircet.mrs}
    ip-proxy:               {<<: *ipcidrMrs, url: https://raw.githubusercontent.com/Eggku/rules/refs/heads/main/ip-proxy.mrs}

🤝 rules:
```yaml
  - RULE-SET,domain-direct, dircet
  - RULE-SET,domain-proxy, proxy
  - RULE-SET,ip-direct, dircet,no-resolve
  - RULE-SET,ip-proxy, proxy,no-resolve
```

该项目采用 MIT 许可证 - 详细信息请查看 LICENSE 文件。
📞 联系

📧 Email: example@example.com  
🌐 项目主页: your-project.com (https://your-project.com/)
