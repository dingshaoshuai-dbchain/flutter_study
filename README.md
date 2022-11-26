# 有料

一个学习、练习 Flutter 的项目。

## Json 解析

添加依赖：
dev_dependencies:
    json_model: ^1.0.0
    json_serializable: ^5.0.0

1.在根目录下创建 jsons/ 文件夹 
2.新建 person.json 
3.运行命令：flutter flutter packages pub run json_model
4.lib/models 生成了文件

```
{
  // 可以定制单个 json 的生成规则，默认使用全局配置。
  "@meta": {
    // 导入其他文件
    "import": [
      "bean/bean1.dart",
      "bean/bean2.dart",
    ],
    // 为字段添加注释
    "comments": { 
        "nickname":"昵称",
        "age":"年龄",
        "father":"父亲",
        "mother":"母亲",
        "hobby":"爱好，有可能没有爱好，所以声明为可空类型"
    },
    // 字段默认非可空，会生成 late
    "nullable": false,
    // 是否跳过当前 JSON 的 model 类生成
    "ignore": false
  },
  "nickname": "张三",
  "age": 18,
  "father": "$person",
  "mother": "$person",
  "hobby?": "$[]String"
}
```

```json
{
  "@meta": {
    "comments": {
    },
    "nullable": false,
    "ignore": false
  },
  "nickname": "张三",
  "age": 18,
  "father": "$person",
  "mother": "$person",
  "hobby?": "$[]String"
}
```
