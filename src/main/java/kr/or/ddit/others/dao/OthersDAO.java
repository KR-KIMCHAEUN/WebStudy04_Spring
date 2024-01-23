package kr.or.ddit.others.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 동적 UI 생성에 필요한 데이터 조회 Persistence layer
 *
 */
@Mapper
public interface OthersDAO {
	/**
	 * selectLprodList : 상품분류코드를 담아오는 메소드
	 */
	public List<Map<String, Object>>selectLprodList();
	/**
	 * selectBuyerList : 상품제조사를 담아오는 메소드 
	 */
	public List<Map<String, Object>>selectBuyerList();

}
