package book;

import java.util.ArrayList;

public class ProductDAO {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductDAO instance = new ProductDAO();

	// �ű� ��ǰ�����͸� �����ϴ� �޼ҵ� �����(1)
	public static ProductDAO getInstance() {
		return instance;
	}

	public ProductDAO() {
		Product house = new Product("P1234","26�� ���� ��",10800);
		house.setAuthor("�ص� �׸��ǽ�");
		house.setDescription("��26�� ���� ������ ���� ���� �۾��� ���ڵ��� ����� ������13�� ���� ������ �ļ�������,"
				+ " ���� ���� �ص�� �׸��� �׸��� �׸��� 13�� ���� ���� ��26�� ���� �������� �÷� ���� �� ��������� �̾߱�� ���ƿԴ�."
				+ " ����ī �����, ������Ʈ���� ������, ������ �����, ���߷� ��, �ڵ� �ǹ��� ���, 78���� �� ���̽�ũ�� ����,"
				+ " ������ �̷� �� ��̳� �� �Ÿ��� ������ �����Ÿ��� ���� �����, �̹����� �ص�� �׸��� ū�� ���� ���� ������ �޴´�."
				+ " �ص� �׸����� ù ������ ����� �������ڸ��� �׸��� ������ ��Ƽ�� ���� ������ �����鼭 �ѹ��� ������ ����,"
				+ " �� ���߿� �̾߱�� ���ž��� �귯���µ�����.");
		house.setPublisher("�ð��ִϾ�");
		house.setCategory("�ʵ�");
		house.setUnitsInStock(1000);
		house.setTotalpages(352);
		house.setReleaseDate("2015.07.20");
		house.setCountry("�ؿ�");
		house.setB_condition("New");
		house.setB_filename("P1234.jpg");
		
		Product cris = new Product("P1235","�ټ� �㸸 �� �ڸ� ũ��������",13500);
		cris.setAuthor("���� �ӷ�");
		cris.setDescription("�̱� NBC���� ������ ������� ���� �ӷ��� �׸�å\r\n"
				+ "ũ������������\r\n"
				+ "�ټ� ��, �� ��, �� ��, �� �� �׸��� �Ϸ�㡦��.\r\n"
				+ "ũ���������� ��ٸ��� ������ ������ �������� ����������!");
		cris.setPublisher("�츮����å����");
		cris.setCategory("����");
		cris.setUnitsInStock(900);
		cris.setTotalpages(48);
		cris.setReleaseDate("2022.12.20");
		cris.setCountry("�ؿ�");
		cris.setB_condition("Refurbished");
		cris.setB_filename("P1235.jpg");
		
		Product python = new Product("P1236","Do it! ù ���̽�",9000);
		python.setAuthor("������ �ڵ�");
		python.setDescription("�ʵ� ���г���� �ʼ��� �ڵ�, ���ΰ� �������� �䳢���� �Բ� �����ϵ� ��켼��."
				+ " 176���� �׸��� 45���� �ڵ� ������ Ǯ�� ���� �ڵ� �ɷ°� ��ǻ�� ������ ���ÿ� �⸦ �� �ִ�ϴ�."
				+ " �� å�� �����, ī�̽�Ʈ ��� ������, 7�� ���� �������� ������ �¶��� �÷��� �������� �ڵ������� ���� ������ å����, "
				+ "���ͳݸ� �Ǹ� �ٷ� �ǽ��� �� �־� �ǽ� ������ ���� ȿ�� ��� Ź���մϴ�. ������ ������ ������ �޴� ��÷�⡯ ���α׷����� "
				+ "����� �����̽� �̼������� �帳�ϴ�. ����� ����� �ڵ� ���� �������� ã�� �л����кθ𡤼������� ����, "
				+ "�ڵ� ���ΰ� ó���� �ڵ� �ʺ��ڵ� �� å���� �����ϼ���!");
		python.setPublisher("�������ۺ���");
		python.setCategory("�ߵ�");
		python.setUnitsInStock(1100);
		python.setTotalpages(268);
		python.setReleaseDate("2020.04.24");
		python.setCountry("����");
		python.setB_condition("E-Book");
		python.setB_filename("P1236.jpg");
		
		listOfProducts.add(house);
		listOfProducts.add(cris);
		listOfProducts.add(python);	
		
		}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	// �������� �������� �޼ҵ� �����
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

	// �ű� ��ǰ�����͸� �����ϴ� �޼ҵ� �����(2)
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

}