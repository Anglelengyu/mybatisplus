package ${package.Controller};


import org.springframework.web.bind.annotation.RequestMapping;

<#if restControllerStyle>
    import org.springframework.web.bind.annotation.RestController;
<#else>
    import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
    import ${superControllerClassPackage};
</#if>

/**
* <p>
    * ${table.comment!} 前端控制器
    * </p>
*
* @author kuangsha
* @since ${date}
*/
<#if restControllerStyle>
    @RestController
<#else>
    @Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
    class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
    <#if superControllerClass??>
        public class ${table.controllerName} extends ${superControllerClass} {
    <#else>
        public class ${table.controllerName} {
    </#if>
    @Autowired
    ${table.serviceName}  ${table.name}Service;

    @ApiOperation("列表" )
    @ApiImplicitParam(dataTypeClass = C${table.name}QueryCommand.class)
    @PostMapping("/list" )
    public ApiResp list(@RequestBody ${table.name}QueryCommand command) {
    return ApiResp.success(${table.name}Service.list(command));
    }

    @ApiOperation(value = "新建", httpMethod = "POST")
    @ApiImplicitParam(dataTypeClass = ${table.name}Command.class)
    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public ApiResp insert(@RequestBody ${table.name}Command command) {
    ${table.name}Service.insert(command);
    return ApiResp.success();
    }

    @ApiOperation(value = "修改", httpMethod = "POST")
    @ApiImplicitParam(dataTypeClass = ${table.name}Command.class)
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ApiResp update(@RequestBody ChargerSheetCommand command) {
    ${table.name}Service.update(command);
    return ApiResp.success();
    }

    @ApiOperation(value = "删除", httpMethod = "GET")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ApiResp delete(@RequestParam("id") Long id) {
    ${table.name}Service.delete(id);
    return ApiResp.success();
    }

    @ApiOperation(value = "详情", httpMethod = "GET")
    @ApiImplicitParam(dname = "id", value = "id", required = true, paramType = "Long")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ApiResp detail(@RequestParam("id") Long id) {
    return ApiResp.success( ${table.name}Service.detail(id));
    }

    }
</#if>


