package kr.ac.duce.service;

import kr.ac.duce.model.MemberModel;

import java.nio.file.attribute.UserPrincipalNotFoundException;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface LoginService extends UserDetailsService {
    @Override
    public MemberModel loadUserByUsername(String id) throws UsernameNotFoundException;

    public void passowrdInsert(MemberModel membermodel);
    
    public MemberModel findId(String name, String hp)throws UserPrincipalNotFoundException;
}