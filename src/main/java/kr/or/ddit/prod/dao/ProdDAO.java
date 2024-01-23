package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.common.paging.PaginationInfo;
import kr.or.ddit.vo.ProdVO;

/**
 * 상품관리(CRUD) Persistence Layer
 *
 */
@Mapper
public interface ProdDAO {
	/**
	 * 신규상품등록 
	 * @param prod
	 * @return 
	 */
	public int insertProd(ProdVO prod);
	
	/**
	 * totalRecord/totalPage 를 결정하기 위한 쿼리
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
	
	/**
	 * 페이징 처리 결과 데이터 목록 조회 
	 * @param paging
	 * @return
	 */
	public List<ProdVO>selectProdList(PaginationInfo paging);
	
	/**
	 * @param prodId
	 * @return
	 */
	public ProdVO selectProd(String prodId);
	public int updateProd(ProdVO prod);
}
