这里采用swagger2.0版本  3.0以上需2.2.0的springboot版本   http://localhost:8088/swagger-ui.html

全局的跨域请求

公共的拦截器 拦截解析token  还需要在项目中配置  实现WebMvcConfigurationSupport的配置类中配置  config目录下

BaseExceptionHandler  自定义异常拦截处理器   转换为对应的result返回给前端


shrio  改造版本
公共的realm 获取权限数据