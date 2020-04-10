package restaurant;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

class RestaurantDaoTest {
	RestaurantDao rdao = new RestaurantDao();
	List<Map<String,Object>> rList = rdao.proc_mapRestList();
	@Test
	void testProc_restList() {
		//assertEquals(5, rdao.proc_restList().size());
		assertSame(rList, rdao.proc_mapRestList());
	}

	@Test
	void testProc_mapRestList() {

	}

}
