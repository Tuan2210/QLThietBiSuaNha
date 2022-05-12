package com.se.security.demo.service;

import java.util.List;

import com.se.security.demo.entity.Product;

public interface ProductService {
	public Product getProductById(int id);

	public List<Product> getProductsByPage(Integer offset, Integer maxResults, String title);
	
	public List<Product> getProducts();
	
	public Long count(String title);

	public List<String> search(String keyword);
}
