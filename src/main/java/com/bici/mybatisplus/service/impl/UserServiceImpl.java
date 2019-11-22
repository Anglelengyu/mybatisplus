package com.bici.mybatisplus.service.impl;

import com.bici.mybatisplus.entity.UserEntity;
import com.bici.mybatisplus.mapper.UserMapper;
import com.bici.mybatisplus.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lengyu
 * @since 2019-11-22
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserEntity> implements IUserService {

}
