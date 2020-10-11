
## 使用

### 修改配置文件

首先修改 config.yaml 中的必要配置信息，cf开头的选项不需要填写

source.yaml 文件中定义了抓取源，需要定期手动维护更新

### 启动程序

docker pull postgres
docker run -p 5432:5432 --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
go run main.go  -c config/config.yaml


使用 `-c` 参数指定配置文件路径，支持http链接

```shell
pps -c config/config.yaml
```
