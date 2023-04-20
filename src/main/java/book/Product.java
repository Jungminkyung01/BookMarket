package book;

public class Product {

	private String bookID;	//�������̵�
	private String bookName;	//��ǰ��
	private Integer unitPrice;	//��ǰ ����
	private String author;	//����
	private String description;	//����
	private String publisher;	//���ǻ�
	private String category;	//�з�
	private long unitsInStock;	//��� ��
	private long totalpages;	//������ ��
	private String releaseDate;	//������
	private String country;
	private String b_condition;	//�ű� or �߰� or E-Book
	private String b_filename;	//�̹��� ���ϸ�
	private int quantity;	//��ٱ��Ͽ� ���� ����
	
	public Product() {
		super();
	}
	
	public Product(String bookID, String bookName, Integer unitPrice) {
		this.bookID = bookID;
		this.bookName = bookName;
		this.unitPrice = unitPrice;
	}



	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public long getTotalpages() {
		return totalpages;
	}
	public void setTotalpages(long totalpages) {
		this.totalpages = totalpages;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getB_condition() {
		return b_condition;
	}
	public void setB_condition(String b_condition) {
		this.b_condition = b_condition;
	}
	public String getB_filename() {
		return b_filename;
	}
	public void setB_filename(String b_filename) {
		this.b_filename = b_filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	
	
}
