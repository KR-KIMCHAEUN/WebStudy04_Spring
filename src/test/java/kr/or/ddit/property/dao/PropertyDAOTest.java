package kr.or.ddit.property.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import kr.or.ddit.vo.PropertyVO;

class PropertyDAOTest {
	
	PropertyDAO dao;

	@Test
	void testInsertProperty() {
		PropertyVO newProp = new PropertyVO();
		
		newProp.setPropertyName("dummyProperty");
		newProp.setPropertyValue("dummyValue");
		newProp.setDescription("dummyDescription");
		
		int rowcnt = dao.insertProperty(newProp);
		assertEquals(1, rowcnt);
	}

	@Test
	void testSelectProperties() {
		List<PropertyVO> propList = dao.selectProperties();
//		assertion
		assert propList !=null;
		assertNotNull(propList);
		assertNotEquals(0, propList.size());
	}

	@Test
	void testSelectProperty() {
		for(int i=1; i<=2000; i++) {
			PropertyVO vo = dao.selectProperty("GLOBAL_DB_NAME");
			assertNotNull(vo);
		}
	}

	@Test
	void testUpdateProperty() {
		PropertyVO modifyProp = new PropertyVO();
		modifyProp.setPropertyName("errors.integer");
		modifyProp.setPropertyValue("modified value");
		int rowcnt=dao.updateProperty(modifyProp);
		assertEquals(1, rowcnt);
		
		modifyProp.setPropertyName("asdfdsag");
		modifyProp.setPropertyValue("modified value");
		rowcnt=dao.updateProperty(modifyProp);
		assertEquals(0, rowcnt);
	}

	@Test
	void testDeleteProperty() {
		int rowcnt = dao.deleteProperty("DICT.BASE");
		assertEquals(1, rowcnt);
	}

}
