package com.mid.alcohol.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mid.alcohol.domain.Member;
import com.mid.alcohol.repository.MemberRepository;

@Repository
public class MemberService {
    private final MemberRepository memberRepository;

    @Autowired       
    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public void registerUser(Member member) {
        // 아이디 중복 체크
        Member existingUser = memberRepository.findByMemberId(member.getMemberId());
        if (existingUser != null) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        // 비밀번호 확인
        if (!member.getMemberPassword().equals(member.getMemberPasswordSame())) {
            throw new IllegalArgumentException("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        }

        // 회원가입 처리
        memberRepository.registerMember(member);
    }

    
}
