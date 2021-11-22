package dao;
//데이터베이스를 연결해주지만 지금은 데이터베이스 역할을 하고있음
import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Product phone = new Product("P1234","iphone12 Pro", 1340000);
		phone.setDescription("4.7-inch, 1334X750 Retina HD display, "+"8-megapixel iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook =new Product("P1235","LG PC 洹몃옩",1500000);
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation"+ "Inter Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet =new Product("P1236","Galaxy Tab S",900000);
		tablet.setDescription("212.8 * 125.6*6mm, Super AMOLED display,"+ "Octa-Core processors");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsoung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
		
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			// �긽�뭹�씠 議댁옱�븯硫� 怨꾩냽�빐�꽌 異쒕젰�빐以��떎. �뾾�쑝硫� 釉뚮젅�씠�겕媛� 嫄몃┛�떎.
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
