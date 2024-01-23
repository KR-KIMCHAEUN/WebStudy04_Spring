package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.common.paging.PaginationInfo;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.ProdVO;

/**
 * 상품관리(CRUD) Business Logic Layer
 *
 */
public interface ProdService {
	/**
	 * 신규상품등록
	 * @param prod
	 * @return OK, FAIL
	 */
	public ServiceResult createProd(ProdVO prod);
	public List<ProdVO> retrieveProdList(PaginationInfo paging);
	/**
	 * 상품 상세 조회 
	 * @param prodId
	 * @return 없으면, {@link PKNotFoundException}
	 */
	public ProdVO retrieveProd(String prodId);
	public ServiceResult modifyProd(ProdVO prod);
}
