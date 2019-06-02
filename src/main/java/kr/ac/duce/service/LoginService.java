package kr.ac.duce.service;

import kr.ac.duce.model.MemberModel;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface LoginService extends UserDetailsService {
    @Override
    public MemberModel loadUserByUsername(String id) throws UsernameNotFoundException;
}
