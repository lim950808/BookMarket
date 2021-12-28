package dao;

import java.util.ArrayList;
import java.util.List;

import dto.Product;
//싱글톤으로 생성
public class ProductRepository {
//자신타입의 private static 필드 선언 
private static ProductRepository instance = new ProductRepository();
//public 접근지정자를 가진 getInstance메소드 선언
public static ProductRepository getInstance() {
	return instance;
}
//필드
private ArrayList<Product> listOfProducts = new ArrayList<>();
//생성자 private
	public ProductRepository() {
		Product product1 = new Product("A1001", "Do it! 점프 투 파이썬", 16920);
		product1.setPwriter("박응용");
		product1.setCategory("프로그래밍 언어");
		product1.setPublisher("이지스퍼블리싱");
		product1.setPublishDate(2019-06-20);
		product1.setDescription("문과생도 중고등학생도 직장인도 프로그래밍에 눈뜨게 만든 바로 그 책이 전면 개정판으로 새로 태어났다!");
		product1.setUnitsInStock(1000);
		product1.setFilename("");

/*		Product product2 = new Product("A2001", "직장인을 위한 실무 엑셀", 18900);
		product2.setPwriter("선양미");
		product2.setCategory("오피스 활용");
		product2.setPublisher("길벗");
		product2.setPublishDate(2019-03-04);
		product2.setDescription("Office 365, 엑셀 2010부터 2016 버전까지 모든 버전에서 사용 가능한 실무 예제로, 업무를 빠르게 처리할 수 있는 필수 팁만 쏙쏙 뽑아 알려준다.");
		product2.setUnitsInStock(1000);
		product2.setFilename("");
		
		Product product3 = new Product("A3001", "데이터 중심 애플리케이션 설계", 32400);
		product3.setPwriter("마틴 클레프만");
		product3.setCategory("OS/ 데이터베이스");
		product3.setPublisher("위키북스");
		product3.setPublishDate(2018-04-12);
		product3.setDescription("어떤 선택이 애플리케이션에 적합한가? 이 유행어들을 얼마나 이해하고 있는가?");
		product3.setUnitsInStock(1000);
		product3.setFilename("");


		listOfProducts.add(product1);
		listOfProducts.add(product2);
		listOfProducts.add(product3); */
		
		
	}
	
	//상품 리스트 출력 메소드
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	//상품 리스트 출력 메소드
	//상품 id로 상품 상세정보 얻기
		 public List<Product> getProductByCategory(String category) {
			 List<Product> list = new ArrayList<Product>();
		    for(int i=0;i<listOfProducts.size();i++) {
		    	 Product product = listOfProducts.get(i);
		    	 if(product !=null && product.getCategory()!=null && product.getCategory().equals(category)) {
		    		   list.add(product);
		    		 
				 }
			}
		return list;
		}
		
	
	//상품 id로 상품 상세정보 얻기
	 public Product getProductById(String productId) {
		 Product productById = null;
	    for(int i=0;i<listOfProducts.size();i++) {
	    	 Product product = listOfProducts.get(i);
	    	 if(product !=null && product.getProductId()!=null && product.getProductId().equals(productId)) {
	    		 productById = product;
	    		 break;
			 }
		}
	return productById;
	}
	 
	 //상품등록
	 public void addProduct(Product product) {
		 listOfProducts.add(product);
	 }

	 public List<Product> getProductByCategory() {
		 List<Product> list = new ArrayList<Product>();
	    for(int i=0;i<listOfProducts.size();i++) {
	    	 Product product = listOfProducts.get(i);
	    	
	    		   list.add(product);
		}
	return list;
	}

}