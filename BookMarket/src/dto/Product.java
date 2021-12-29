package dto;

import java.io.Serializable;

public class Product implements Serializable {
	//원본여부확인번호
	private static final long serialVersionUID = 1L;
	
	private String productId; //ISBN
	private String pname; //도서 제목
	private String pwriter; //작가
	private int unitPrice; //판매가
	private String category; //카테고리
	private String publisher; //출판사
	private String publishDate; //출판일자
	private String description; //한 줄 소개
	private long unitsInStock; //재고 수
	private String filename; //이미지 파일명
	private int quantity; //장바구니에 담은 갯수
	
	//생성자
	public Product() {}
	public Product(String pname, String productId, Integer unitPrice) {
		this.pname = pname;
		this.productId = productId;
		this.unitPrice = unitPrice;
	}
	
	//getters/setters
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPwriter() {
		return pwriter;
	}
	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}	
	
}