package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.DealReply;

public interface CommentRepository {
    
    int insert(DealReply dealReply);
    List<DealReply> selectByDealId(long dealId);
    int update(DealReply entity);
    int delete(long id);
    
    // 포스트 댓글 개수 세기
    long selectCommentCountWithDealId(long dealId);
}