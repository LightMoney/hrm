# hrm
hrm_common    公共的工具类  返回响应类   普通maven项目
hrm_common_model   各个模块的实体lei     普通maven项目
hrm_company        企业模块          springboot
hrm_system       系统模块            springboot
ihrm_employee    员工模块            springboot    有员工百万导入导出功能


sql 是从mysql  8.0版本上导出的 加载到低版本需要修改

realm 写了两个  公共负责授权
用户的负责认证   若两个写在同一个中  其他微服务，认证读取的用户信息无法获取

redis 来存用户信息
sessionId

登录后会在redis存默认名字shiro:session:sessionId值为用户安全信息的数据，最后返回会返回sessionId
访问其他接口时 将Authorization  Bearer sessionId 带上头中就可以访问
关键点shiro配置   自定义的sessionManager    redis配置

通过realm中的认证判断用户账号密码正确 存入安全信息
当接口被注解有需要权限或角色判断时  才去调用 realm中的授权拿到用户的角色 权限信息进行比对
（如果需要api权限 需要全部录入信息）

这里每一个服务都拦截了，实际可以将拦截放到网关来做(拦截在网管 是否能过对api进行鉴权?)
