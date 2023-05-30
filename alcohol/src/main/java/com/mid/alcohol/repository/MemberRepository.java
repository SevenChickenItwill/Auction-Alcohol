package com.mid.alcohol.repository;

import com.mid.alcohol.domain.Member;

public interface MemberRepository {
   int registerMember(Member member);
   Member findByMemberId(String memberId);
}
