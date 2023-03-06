package com.thisteam.dangdangeat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thisteam.dangdangeat.vo.NoticeVO;
import com.thisteam.dangdangeat.vo.ReviewVO;

public interface BoardMapper {

	List<NoticeVO> getNoticeList(@Param("keyword") String keyword, 
								@Param("pageNum") int pageNum, 
								@Param("startRow") int startRow, 
								@Param("listLimit") int listLimit);

	int getNoticeListCount(@Param("keyword") String keyword);

	int insertNotice(NoticeVO notice);

	NoticeVO getDetailList(@Param("code") int notice_code);

	int modifyNotice(NoticeVO notice);

	int deleteNotice(@Param("code") int notice_code);


	// ======================== jakyoung 시작 ===================================
	
	// 해당 상품 리뷰 목록 가져오기
	List<ReviewVO> selectReviewList(
			@Param("pro_code") int pro_code
			, @Param("keyword") String keyword
			, @Param("startRow") int startRow
			, @Param("listLimit") int listLimit);

	// 해당 상품 리뷰 개수
	int selectReviewListCount(
			@Param("pro_code") int pro_code
			, @Param("keyword") String keyword);
	
	// ======================== jakyoung 끝 ===================================

}













