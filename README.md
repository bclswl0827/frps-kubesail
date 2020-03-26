# frps-kubesail

https://kubesail.com/template/bclswl0827/frps/

在模板最后按照格式追加需要开放的端口。

Deployments 页面，应用 Frps 的 Network 选项卡中，80 端口（用于网站）类型选择 HTTPS，7000 端口类型选择 TCP，除此之外的端口一律选择 TCP 类型。

然后在本地用 Frpc 与 Kubesail 分配的 7000 端口对应的 NAT 地址连接。

Token=frp888
