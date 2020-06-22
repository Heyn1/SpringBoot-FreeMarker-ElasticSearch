package com.example.enums;

import lombok.Getter;

@Getter
public enum RoleEnum {
    /**
     * 用户身份枚举
     */
    ADMIN(0),

    CUSTOMER(1),

    ;

    Integer code;

    RoleEnum(Integer code) {
        this.code = code;
    }
}
