package com.bici.mybatisplus.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.context.annotation.Bean;

import java.io.Serializable;

@Data
public class ApiResp implements Serializable {
    @ApiModelProperty("响应码")
    private Integer code;
    @ApiModelProperty("响应消息")
    private String msg;
    @ApiModelProperty("响应数据data")
    private Object data;

    public ApiResp(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static ApiResp success(Object data) {
        return new ApiResp(200, "success", data);
    }

    public static ApiResp success() {
        return success(null);
    }

    public static ApiResp successBean2Data(Bean bean) {
        return success(bean);
    }

    public static ApiResp fail(Integer code, String msg, Object data) {
        return new ApiResp(code, msg, data);
    }

//    public static ApiResp fail(ResultEnum resultEnum) {
//        return fail(resultEnum.code, resultEnum.msg);
//    }
//
//    public static ApiResp fail(ResultEnum resultEnum, Object data) {
//        return fail(resultEnum.code, resultEnum.msg, data);
//    }
//
//    public static ApiResp fail(SaasBaseException e) {
//        return fail(e.getCode(), e.getMsg());
//    }

    public static ApiResp fail(Integer code, String msg) {
        return fail(code, msg, null);
    }

    @Data
    public static class Bean {
        private Object result;

        public Bean(Object result) {
            this.result = result;
        }

        public static ApiResp toDTO(Object result) {
            return ApiResp.successBean2Data(new Bean(result));
        }
    }
}
