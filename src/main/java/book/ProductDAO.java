package book;

import java.util.ArrayList;

public class ProductDAO {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductDAO instance = new ProductDAO();

	// 신규 상품데이터를 저장하는 메소드 만들기(1)
	public static ProductDAO getInstance() {
		return instance;
	}

	public ProductDAO() {
		Product house = new Product("P1234","26층 나무 집",10800);
		house.setAuthor("앤디 그리피스");
		house.setDescription("『26층 나무 집』은 각종 상을 휩쓸며 독자들의 사랑을 받은《13층 나무 집》의 후속작으로,"
				+ " 글을 쓰는 앤디와 그림을 그리는 테리가 13층 나무 집을 ‘26층 나무 집’으로 올려 짓고 더 흥미진진한 이야기로 돌아왔다."
				+ " 범퍼카 경기장, 스케이트보드 연습장, 진흙탕 경기장, 반중력 방, 자동 판박이 기계, 78가지 맛 아이스크림 가게,"
				+ " 죽음의 미로 등 재미난 놀 거리와 맛나는 먹을거리가 새로 생겼고, 이번에도 앤디와 테리는 큰코 씨의 원고 독촉을 받는다."
				+ " 앤디가 테리와의 첫 만남을 쓰기로 마음먹자마자 테리의 더러운 팬티를 먹은 상어들이 아프면서 한바탕 난리가 나고,"
				+ " 그 와중에 이야기는 정신없이 흘러가는데…….");
		house.setPublisher("시공주니어");
		house.setCategory("초등");
		house.setUnitsInStock(1000);
		house.setTotalpages(352);
		house.setReleaseDate("2015.07.20");
		house.setCountry("해외");
		house.setB_condition("New");
		house.setB_filename("P1234.jpg");
		
		Product cris = new Product("P1235","다섯 밤만 더 자면 크리스마스",13500);
		cris.setAuthor("지미 팰런");
		cris.setDescription("미국 NBC‘더 투나잇 쇼’진행자 지미 팰런의 그림책\r\n"
				+ "크리스마스까지\r\n"
				+ "다섯 밤, 네 밤, 세 밤, 두 밤 그리고 하룻밤…….\r\n"
				+ "크리스마스를 기다리는 아이의 콩닥콩닥 설레임을 느껴보세요!");
		cris.setPublisher("우리동네책공장");
		cris.setCategory("유아");
		cris.setUnitsInStock(900);
		cris.setTotalpages(48);
		cris.setReleaseDate("2022.12.20");
		cris.setCountry("해외");
		cris.setB_condition("Refurbished");
		cris.setB_filename("P1235.jpg");
		
		Product python = new Product("P1236","Do it! 첫 파이썬",9000);
		python.setAuthor("엘리스 코딩");
		python.setDescription("초등 고학년부터 필수인 코딩, 주인공 ‘엘리스 토끼’와 함께 게임하듯 배우세요."
				+ " 176가지 그림과 45가지 코딩 문제를 풀다 보면 코딩 능력과 컴퓨팅 사고력을 동시에 기를 수 있답니다."
				+ " 이 책은 서울대, 카이스트 출신 교육진, 7만 명의 수강생이 검증한 온라인 플랫폼 ‘엘리스 코딩’에서 직접 집필한 책으로, "
				+ "인터넷만 되면 바로 실습할 수 있어 실습 편리성과 교육 효과 모두 탁월합니다. 마지막 과제인 ‘점심 메뉴 추첨기’ 프로그램까지 "
				+ "만들면 ‘파이썬 이수증’도 드립니다. 제대로 설계된 코딩 교육 콘텐츠를 찾는 학생·학부모·선생님은 물론, "
				+ "코딩 공부가 처음인 코딩 초보자도 이 책으로 시작하세요!");
		python.setPublisher("이지스퍼블리싱");
		python.setCategory("중등");
		python.setUnitsInStock(1100);
		python.setTotalpages(268);
		python.setReleaseDate("2020.04.24");
		python.setCountry("국내");
		python.setB_condition("E-Book");
		python.setB_filename("P1236.jpg");
		
		listOfProducts.add(house);
		listOfProducts.add(cris);
		listOfProducts.add(python);	
		
		}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	// 상세정보를 가져오는 메소드 만들기
	public Product getProductById(String bookID) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if (product != null && product.getBookID() != null && product.getBookID().equals(bookID)) {
				productById = product;
				break;
			}
		}
		return productById;
	}

	// 신규 상품데이터를 저장하는 메소드 만들기(2)
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

}