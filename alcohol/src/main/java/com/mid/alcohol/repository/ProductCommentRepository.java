package com.mid.alcohol.repository;

import java.util.List;

import com.mid.alcohol.domain.shop.ProductComment;

public interface ProductCommentRepository {

	List<ProductComment> selectBypId(long pId);
	int insert(ProductComment productComment);
	ProductComment selectByCommentId(long commentId);
	int update(ProductComment productComment);
	int delete(long commentId);

	

}
